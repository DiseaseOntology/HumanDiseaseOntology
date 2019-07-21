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

BUILD = build/
REPORTS = $(BUILD)reports
EDIT_OBO = $(BUILD)doid-edit-obo.owl

# to make a release, use `make release`
# to update imports, use `make imports`
# to do both, use `make all`

release: publish counts
all: imports release
test: verify

# ----------------------------------------
# ROBOT
# ----------------------------------------

init: $(BUILD)

$(BUILD) $(REPORTS):
	mkdir -p $@

ROBOT_JAR = $(BUILD)robot.jar
robot: $(ROBOT_JAR)

# run `make update_robot` to get a new version of ROBOT
.PHONY: update_robot
update_robot:
	rm -rf $(ROBOT_JAR) && make robot

$(ROBOT_JAR): init
	curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.4.1/robot.jar

ROBOT := java -jar $(ROBOT_JAR)

# ----------------------------------------
# IMPORTS
# ----------------------------------------

# You can run `make <import name>` from the `ontology` dir
# or the `ontology/imports` dir

.PHONY: imports
imports: | $(ROBOT_JAR)
	@echo "Generating import modules (this may take some time)..." && \
	cd src/ontology/imports && $(MAKE) imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS): | $(ROBOT_JAR)
	@cd src/ontology/imports && $(MAKE) $@

# ----------------------------------------
# PRE-BUILD REPORT
# ----------------------------------------

report: $(REPORTS)/report.tsv

# Report for general issues on doid-edit

.PRECIOUS: $(REPORTS)/report.tsv
$(REPORTS)/report.tsv: $(EDIT) verify-edit | $(ROBOT_JAR) $(REPORTS)
	@echo "" && \
	$(ROBOT) report --input $<\
	 --profile src/sparql/report/report_profile.txt\
	 --labels true --output $@ && \
	echo "Full DO QC report available at $@"

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json
products: subsets human merged build

# release vars
TS = $(shell date +'%d:%m:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

# EDIT_OBO removes IAO:0000119 (definition source)
# and replaces it with dbXref annotations on the definition
# this is used to build the OBO files

$(BUILD)dbxrefs.ttl: $(EDIT)
	@$(ROBOT) query --input $< --query src/sparql/add-dbxrefs.rq $(basename $@)-temp.ttl && \
	grep -v ^@prefix $(basename $@)-temp.ttl > $@ && \
	rm $(basename $@)-temp.ttl && \
	echo "Created temp OBO build file: $@"

$(EDIT_OBO): $(EDIT) $(BUILD)dbxrefs.ttl
	@$(ROBOT) --add-prefix "obo: http://purl.obolibrary.org/obo/"\
	 --add-prefix "oboInOwl: http://www.geneontology.org/formats/oboInOwl#" \
	remove --input $< --term IAO:0000119 --output $(basename $@)-temp.ttl && \
	cat $(basename $@)-temp.ttl $(word 2,$^) > $(basename $@).ttl && \
	$(ROBOT) repair --input $(basename $@).ttl --merge-axiom-annotations true \
	convert --format ofn --output $@ && \
	rm $(basename $@)-temp.ttl $(basename $@).ttl && \
	echo "Created temp OBO build file: $@"

# Main OWL Release Product
$(DO).owl: $(EDIT) $(REPORTS)/report.tsv | $(ROBOT_JAR)
	@$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	annotate --annotation oboInOwl:date "$(TS)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" --output $@ && \
	echo "Created $@"

# Main OBO Release Product
$(DO).obo: $(EDIT_OBO) | $(ROBOT_JAR)
	@$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	remove --select imports --trim true \
	remove --select "parents equivalents" --select "anonymous" \
	remove --term obo:IAO_0000119 --trim true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo | \
	grep -v ^date | \
	perl -lpe 'print "date: $(TS)" if $$. == 3'  > $@ && \
	rm $(basename $@)-temp.obo && echo "Created $@"

# Main JSON Release Product
$(DO).json: $(DO).owl | $(ROBOT_JAR)
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo

$(DM).owl: $(DO).owl | $(ROBOT_JAR)
	@$(ROBOT) merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/$(notdir $@)"\
	 --output $@ && \
	echo "Created $@"

$(DM).obo: $(EDIT_OBO) | $(ROBOT_JAR)
	@$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	convert --check false --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo | \
	grep -v ^date | \
	perl -lpe 'print "date: $(TS)" if $$. == 3' > $@ && \
	rm $(basename $@)-temp.obo && echo "Created $@"

# ----------------------------------------
# HUMANDO
# ----------------------------------------

human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(EDIT) | $(ROBOT_JAR)
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select anonymous \
	annotate --ontology-iri "$(OBO)doid/$(notdir $@)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --output $@ && \
	cp $@ $(HD).owl \
	&& echo "Created $@"

$(DNC).obo: $(EDIT_OBO) | $(ROBOT_JAR)
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select "anonymous" \
	remove --term obo:IAO_0000119 --trim true \
	annotate --ontology-iri "$(OBO)doid/$(notdir $@)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" \
	 --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo | \
	perl -lpe 'print "date: $(TS)" if $$. == 3' > $@ && \
	cp $@ $(HD).obo && \
	rm $(basename $@)-temp.obo && echo "Created $@"

# DNC_OBO is used for generating the subsets later
# Otherwise there's an issue with the base prefix
DNC_OBO = $(BUILD)doid-non-classified-obo.owl
$(DNC_OBO): $(DNC).obo
	@$(ROBOT) convert --input $< --output $@ \
	&& sed -i '' 's|$(OBO)doid/doid-non-classified\.obo#|$(OBO)doid#|g' $@ \
	&& echo "Created temp OBO build file: $@"

$(DNC).json: $(DNC).owl | $(ROBOT_JAR)
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB = src/ontology/subsets/
SUB_NAMES = DO_AGR_slim DO_FlyBase_slim DO_MGI_slim DO_cancer_slim DO_rare_slim GOLD\
 NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease DO_GXD_slim
SUBS = $(foreach N,$(SUB_NAMES),$(addprefix $(SUB), $(N)))
OWL_SUBS = $(foreach N,$(SUBS),$(addsuffix .owl, $(N)))
OBO_SUBS = $(foreach N,$(SUBS),$(addsuffix .obo, $(N)))
JSON_SUBS = $(foreach N,$(SUBS),$(addsuffix .json, $(N)))

subsets: $(OWL_SUBS) $(OBO_SUBS) $(JSON_SUBS)

$(OWL_SUBS): $(DNC).owl | $(ROBOT_JAR)
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@ && \
	echo "Created $@"

$(OBO_SUBS): $(DNC_OBO) | $(ROBOT_JAR)
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@ && \
	echo "Created $@"

$(JSON_SUBS): $(DNC).owl | $(ROBOT_JAR)
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@ && \
	echo "Created $@"

# ----------------------------------------
# RELEASE
# ----------------------------------------

DIR = src/ontology/releases/$(DATE)/

# Move release files to a new dir

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DO).json\
 $(DM).owl $(DM).obo\
 $(DNC).owl $(DNC).obo $(DNC).json\
 subsets
	@mkdir -p $(DIR) && \
	cp $(DO).* $(DIR) && \
	cp $(DM).* $(DIR) && \
	cp $(DNC).* $(DIR) && \
	mkdir -p $(DIR)subsets && \
	cp -r $(SUB) $(DIR)subsets && \
	echo "Published to $(DIR)"

