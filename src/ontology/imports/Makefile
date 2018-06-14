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
imports: chebi cl foodon hp ncbitaxon uberon full

# ----------------------------------------
# ROBOT
# ----------------------------------------

# mk: 
# 	mkdir -p build

# build/robot.jar: | mk
# 	curl -L -o build/robot.jar\
#	 https://build.berkeleybop.org/job/robot/lastSuccessfulBuild/artifact/bin/robot.jar

ROBOT := robot
# ROBOT := java -jar ../build/robot.jar

# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

FULL = trans so symp

.PHONY: full
full: $(FULL)
$(FULL):
	$(ROBOT) merge --input-iri "$(OBO)$@.owl" \
	remove --select "owl:deprecated='true'^^boolean" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
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
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	remove --entity "owl:Thing" \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: cl
cl:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term obo:CL_0000000\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --entity GO:0005623 --select "self ancestors" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: foodon
foodon:
	$(ROBOT) extract --input "$(OBO)$@_merged.owl"\
	 --method mireot --upper-term obo:FOODON_00002403\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --entity obo:FOODON_00002381 --select "self ancestors" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: hp
hp:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term HP:0000118\
	 --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	remove --entity UPHENO:0001002 --entity HP:0000001 \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

# WARNING: NCBITaxon is BIG! This will take time.
.PHONY: ncbitaxon
ncbitaxon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --upper-term NCBITaxon:10239\
	 --upper-term NCBITaxon:131567 --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"

.PHONY: uberon
uberon:
	$(ROBOT) extract --input-iri "$(OBO)$@.owl"\
	 --method mireot --lower-terms "$(IMP)$@_terms.txt" \
	remove --select "complement annotation-properties"\
	 --entities $(IMP)annotations.txt \
	annotate --version-iri "$(OBO)doid/imports/$@_import.owl"\
	 --ontology-iri "$(OBO)doid/imports/$@_import.owl"\
	 --output "$(IMP)$@_import.owl"
