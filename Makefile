# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:

DO = src/ontology/doid
EDIT = src/ontology/doid-edit.owl
OBO = http://purl.obolibrary.org/obo/

# Other products
DM = src/ontology/doid-merged
DNC = src/ontology/doid-non-classified
HD = src/ontology/HumanDO

# to make a release, use `make release`
# to update imports, use `make imports`
# to do both, use `make all`

release: verify products publish post
all: imports release
test: reason build/reports/report.tsv verify-edit

# ----------------------------------------
# ROBOT
# ----------------------------------------

init: build

build build/reports:
	mkdir -p $@

# run `make update_robot` to get a new version of ROBOT
.PHONY: update_robot
update_robot:
	rm -rf build/robot.jar && make build/robot.jar

build/robot.jar: init
	curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.6.0/robot.jar

# ROBOT with Reason logging suppressed
ROBOT := java -jar build/robot.jar

# ----------------------------------------
# IMPORTS
# ----------------------------------------

# You can run `make <import name>` from the `ontology` dir
# or the `ontology/imports` dir

.PHONY: imports
imports: | build/robot.jar
	@echo "Generating import modules (this may take some time)..."
	@cd src/ontology/imports && make imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS): | build/robot.jar
	@echo "Generating $@ import module..."
	@cd src/ontology/imports && make $@

# ----------------------------------------
# PRE-BUILD TESTS
# ----------------------------------------

report: build/reports/report.tsv

# Report for general issues on doid-edit

.PHONY: build/reports/report.tsv
.PRECIOUS: build/reports/report.tsv
build/reports/report.tsv: $(EDIT) | build/robot.jar build/reports
	@echo ""
	@$(ROBOT) report --input $< \
	 --profile src/sparql/report/report_profile.txt \
	 --labels true --output $@
	@echo "Full DO QC report available at $@"
	@echo ""


# Simple reasoning test
reason: $(EDIT)
	@$(ROBOT) reason --input $<
	@echo "Reasoning completed successfully!"

# ----------------------------------------
# BRITISH SYNONYMS
# ----------------------------------------

# Add British synonyms from DO labels and exact synonyms
# This script requires `pandas` module: `python3 -m pip install pandas`

# Script and pipeline adapted from https://github.com/obophenotype/human-phenotype-ontology

build/british_english_dictionary.csv: | build
	curl -Lk -o $@ https://raw.githubusercontent.com/obophenotype/human-phenotype-ontology/master/src/ontology/hpo_british_english_dictionary.csv

build/synonyms.csv: $(EDIT) src/sparql/doid_synonyms.rq | build
	@echo "Retrieving DO synonyms..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/labels.csv: $(EDIT) src/sparql/doid_labels.rq | build
	@echo "Retrieving DO labels..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/be_synonyms.csv: src/util/compute_british_synonyms.py build/labels.csv build/synonyms.csv \
build/british_english_dictionary.csv
	@echo "Building synonyms template..."
	@python3 $^ $@

build/british_synonyms.owl: $(EDIT) build/be_synonyms.csv 
	@$(ROBOT) template --input $< --template $(word 2,$^) --output $@

add_british_synonyms: $(EDIT) build/british_synonyms.owl
	@$(ROBOT) merge --input $< --input $(word 2,$^) --collapse-import-closure false --output doid-edit.ofn \
	&& mv doid-edit.ofn $(EDIT)
	@echo "British synonyms added to $(EDIT)!"

# ----------------------------------------
# RELEASE
# ----------------------------------------

products: subsets human merged build

