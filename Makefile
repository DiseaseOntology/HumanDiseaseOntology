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

release: | report build merged human subsets publish report-new
all: | imports release

# ----------------------------------------
# ROBOT
# ----------------------------------------

# mk: 
# 	mkdir -p build

# build/robot.jar: | mk
# 	curl -L -o build/robot.jar\
#	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := java -jar build/robot.jar

# ----------------------------------------
# IMPORTS
# ----------------------------------------

# You can run `make <import name>` from the `ontology` dir
# or the `ontology/imports` dir

.PHONY: imports
imports:
	cd src/ontology/imports && $(MAKE) imports

IMPS = bto chebi cl foodon hp ncbitaxon uberon trans so symp full
$(IMPS):
	cd src/ontology/imports && $(MAKE) $@

# ----------------------------------------
# REPORT
# ----------------------------------------

report: build/report.tsv report-last

build/report.tsv: $(EDIT)
	$(ROBOT) report --input $< --fail-on none\
	 --output $@ --format tsv

# pre-build queries
QUERIES := $(wildcard src/sparql/*-report.rq)

.PHONY: report-last
report-last: $(QUERIES)
	$(ROBOT) query --input $(DM).owl\
	 --query $< $(subst src/sparql,build,$(subst .rq,-last.tsv,$(<)))

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json

# release vars
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT)
	$(ROBOT) reason --input $< --create-new-ontology false \
	 --annotate-inferred-axioms true --exclude-duplicate-axioms true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid.owl" --output $@
	 
# OWL -> OBO does weird things to the date
# Do not annotate OWL file until after conversion
$(DO).obo: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "anonymous parents" --select "equivalents" \
	convert --check false --output $(basename $@)-temp.obo && \
	$(ROBOT) annotate --input $(basename $@)-temp.obo\
	 --annotation oboInOwl:date "$(TS)" --output $(basename $@)-temp.obo && \
	$(ROBOT) annotate --input $<\
	 --annotation oboInOwl:date "$(TS)" --output $< && \
	grep -v ^owl-axioms $(basename $@)-temp.obo > $@ && \
	rm $(basename $@)-temp.obo

$(DO).json: $(DO).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

merged: $(DM).owl $(DM).obo $(DM).json

$(DM).owl: $(DO).owl
	$(ROBOT) merge --input $< --collapse-import-closure true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid-merged.owl"\
	 --ontology-iri "$(OBO)doid/doid-merged.owl"\
	 --output $@

$(DM).obo: $(DM).owl
	$(ROBOT) convert --input $< --output $@ --check false

$(DM).json: $(DM).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# HUMANDO
# ----------------------------------------

human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true \
	remove --select "anonymous parents" --select "equivalents" \
	annotate --ontology-iri "$(OBO)doid/doid-non-classified.owl"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid-non-classified.owl" --output $@

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

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DNC).owl $(DNC).obo
	mkdir $(DIR) && \
	cp $(DO)* $(DIR) && \
	cp $(DNC)* $(DIR) && \
	mkdir $(DIR)subsets && \
	cp -r $(SUB) $(DIR)subsets

# ----------------------------------------
# FINAL REPORT
# ----------------------------------------

.PHONY: report-new
report-new: $(QUERIES)
	$(ROBOT) query --input $(DM).owl\
	 --query $< $(subst src/sparql,build,$(subst .rq,-new.tsv,$(<)))
