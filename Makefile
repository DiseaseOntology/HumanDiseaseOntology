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
	@cd src/ontology/imports && $(MAKE) imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS): | build/robot.jar
	@cd src/ontology/imports && $(MAKE) $@

# ----------------------------------------
# PRE-BUILD REPORT
# ----------------------------------------

report: build/reports/report.tsv

# Report for general issues on doid-edit

.PRECIOUS: build/reports/report.tsv
build/reports/report.tsv: $(EDIT) verify-edit | build/robot.jar
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
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT) build/reports/report.tsv | build/robot.jar
	@$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	annotate --annotation oboInOwl:date "$(TS)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid.owl" --output $@ && \
	echo "Created $@"

$(DO).obo: $(DO).owl | build/robot.jar
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select "anonymous" \
	convert --check false --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo > $@ && \
	rm $(basename $@)-temp.obo && \
	echo "Created $@"

$(DO).json: $(DO).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo

$(DM).owl: $(DO).owl | build/robot.jar
	@$(ROBOT) merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid-merged.owl"\
	 --ontology-iri "$(OBO)doid/doid-merged.owl"\
	 --output $@ && \
	echo "Created $@"

$(DM).obo: $(DM).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@ --check false \
	&& echo "Created $@"

# ----------------------------------------
# HUMANDO
# ----------------------------------------

human: $(DNC).owl $(DNC).obo $(DNC).json

# Generate from EDIT file to avoid asserted inferences

$(DNC).owl: $(EDIT) build/reports/report.tsv | build/robot.jar
	@$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select anonymous \
	annotate --ontology-iri "$(OBO)doid/doid-non-classified.owl"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid-non-classified.owl"\
	 --output $@ && \
	cp $@ $(HD).owl \
	&& echo "Created $@"

$(DNC).obo: $(DNC).owl | build/robot.jar
	@$(ROBOT) convert --input $< --check false\
	 --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo > $@ && \
	rm $(basename $@)-temp.obo && \
	cp $@ $(HD).obo \
	&& echo "Created $@"

$(DNC).json: $(DNC).owl | build/robot.jar
	@$(ROBOT) convert --input $< --output $@ \
	&& echo "Created $@"

# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB = src/ontology/subsets/
SUBS = DO_AGR_slim DO_FlyBase_slim DO_MGI_slim DO_cancer_slim DO_rare_slim GOLD\
 NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease

subsets: $(SUBS)

# Generate subsets (specified by SUBS)

$(SUBS): $(DNC).owl | build/robot.jar
	@$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $@)> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$@.owl"\
	 --ontology-iri "$(OBO)doid/subsets/$@.owl"\
	 --output $(addprefix $(SUB), $(addsuffix .owl, $@)) && \
	$(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .obo, $@)) --check false && \
	$(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .json, $@)) && \
	echo "Created subset: $@"

# ----------------------------------------
# RELEASE
# ----------------------------------------

DIR = src/ontology/releases/$(DATE)/

# Move release files to a new dir

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DM).owl $(DM).obo $(DNC).owl $(DNC).obo $(SUBS)
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

counts: build/reports/report-diff.txt
.PHONY: $(QUERIES)

# Get the last build of DO from IRI
.PHONY: build/doid-last.owl
build/doid-last.owl: | build/robot.jar
	@$(ROBOT) merge --input-iri http://purl.obolibrary.org/obo/doid.owl\
	 --collapse-import-closure true --output $@

$(QUERIES):: build/doid-last.owl | build/robot.jar
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (previous)" && \
	$(ROBOT) query --input $< --query $@\
	 $(subst src/sparql,build/reports,$(subst .rq,-last.tsv,$(@)))

$(QUERIES):: $(DM).owl | build/robot.jar
	@echo "Counting: $(patsubst src/sparql/%-report.rq,%,$@) (current)" && \
	$(ROBOT) query --input $< --query $@ \
	 $(subst src/sparql,build/reports,$(subst .rq,-new.tsv,$(@)))

build/reports/report-diff.txt: $(QUERIES)
	@python build/report-diff.py && \
	cp $@ $(DIR)report-diff.txt && \
	rm $@ && echo "Release diff report available at $(DIR)report-diff.txt"

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
verify-edit: $(EDIT) | build/robot.jar
	@echo "Verifying $< (see build/reports on error)" && \
	$(ROBOT) verify --input $<\
	 --queries $(EDIT_V_QUERIES) --output-dir build/reports

# Verify doid.obo
verify-do: $(DO).obo | build/robot.jar
	@$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) --output-dir build/reports

# Verify doid-non-classified.obo
verify-dnc: $(DNC).obo | build/robot.jar
	@$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) --output-dir build/reports
