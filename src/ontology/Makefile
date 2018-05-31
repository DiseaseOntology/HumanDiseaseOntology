# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:

DO = doid
EDIT = doid-edit.owl
OBO = http://purl.obolibrary.org/obo/

# to make a release, use `make release`
# to update imports, use `make imports`
# to add axioms via template, use `make templates`

release: all
all: | report imports build merged simple human subsets publish
.PHONY: imports
imports: cl foodon hp ncbitaxon uberon

# ----------------------------------------
# ROBOT
# ----------------------------------------

# mk: 
# 	mkdir -p build

# build/robot.jar: | mk
# 	curl -L -o build/robot.jar\
#	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := robot
# ROBOT := java -jar build/robot.jar

# ----------------------------------------
# IMPORTS
# ----------------------------------------

IMP = imports/

# Either update all import files at once with `make imports`
# or one at a time with `make <import name>` (e.g. `make cl`)

.PHONY: cl
cl:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term obo:CL_0000000\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --entity GO:0005623 --select "self ancestors" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: foodon
foodon:
	$(ROBOT) extract --input "$(OBO)$@_merged.owl"\
	 --method mireot --upper-term obo:FOODON_00002403\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --entity obo:FOODON_00002381 --select "self ancestors" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: hp
hp:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term HP:0000118\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	remove --entity UPHENO:0001002 --entity HP:0000001 \
	annotate --ontology-iri "$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

# WARNING: NCBITaxon is BIG! This will take time.
.PHONY: ncbitaxon
ncbitaxon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: uberon
uberon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

# ----------------------------------------
# REPORT
# ----------------------------------------

REP = build/reports/

report: $(REP)report.tsv

$(REP)report.tsv: $(EDIT)
	$(ROBOT) report --input $<\
	 --output $@ --format tsv

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json

# release vars
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT)
	$(ROBOT) merge --collapse-import-closure false --input $< --input $(MODS)module.owl \
	reason --create-new-ontology false \
	 --annotate-inferred-axioms true --exclude-duplicate-axioms true \
	annotate --version-iri "$(OBO)doid/releases/$(DATE)/doid.owl" --output $@
	 
# OWL -> OBO does weird things to the date
# Do not annotate OWL file until after conversion
$(DO).obo: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true \
	remove --axioms equivalent --trim true \
	convert --check false \
	annotate --annotation oboInOwl:date "$(TS)" --output $@ && \
	$(ROBOT) annotate --input $<\
	 --annotation oboInOwl:date "$(TS)" --output $<

$(DO).json: $(DO).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

DM = doid-merged

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

DNC = doid-non-classified
HD = HumanDO

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

SUB = subsets/
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
