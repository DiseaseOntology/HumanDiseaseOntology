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

DM = src/ontology/doid-merged

# to make a release, use `make release`
# to update imports, use `make imports`
# to do both, use `make all`

release: | report build merged simple human subsets publish report-new
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

report-last: $(QUERIES)
.PHONY: $(QUERIES)
$(QUERIES):
	$(ROBOT) query --input $(DM).owl\
	 --query $@ $(subst src/sparql,build,$(subst .rq,-last.tsv,$(@)))

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json

# release vars
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT)
	$(ROBOT) reason --create-new-ontology false \
	 --annotate-inferred-axioms true --exclude-duplicate-axioms true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid.owl" --output $@
	 
# OWL -> OBO does weird things to the date
# Do not annotate OWL file until after conversion
$(DO).obo: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true \
	convert --check false \
	annotate --annotation oboInOwl:date "$(TS)" --output $@ && \
	$(ROBOT) annotate --input $<\
	 --annotation oboInOwl:date "$(TS)" --output $<.temp \
	&& grep -v ^owl-axioms $<.temp > $< \
	&& rm $<.temp

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

DNC = src/ontology/doid-non-classified
HD = src/ontology/HumanDO

human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(DS).owl
	$(ROBOT) remove --input $< --axioms logical --trim true \
	annotate --ontology-iri "$(OBO)doid/doid-non-classified.owl"\
	 --version-iri "$(OBO)doid/releases/$(DATE)/doid-non-classified.owl"\
	 --output $@ && \
	annotate --input $@ --ontology-iri "http://purl.obolibrary.org/obo/doid/HumanDO.owl"\
	 --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/HumanDO.owl"\
	 --output $(HD).owl


$(DNC).obo: $(DNC).owl
	$(ROBOT) convert --input $< --output $@ --check false && cp $@ $(HD).obo

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

.PHONY: subsets
subsets: $(SUBS)

$(SUBS): $(DS).owl
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
# FINAL REPORT
# ----------------------------------------

# pre-build queries
QUERIES_2 := $(wildcard src/sparql/*-report.rq)

report-new: $(QUERIES_2)
.PHONY: $(QUERIES_2)
$(QUERIES_2):
	$(ROBOT) query --input $(DM).owl\
	 --query $@ $(subst src/sparql,build,$(subst .rq,-new.tsv,$(@)))
