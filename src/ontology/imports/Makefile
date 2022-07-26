# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

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

# Import update options (each can be executed here or from the src/ontology/imports dir):
# 1. `make imports` - Make all imports from existing source files (WARNING: will download ONLY if they don't exist).
# 2. `make refresh_imports` - Make all imports from newly downloaded source files.
# 3. `make <import name>` - Make specified import from existing soure file (WARNING: will download ONLY if it doesn't exist).
# 4. `make refresh_<import name>` - Make specified import from newly downloaded source file.

# To refresh all source ontologies, use `make refresh_imports`

imports: $(IMPORTS)
sources: $(SOURCES)

clean:
	rm -rf build

refresh_imports:
	$(MAKE) clean
	$(MAKE) imports

# Refresh (clean & rebuild) *individual* imports with `refresh_{import}`
IMP_REFRESH := ""
REFRESH_IMPORTS := $(foreach IMP,$(IMPORTS),refresh_$(IMP))
$(REFRESH_IMPORTS):
	$(eval IMP_REFRESH=$(patsubst refresh_%,%,$@))
	@rm -f $(filter build/$(IMP_REFRESH)%,$(SOURCES))
	@$(MAKE) $(IMP_REFRESH)
	$(eval IMP_REFRESH="")

build:
	mkdir $@


# ----------------------------------------
# CUSTOM FUNCTIONS
# ----------------------------------------

# Consistent ROBOT annotation for imports
define annotate_import
	annotate \
	 --remove-annotations \
	 --ontology-iri "$(OBO)doid/imports/$(1)" \
	 --version-iri "$(OBO)doid/imports/$(1)" \
	 --annotation rdfs:comment "Sourced from $$(sed '1q' $(2))" \
	 --output $(1)
endef

# Message about version of source used for import (same or different;
# if different, strip leading namespace from source version for readability)
define announce_version
	CUR_VERS=$$(grep -s 'rdfs:comment.*Sourced from' $(1) | sed -E 's/.*Sourced from ([^< ]+).*/\1/') ; \
	SRC_VERS=$$(sed '1q' $(2)) ; \
	if [[ $${CUR_VERS} = $${SRC_VERS} ]]; then \
		echo "Updating $(1) from source with same version: $${SRC_VERS}" ; \
	else \
		NS=$$(echo $${CUR_VERS} | grep -Eo ".*/obo/[^/]+/") ; \
		SRC_VERS=$${SRC_VERS#"$$NS"} ; \
		echo "Updating $(1): $${CUR_VERS} >> $${SRC_VERS}" ; \
	fi ;
endef


# ----------------------------------------
# DOWNLOAD IMPORTS (SOURCES)
# ----------------------------------------

# Targets are explicit to avoid grouped execution & prevent ambiguity (of implicit rules).
# WARNING: Sources are ONLY downloaded when file doesn't exist. To re-download
#	source files, use the make refresh commands.
$(SOURCES): | build
	curl -Lk $(OBO)$(notdir $@) > $@


# ----------------------------------------
# CAPTURE versionIRIs
# ----------------------------------------

.SECONDARY: $(addprefix build/,$(addsuffix .version,$(IMPORTS)))
$(patsubst %,build/%.version,$(IMPORT_OBO)): %.version: %.obo
	@$(ROBOT) convert --input $< --format owl --output $@.tmp
	@grep "owl:versionIRI" $@.tmp | sed -E 's/.*"([^"]+)\.owl".*/\1\.obo/' > $@
	@rm $@.tmp

# second sed cmd added to standardize weird Foodon versionIRI
$(patsubst %,build/%.version,$(IMPORT_OWL)): %.version: %.owl
	@grep "owl:versionIRI" $< | sed -E 's/.*"([^"]+)".*/\1/' | \
	sed 's|&obo;|http://purl.obolibrary.org/obo/|' > $@

$(patsubst %,build/%.version,$(IMPORT_OWL_GZ)):%.version: %.owl.gz
	@gzcat $< | sed -n '/owl:versionIRI/p;/owl:versionIRI/q' | sed -E 's/.*"([^"]+)".*/\1/' > $@

# Help make find version files in build/ when bare names given as prereqs.
vpath %.version build


# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

symp: symp_import.owl
symp_import.owl: build/symp.owl | symp.version
	@$(call announce_version,$@,$|)
	@$(ROBOT) remove \
	 --input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select object-properties \
	$(call annotate_import,$@,$|)

trans: trans_import.owl
trans_import.owl: build/trans.owl | trans.version
	@$(call announce_version,$@,$|)
	@$(ROBOT) remove \
	--input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select object-properties \
	$(call annotate_import,$@,$|)


# ----------------------------------------
# IMPORT MODULES
# ----------------------------------------

chebi: chebi_import.owl
chebi_import.owl: build/chebi.owl.gz chebi_terms.txt | annotations.txt chebi.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))

cl: cl_import.owl
cl_import.owl: build/cl.owl cl_terms.txt | annotations.txt cl.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))

foodon: foodon_import.owl
foodon_import.owl: build/foodon.owl foodon_terms.txt | annotations.txt foodon.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))

geno: geno_import.owl
geno_import.owl: build/geno.owl geno_terms.txt | annotations.txt geno.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))

# The HP module is a subset of the Phenotypic abnormality branch
hp: hp_import.owl
hp_import.owl: build/hp.owl hp_terms.txt exclude-hp.txt | annotations.txt hp.version
	@$(call announce_version,$@,$(word 2,$|))
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term HP:0000118 \
	 --upper-term HP:0003674 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term-file $(word 3,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

# WARNING: NCBITaxon is BIG! This will take time.
ncbitaxon: ncbitaxon_import.owl
ncbitaxon_import.owl: build/ncbitaxon.owl.gz ncbitaxon_terms.txt | annotations.txt ncbitaxon.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))

ro: ro_import.owl
ro_import.owl: build/ro.obo ro_terms.txt | annotations.txt ro.version
	@$(call announce_version,$@,$(word 2,$|))
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

# The SO import contains only the sequence_variant branch plus a few terms
# from sequence_feature. See IMPORT INTERMEDIATES below for more details.
so: so_import.owl
so_import.owl: build/so_feature.owl build/so_variant.owl | annotations.txt so.version
	@$(call announce_version,$@,$(word 2,$|))
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

uberon: uberon_import.owl
uberon_import.owl: build/uberon.owl uberon_terms.txt | annotations.txt uberon.version
	@$(call announce_version,$@,$(word 2,$|))
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
	$(call annotate_import,$@,$(word 2,$|))


# ----------------------------------------
# IMPORT INTERMEDIATES
# ----------------------------------------

.INTERMEDIATE: build/so_feature.owl build/so_variant.owl
build/so_feature.owl: build/so.owl so_terms.txt
	@echo "Creating so intermediate $@"
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term owl:Thing \
	collapse \
	 --output $@

build/so_variant.owl: build/so.owl
	@echo "Creating so intermediate $@"
	@$(ROBOT) filter \
	 --input $< \
	 --term SO:0001060 \
	 --select "self descendants annotations" \
	remove \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	 --output $@