# ----------------------------------------
# POST-BUILD REPORT
# ----------------------------------------

# Count classes, imports, and logical defs from old and new

QUERIES := $(wildcard src/sparql/*-report.rq)

counts: $(REPORTS)/report-diff.txt $(REPORTS)/branch-count.tsv
.PHONY: $(QUERIES)

# Get the last build of DO from IRI
.PHONY: build/doid-last.owl
build/doid-last.owl: | $(ROBOT_JAR)
	@$(ROBOT) merge --input-iri http://purl.obolibrary.org/obo/doid.owl\
	 --collapse-import-closure true --output $@

$(QUERIES):: build/doid-last.owl | $(ROBOT_JAR) $(REPORTS)
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (previous)" && \
	$(ROBOT) query --input $< --query $@\
	 $(subst src/sparql,$(REPORTS),$(subst .rq,-last.tsv,$(@)))

$(QUERIES):: $(DM).owl | $(ROBOT_JAR) $(REPORTS)
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (current)" && \
	$(ROBOT) query --input $< --query $@ \
	 $(subst src/sparql,$(REPORTS),$(subst .rq,-new.tsv,$(@)))

$(REPORTS)/report-diff.txt: $(QUERIES)
	@python src/util/report-diff.py && \
	cp $@ $(DIR)report-diff.txt && \
	rm $@ && echo "Release diff report available at $(DIR)report-diff.txt"

.PHONY: $(REPORTS)/branch-count.tsv
$(REPORTS)/branch-count.tsv: $(DNC).owl | $(ROBOT_JAR) $(REPORTS)
	@echo "Counting all branches..." && \
	./src/util/branch_count/branch_count.py $< $@ && \
	echo "Branch count available at $@"

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
verify-edit: $(EDIT) | $(ROBOT_JAR) $(REPORTS)
	@echo "Verifying $< (see $(REPORTS) on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(EDIT_V_QUERIES) --output-dir $(REPORTS)

# Verify doid.obo
verify-do: $(DO).obo | $(ROBOT_JAR) $(REPORTS)
	@echo "Verifying $< (see $(REPORTS) on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) --output-dir $(REPORTS)

# Verify doid-non-classified.obo
verify-dnc: $(DNC).obo | $(ROBOT_JAR) $(REPORTS)
	@echo "Verifying $< (see $(REPORTS) on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) --output-dir $(REPORTS)
