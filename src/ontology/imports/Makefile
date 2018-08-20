# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:

OBO = http://purl.obolibrary.org/obo/

IMP = ./
imports: chebi cl foodon geno hp ncbitaxon ro uberon full

# ----------------------------------------
# ROBOT
# ----------------------------------------

# mk: 
# 	mkdir -p build

# build/robot.jar: | mk
# 	curl -L -o build/robot.jar\
#	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := java -jar ../../../build/robot.jar

# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

FULL = trans so symp

.PHONY: full
full: $(FULL)
$(FULL):
	$(ROBOT) merge --input-iri "$(OBO)$@.owl" \
	remove --select "owl:deprecated='true'^^xsd:boolean" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"


# ----------------------------------------
# IMPORT MODULES
# ----------------------------------------

# Either update all import files at once with `make imports`
# or one at a time with `make <import name>` (e.g. `make cl`)

# WARNING: CHEBI is BIG! This will take time.
.PHONY: chebi
chebi:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select complement --select annotation-properties\
	 --term $(IMP)annotations.txt --trim true \
	remove --term "owl:Thing" \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: cl
cl:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term obo:CL_0000000\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --term GO:0005623 --select "self ancestors" --trim true \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: foodon
foodon:
	$(ROBOT) merge --input-iri "$(OBO)$@.owl"\
	 --input-iri "$(OBO)$@_merged.owl" \
	extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term obo:FOODON_00002403\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --term obo:FOODON_00002381 --select "self ancestors" --trim true \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: geno
geno:
	$(ROBOT) filter --input-iri "$(OBO)$@.owl"\
	 --term obo:GENO_0000141 --select "self descendants annotations" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	remove --term obo:GENO_0000889 \
	annotate --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: hp
hp:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term HP:0000118\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	remove --term UPHENO:0001002 --term HP:0000001 \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

# WARNING: NCBITaxon is BIG! This will take time.
.PHONY: ncbitaxon
ncbitaxon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term NCBITaxon:10239\
	 --upper-term NCBITaxon:131567 --lower-terms "$(IMP)$@_terms.txt" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: ro
ro:
	$(ROBOT) extract --input-iri "https://raw.githubusercontent.com/oborel/obo-relations/master/ro.obo"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: uberon
uberon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select complement --select annotation-properties\
	 --term-file $(IMP)annotations.txt --trim true \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"
