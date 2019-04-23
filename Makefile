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

release: publish counts
all: imports release
test: verify

# ----------------------------------------
# ROBOT
# ----------------------------------------

mk: 
	@mkdir -p build && mkdir -p build/reports

build/robot.jar: mk
	@curl -L -o build/robot.jar\
	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := java -jar build/robot.jar

# ----------------------------------------
# IMPORTS
# ----------------------------------------

# You can run `make <import name>` from the `ontology` dir
# or the `ontology/imports` dir

.PHONY: imports
imports: | build/robot.jar
	@echo "Generating import modules (this may take some time)..." && \
	cd src/ontology/imports && $(MAKE) imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS): | build/robot.jar
	@cd src/ontology/imports && $(MAKE) $@

# ----------------------------------------
# PRE-BUILD REPORT
# ----------------------------------------

report: build/reports/report.tsv

.PHONY: build/reports
build/reports:
	@mkdir -p $@

# Report for general issues on doid-edit

.PRECIOUS: build/reports/report.tsv
build/reports/report.tsv: $(EDIT) verify-edit | build/robot.jar build/reports
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

$(DO).owl: $(EDIT) build/reports/report.tsv | build/robot.jar
	@$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	annotate --annotation oboInOwl:date "$(TS)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)" --output $@ && \
	echo "Created $@"

$(DO).obo: $(DO).owl | build/robot.jar
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select "anonymous" \
	remove --term obo:IAO_0000119 --trim true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo | \
	grep -v ^date | \
	perl -lpe 'print "date: $(TS)" if $$. == 3'  > $@ && \
	rm $(basename $@)-temp.obo && echo "Created $@"

$(DO).json: $(DO).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo

$(DM).owl: $(DO).owl | build/robot.jar
	@$(ROBOT) merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/$(notdir $@)"\
	 --output $@ && \
	echo "Created $@"

$(DM).obo: $(DM).owl | build/robot.jar
	@$(ROBOT) remove --input $< --term obo:IAO_0000119 --trim true \
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

$(DNC).owl: $(EDIT) | build/robot.jar
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select anonymous \
	annotate --ontology-iri "$(OBO)doid/$(notdir $@)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/$(notdir $@)"\
	 --output $@ && \
	cp $@ $(HD).owl \
	&& echo "Created $@"

$(DNC).obo: $(EDIT) | build/robot.jar
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


$(DNC).json: $(DNC).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB = src/ontology/subsets/
SUB_NAMES = DO_AGR_slim DO_FlyBase_slim DO_MGI_slim DO_cancer_slim DO_rare_slim GOLD\
 NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease
SUBS = $(foreach N,$(SUB_NAMES),$(addprefix $(SUB), $(N)))
OWL_SUBS = $(foreach N,$(SUBS),$(addsuffix .owl, $(N)))
OBO_SUBS = $(foreach N,$(SUBS),$(addsuffix .obo, $(N)))
JSON_SUBS = $(foreach N,$(SUBS),$(addsuffix .json, $(N)))

subsets: $(OWL_SUBS) $(OBO_SUBS) $(JSON_SUBS)

$(OWL_SUBS): $(DNC).owl | build/robot.jar
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@ && \
	echo "Created $@"

$(OBO_SUBS): $(DNC).owl| build/robot.jar
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$(notdir $@)"\
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" --output $@ && \
	echo "Created $@"

$(JSON_SUBS): $(DNC).owl | build/robot.jar
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

counts: build/reports/report-diff.txt build/reports/branch-count.tsv
.PHONY: $(QUERIES)

# Get the last build of DO from IRI
.PHONY: build/doid-last.owl
build/doid-last.owl: | build/robot.jar
	@$(ROBOT) merge --input-iri http://purl.obolibrary.org/obo/doid.owl\
	 --collapse-import-closure true --output $@

$(QUERIES):: build/doid-last.owl | build/robot.jar build/reports
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (previous)" && \
	$(ROBOT) query --input $< --query $@\
	 $(subst src/sparql,build/reports,$(subst .rq,-last.tsv,$(@)))

$(QUERIES):: $(DM).owl | build/robot.jar build/reports
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (current)" && \
	$(ROBOT) query --input $< --query $@ \
	 $(subst src/sparql,build/reports,$(subst .rq,-new.tsv,$(@)))

build/reports/report-diff.txt: $(QUERIES)
	@python build/report-diff.py && \
	cp $@ $(DIR)report-diff.txt && \
	rm $@ && echo "Release diff report available at $(DIR)report-diff.txt"

.PHONY: build/reports/branch-count.tsv
build/reports/branch-count.tsv: $(DNC).owl | build/reports
	@echo "Counting all branches..." && \
	./src/sparql/branch_count/branch_count.py $< $@ && \
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
verify-edit: $(EDIT) | build/robot.jar build/reports
	@echo "Verifying $< (see build/reports on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(EDIT_V_QUERIES) --output-dir build/reports

# Verify doid.obo
verify-do: $(DO).obo | build/robot.jar build/reports
	@echo "Verifying $< (see build/reports on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) --output-dir build/reports

# Verify doid-non-classified.obo
verify-dnc: $(DNC).obo | build/robot.jar build/reports
	@echo "Verifying $< (see build/reports on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) --output-dir build/reports
