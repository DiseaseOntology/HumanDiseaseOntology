# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:

OBO = http://purl.obolibrary.org/obo/
ROBOT := java -Xmx10G -jar ../../../build/robot.jar
IMPORTS := chebi cl foodon geno hp ncbitaxon ro so symp trans uberon
SOURCES := $(foreach I,$(filter-out ro,$(IMPORTS)), build/$(I).owl) build/ro.obo

# Either update all import files at once with `make imports`
# or one at a time with `make <import name>` (e.g. `make cl`)
# Refresh the source ontologies with `make clean_imports`

imports: $(IMPORTS)
sources: $(SOURCES)

clean:
	rm -rf build

clean_imports: 
	make clean
	make sources
	make imports

build:
	mkdir $@

build/ro.obo: | build
	curl -Lk "https://raw.githubusercontent.com/oborel/obo-relations/master/ro.obo" > $@

# Download compressed ChEBI to save some time
build/chebi.owl.gz: | build
	curl -Lk $(OBO)$(notdir $@) > $@

build/%.owl: | build
	curl -Lk $(OBO)$(notdir $@) > $@


# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

symp: symp_import.owl
symp_import.owl: build/symp.owl | annotations.txt
	$(ROBOT) merge \
	 --input $< \
	remove \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --select object-properties \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

trans: trans_import.owl
trans_import.owl: build/trans.owl | annotations.txt
	$(ROBOT) merge \
	 --input $< \
	remove \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --select object-properties \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@


# ----------------------------------------
# IMPORT MODULES
# ----------------------------------------

chebi: chebi_import.owl
chebi_import.owl: build/chebi.owl.gz chebi_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --term "owl:Thing" \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

cl: cl_import.owl
cl_import.owl: build/cl.owl cl_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term obo:CL_0000000 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term GO:0005623 \
	 --select "self ancestors" \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

foodon: foodon_import.owl
foodon_import.owl: build/foodon.owl foodon_terms.txt | annotations.txt
	$(ROBOT) merge \
	 --input $< \
	extract \
	 --method mireot \
	 --upper-term obo:FOODON_00002403\
	 --lower-terms $(word 2,$^) \
	remove \
	 --term obo:FOODON_00002381 \
	 --term obo:FOODON_00001002 \
	 --term obo:FOODON_03400361 \
	 --term obo:FOODON_00001176 \
	remove \
	 --term BFO:0000040 \
	 --select "self ancestors" \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	query \
	 --update ../../sparql/build/remove_non_en_labels.ru \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@"\
	 --ontology-iri "$(OBO)doid/imports/$@"\
	 --output $@

geno: geno_import.owl
geno_import.owl: build/geno.owl geno_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term obo:GENO_0000141 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	remove \
	 --term oboInOwl:ObsoleteClass \
	 --select "self descendants" \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

# The HP module is a subset of the Phenotypic abnormality branch
hp: hp_import.owl
hp_import.owl: build/hp.owl hp_terms.txt exclude-hp.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term HP:0000118 \
	 --upper-term HP:0003674 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --term-file $(word 3,$^) \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

# WARNING: NCBITaxon is BIG! This will take time.
ncbitaxon: ncbitaxon_import.owl
ncbitaxon_import.owl: build/ncbitaxon.owl ncbitaxon_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term NCBITaxon:10239 \
	 --upper-term NCBITaxon:131567 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

ro: ro_import.owl
ro_import.owl: build/ro.obo ro_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

# The SO import contains only the sequence_variant branch plus a few terms from sequence_feature
.INTERMEDIATE: build/so_feature.owl
build/so_feature.owl: build/so.owl so_terms.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term owl:Thing \
	collapse \
	 --output $@

.INTERMEDIATE: build/so_variant.owl
build/so_variant.owl: build/so.owl
	$(ROBOT) filter \
	 --input $< \
	 --term SO:0001060 \
	 --select "self descendants annotations" \
	remove \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	 --output $@

so: so_import.owl
so_import.owl: build/so_feature.owl build/so_variant.owl | annotations.txt
	$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@" \
	 --ontology-iri "$(OBO)doid/imports/$@" \
	 --output $@

uberon: uberon_import.owl
uberon_import.owl: build/uberon.owl uberon_terms.txt | annotations.txt
	$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	annotate \
	 --version-iri "$(OBO)doid/imports/$@"\
	 --ontology-iri "$(OBO)doid/imports/$@"\
	 --output $@
