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

IMPORT_OBO := ro
IMPORT_OWL := cl foodon geno hp so uberon symp trans
# Download compressed (large file size)
IMPORT_OWL_GZ := chebi ncbitaxon

IMPORTS := $(IMPORT_OBO) $(IMPORT_OWL) $(IMPORT_OWL_GZ)
SOURCES := $(addprefix build/, \
	$(addsuffix .obo,$(IMPORT_OBO)) \
	$(addsuffix .owl,$(IMPORT_OWL)) \
	$(addsuffix .owl.gz,$(IMPORT_OWL_GZ)) \
)

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


# ----------------------------------------
# CUSTOM FUNCTIONS
# ----------------------------------------

# Consistent ROBOT annotation for imports
define annotate_import
	annotate \
	 --ontology-iri "$(OBO)doid/imports/$(1)" \
	 --version-iri "$(OBO)doid/imports/$(1)" \
	 --output $(1)
endef


# ----------------------------------------
# DOWNLOAD IMPORTS (SOURCES)
# ----------------------------------------

# Rules are explicit to avoid execution as grouped targets & prevent target ambiguity.
# WARNING: Sources are ONLY downloaded when file doesn't exist. To re-download all use `make clean`.
$(SOURCES): | build
	curl -Lk $(OBO)$(notdir $@) > $@


# ----------------------------------------
# CAPTURE versionIRIs
# ----------------------------------------

build/%.version: build/%.obo
	@$(ROBOT) convert --input $< --format owl --output $@.tmp
	@grep "owl:versionIRI" $@.tmp | sed -E 's/.*"([^"]+)\.owl".*/\1\.obo/' > $@
	@rm $@.tmp

# second sed cmd added to standardize weird Foodon versionIRI
build/%.version: build/%.owl
	@grep "owl:versionIRI" $< | sed -E 's/.*"([^"]+)".*/\1/' | \
	sed 's|&obo;|http://purl.obolibrary.org/obo/|' > $@

build/%.version: build/%.owl.gz
	@gzcat $< | sed -n '/owl:versionIRI/p;/owl:versionIRI/q' | sed -E 's/.*"([^"]+)".*/\1/' > $@


# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

symp: symp_import.owl
symp_import.owl: build/symp.owl
	@$(ROBOT) remove \
	 --input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select object-properties \
	$(call annotate_import,$@)

trans: trans_import.owl
trans_import.owl: build/trans.owl
	@$(ROBOT) remove \
	 --input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select object-properties \
	$(call annotate_import,$@)


# ----------------------------------------
# IMPORT MODULES
# ----------------------------------------

chebi: chebi_import.owl
chebi_import.owl: build/chebi.owl.gz chebi_terms.txt | annotations.txt
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --term "owl:Thing" \
	$(call annotate_import,$@)

cl: cl_import.owl
cl_import.owl: build/cl.owl cl_terms.txt | annotations.txt
	@$(ROBOT) extract \
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
	$(call annotate_import,$@)

foodon: foodon_import.owl
foodon_import.owl: build/foodon.owl foodon_terms.txt | annotations.txt
	@$(ROBOT) merge \
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
	$(call annotate_import,$@)

geno: geno_import.owl
geno_import.owl: build/geno.owl geno_terms.txt | annotations.txt
	@$(ROBOT) extract \
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
	$(call annotate_import,$@)

# The HP module is a subset of the Phenotypic abnormality branch
hp: hp_import.owl
hp_import.owl: build/hp.owl hp_terms.txt exclude-hp.txt | annotations.txt
	@$(ROBOT) extract \
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
	$(call annotate_import,$@)

# WARNING: NCBITaxon is BIG! This will take time.
ncbitaxon: ncbitaxon_import.owl
ncbitaxon_import.owl: build/ncbitaxon.owl.gz ncbitaxon_terms.txt | annotations.txt
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term NCBITaxon:10239 \
	 --upper-term NCBITaxon:131567 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	$(call annotate_import,$@)

ro: ro_import.owl
ro_import.owl: build/ro.obo ro_terms.txt | annotations.txt
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	$(call annotate_import,$@)
# The SO import contains only the sequence_variant branch plus a few terms from sequence_feature
.INTERMEDIATE: build/so_feature.owl
build/so_feature.owl: build/so.owl so_terms.txt
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term owl:Thing \
	collapse \
	 --output $@

.INTERMEDIATE: build/so_variant.owl
build/so_variant.owl: build/so.owl
	@$(ROBOT) filter \
	 --input $< \
	 --term SO:0001060 \
	 --select "self descendants annotations" \
	remove \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	 --output $@

so: so_import.owl
so_import.owl: build/so_feature.owl build/so_variant.owl | annotations.txt
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@)

uberon: uberon_import.owl
uberon_import.owl: build/uberon.owl uberon_terms.txt | annotations.txt
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	remove \
	 --select "UBERON:*" \
	 --select complement \
	 --select classes \
	$(call annotate_import,$@)