# release vars
TS = $(shell date +'%d:%m:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT) build/reports/report.tsv | build/robot.jar
	@$(ROBOT) reason \
	 --input $< \
	 --create-new-ontology false \
	 --annotate-inferred-axioms false \
	 --exclude-duplicate-axioms true \
	annotate \
	 --annotation oboInOwl:date "$(TS)" \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --output $@
	@echo "Created $@"

$(DO).obo: $(DO).owl | build/robot.jar
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim true \
	remove \
	 --select "parents equivalents" \
	 --select "anonymous" \
	query \
	 --update src/sparql/remove-ref-type.ru \
	annotate \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --output $(basename $@)-temp.obo
	@grep -v ^owl-axioms $(basename $@)-temp.obo | \
	grep -v ^date | \
	perl -lpe 'print "date: $(TS)" if $$. == 3'  > $@
	@rm $(basename $@)-temp.obo
	@echo "Created $@"

$(DO).json: $(DO).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo

$(DM).owl: $(DO).owl | build/robot.jar
	@$(ROBOT) merge \
	 --input $< \
	 --collapse-import-closure true \
	annotate \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --output $@
	@echo "Created $@"

$(DM).obo: $(DM).owl | build/robot.jar
	@$(ROBOT) query \
	 --input $< \
	 --update src/sparql/remove-ref-type.ru \
	remove \
	 --select "parents equivalents" \
	 --select "anonymous" \
	annotate \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	convert \
	 --check false \
	 --output $(basename $@)-temp.obo
	@grep -v ^owl-axioms $(basename $@)-temp.obo | \
	grep -v ^date | \
	perl -lpe 'print "date: $(TS)" if $$. == 3' > $@
	@rm $(basename $@)-temp.obo
	@echo "Created $@"

# ----------------------------------------
# HUMANDO
# ----------------------------------------

human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(EDIT) | build/robot.jar
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim true \
	remove \
	 --select "parents equivalents" \
	 --select anonymous \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --output $@
	@cp $@ $(HD).owl
	@echo "Created $@"

$(DNC).obo: $(EDIT) | build/robot.jar
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim true \
	remove \
	 --select "parents equivalents" \
	 --select "anonymous" \
	query \
	 --update src/sparql/remove-ref-type.ru \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --output $(basename $@)-temp.obo
	@grep -v ^owl-axioms $(basename $@)-temp.obo | \
	perl -lpe 'print "date: $(TS)" if $$. == 3' > $@
	@cp $@ $(HD).obo
	@rm $(basename $@)-temp.obo
	@echo "Created $@"


$(DNC).json: $(DNC).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB_NAMES = DO_AGR_slim DO_cancer_slim DO_FlyBase_slim DO_GXD_slim DO_IEDB_slim DO_MGI_slim\
 DO_rare_slim GOLD NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease 
SUBS = $(foreach N,$(SUB_NAMES),$(addprefix src/ontology/subsets/, $(N)))
OWL_SUBS = $(foreach N,$(SUBS),$(addsuffix .owl, $(N)))
OBO_SUBS = $(foreach N,$(SUBS),$(addsuffix .obo, $(N)))
JSON_SUBS = $(foreach N,$(SUBS),$(addsuffix .json, $(N)))

subsets: $(OWL_SUBS) $(OBO_SUBS) $(JSON_SUBS)

$(OWL_SUBS): $(DNC).owl | build/robot.jar
	@$(ROBOT) filter \
	 --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate \
	 --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@
	@echo "Created $@"

src/ontology/subsets/%.obo: src/ontology/subsets/%.owl | build/robot.jar
	@$(ROBOT) query \
	 --input $< \
	 --update src/sparql/remove-ref-type.ru \
	annotate \
	 --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" \
	convert --output $@
	@echo "Created $@"

src/ontology/subsets/%.json: src/ontology/subsets/%.owl | build/robot.jar
	@$(ROBOT) annotate --input $< \
	 --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" \
	convert --output $@
	@echo "Created $@"

# ----------------------------------------
# RELEASE
# ----------------------------------------

DIR = src/ontology/releases/$(DATE)

# Move release files to a new dir

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DO).json\
 $(DM).owl $(DM).obo\
 $(DNC).owl $(DNC).obo $(DNC).json\
 subsets
	@mkdir -p $(DIR)
	@cp $(DO).* $(DIR)
	@cp $(DM).* $(DIR)
	@cp $(DNC).* $(DIR)
	@cp -r src/ontology/subsets $(DIR)
	@echo "Published to $(DIR)"
	@echo ""

