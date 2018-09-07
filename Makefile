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

#release: build/robot.jar | report products publish counts verify
release: report products publish counts verify
#all: build/robot.jar | imports release
all: imports release
#test: build/robot.jar | verify
test: verify

# ----------------------------------------
# ROBOT
# ----------------------------------------

# mk: 
# 	mkdir -p build

.PHONY: build/robot.jar
build/robot.jar:
	curl -L -o build/robot.jar\
	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := java -jar build/robot.jar

# ----------------------------------------
# IMPORTS
# ----------------------------------------

# You can run `make <import name>` from the `ontology` dir
# or the `ontology/imports` dir

.PHONY: imports
imports: # build/robot.jar
	cd src/ontology/imports && $(MAKE) imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS):
	cd src/ontology/imports && $(MAKE) $@

# ----------------------------------------
# PRE-BUILD REPORT
# ----------------------------------------

report: build/reports/report.tsv

# Report for general issues on doid-edit

build/reports/report.tsv: $(EDIT)
	$(ROBOT) report --input $< --fail-on none\
	 --output $@ --format tsv

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json # build/robot.jar
products: | build merged human subsets

# release vars
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT)
	$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms false --exclude-duplicate-axioms true \
	annotate --annotation oboInOwl:date "$(TS)"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid.owl" --output $@

$(DO).obo: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select "anonymous" \
	convert --check false --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo > $@ && \
	rm $(basename $@)-temp.obo

$(DO).json: $(DO).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo

$(DM).owl: $(DO).owl
	$(ROBOT) merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid-merged.owl"\
	 --ontology-iri "$(OBO)doid/doid-merged.owl"\
	 --output $@

$(DM).obo: $(DM).owl
	$(ROBOT) convert --input $< --output $@ --check false

# ----------------------------------------
# HUMANDO
# ----------------------------------------

human: $(DNC).owl $(DNC).obo $(DNC).json

# Generate from EDIT file to avoid asserted inferences

$(DNC).owl: $(EDIT)
	$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "parents equivalents" --select anonymous \
	annotate --ontology-iri "$(OBO)doid/doid-non-classified.owl"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid-non-classified.owl" --output $@ && \
	cp $@ $(HD).owl

$(DNC).obo: $(DNC).owl
	$(ROBOT) convert --input $< --check false\
	 --output $(basename $@)-temp.obo && \
	grep -v ^owl-axioms $(basename $@)-temp.obo > $@ && \
	rm $(basename $@)-temp.obo && \
	cp $@ $(HD).obo

$(DNC).json: $(DNC).owl
	$(ROBOT) convert --input $< --output $@

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

$(SUBS): $(DNC).owl
	$(ROBOT) filter --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $@)> annotations" \
	annotate --version-iri "$(OBO)doid/$(DATE)/subsets/$@.owl"\
	 --ontology-iri "$(OBO)doid/subsets/$@.owl"\
	 --output $(addprefix $(SUB), $(addsuffix .owl, $@)) && \
	$(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .obo, $@)) --check false && \
	$(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .json, $@))

# ----------------------------------------
# RELEASE
# ----------------------------------------

DIR = src/ontology/releases/$(DATE)/

# Move release files to a new dir

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DM).owl $(DM).obo $(DNC).owl $(DNC).obo $(SUBS)
	mkdir $(DIR) && \
	cp $(DO).* $(DIR) && \
	cp $(DM).* $(DIR) && \
	cp $(DNC).* $(DIR) && \
	mkdir $(DIR)subsets && \
	cp -r $(SUB) $(DIR)subsets

# ----------------------------------------
# POST-BUILD REPORT
# ----------------------------------------

# Count classes, imports, and logical defs from old and new

QUERIES := $(wildcard src/sparql/*-report.rq)

counts: $(QUERIES) | build/reports/report-diff.txt
.PHONY: $(QUERIES)

$(QUERIES):: 
	$(ROBOT) merge --input-iri http://purl.obolibrary.org/obo/doid.owl\
	 --collapse-import-closure true \
	query --query $@ $(subst src/sparql,build/reports,$(subst .rq,-last.tsv,$(@)))

$(QUERIES)::
	$(ROBOT) query --input $(DM).owl\
	 --query $@ $(subst src/sparql,build/reports,$(subst .rq,-new.tsv,$(@)))

.PHONY: build/reports/report-diff.txt
build/reports/report-diff.txt:
	cd build && python report-diff.py

#-----------------------------
# Ensure proper OBO structure
#-------------------------------

V_QUERIES := $(wildcard src/sparql/verify-*.rq)
DNC_V_QUERIES := src/sparql/dnc-verify-connectivity.rq
    # We are not reduced to single inheritence in DNC
    # Once this is cleaned up, we can change to all DNC verifications
#DNC_V_QUERIES := $(wildcard src/sparql/dnc-verify-*.rq)

verify: verify-do verify-dnc

# First, verify doid.obo
verify-do: $(DO).obo
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) --output-dir build/reports

# Then, verify doid-non-classified.obo
verify-dnc: $(DNC).obo
	$(ROBOT) verify --input $<\
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) --output-dir build/reports