# ----------------------------------------
# POST-BUILD REPORT
# ----------------------------------------

# Count classes, imports, and logical defs from old and new

post: build/reports/report-diff.txt build/reports/branch-count.tsv build/reports/removed-axioms.html

# Get the last build of DO from IRI
#.PHONY: build/doid-last.owl
build/doid-last.owl: | build/robot.jar
	@$(ROBOT) merge \
	 --input-iri http://purl.obolibrary.org/obo/doid/doid-merged.owl \
	 --collapse-import-closure true \
	 --output $@

# all report queries
QUERIES := $(wildcard src/sparql/*-report.rq)

# target names for previous release reports
LAST_REPORTS := $(foreach Q,$(QUERIES), $(subst src/sparql,build/reports,$(subst .rq,-last.tsv,$(Q))))
.PHONY: last-reports
last-reports: $(LAST_REPORTS)
build/reports/%-last.tsv: src/sparql/%.rq build/doid-last.owl | build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@

# target names for current release reports
NEW_REPORTS := $(foreach Q,$(QUERIES), $(subst src/sparql,build/reports,$(subst .rq,-new.tsv,$(Q))))
.PHONY: new-reports
new-reports: $(NEW_REPORTS)
build/reports/%-new.tsv: src/sparql/%.rq $(DM).owl | build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@

# create a clean diff between last and current reports
build/reports/report-diff.txt: last-reports new-reports
	@python3 src/util/report-diff.py
	@mv $@ $(DIR)/report-diff.txt
	@echo "Release diff report available at $(DIR)/report-diff.txt"

# create a count of the various disease branches
.PHONY: build/reports/branch-count.tsv
build/reports/branch-count.tsv: $(DNC).owl | build/robot.jar build/reports
	@echo "Counting all branches..."
	@./src/util/branch_count/branch_count.py $< $@
	@echo "Branch count available at $@"

# the following targets are used to build a smaller diff with only removed axioms to review
build/robot.diff: build/doid-last.owl $(DM).owl | build/robot.jar
	@echo "Comparing axioms in previous release to current release"
	@$(ROBOT) diff \
	 --left $< \
	 --right $(word 2,$^) \
	 --labels true --output $@

build/missing-axioms-terms.txt: build/robot.diff
	@python3 src/util/parse-diff.py $< $@

build/doid-last-changed.owl: build/doid-last.owl build/missing-axioms-terms.txt
	@$(ROBOT) filter \
	 --input $< \
	 --term-file $(word 2,$^) \
	 --select "self parents annotations" \
	 --output $@

build/doid-current-changed.owl: $(DM).owl build/missing-axioms-terms.txt
	@$(ROBOT) filter \
	 --input $< \
	 --term-file $(word 2,$^) \
	 --select "self parents annotations" \
	 --output $@

build/reports/removed-axioms.html: build/doid-last-changed.owl build/doid-current-changed.owl | build/reports
	@$(ROBOT) diff \
	 --left $< \
	 --right $(word 2,$^) \
	 --format html \
	 --output $@
	@echo "See $@ to review removed axioms"

#-----------------------------
# Ensure proper OBO structure
#-------------------------------

EDIT_V_QUERIES := $(wildcard src/sparql/edit-verify-*.rq)
V_QUERIES := $(wildcard src/sparql/verify-*.rq)
DNC_V_QUERIES := src/sparql/dnc-verify-connectivity.rq
    # We are not reduced to single inheritence in DNC
    # Once this is cleaned up, we can change to all DNC verifications
#DNC_V_QUERIES := $(wildcard src/sparql/dnc-verify-*.rq)

verify: verify-edit verify-do verify-dnc

# Verify doid-edit.owl
verify-edit: $(EDIT) | build/robot.jar build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(EDIT_V_QUERIES) \
	 --output-dir build/reports

# Verify doid.obo
verify-do: $(DO).obo | build/robot.jar build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(V_QUERIES) \
	 --output-dir build/reports

# Verify doid-non-classified.obo
verify-dnc: $(DNC).obo | build/robot.jar build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) \
	 --output-dir build/reports
