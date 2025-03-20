# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

OBO = http://purl.obolibrary.org/obo/
ROBOT := java -Xmx10G -jar ../../../build/robot.jar

# Import update options (each can be executed here or from the src/ontology/imports dir)
# PRIMARY COMMANDS
# 1. `make imports` - Make all imports, updating if newer versions exist.
# 2. `make <import name>` - Make specified import, updating if a newer version exists.
# SECONDARY COMMANDS (these should rarely be needed)
# 3. `make refresh_imports` - Remove imports/build directory and make all imports from newly downloaded source files.
# 4. `make refresh_<import name>` - Remove source file from imports/build directory and make import from newly downloaded source file.
# * For import names see IMPORT_OWL and IMPORT_OWL_GZ variables below

# Other commands (primarily exist for debugging)
# 1. `make clean` - Remove imports/build directory
# 2. `make versions` - Update only <import>.version files in imports/build
# 3. `make sources` - Update versions and source files in imports/build

IMPORT_OWL := cl disdriv eco foodon geno hp ro so symp trans uberon
# Download compressed (large file size)
IMPORT_OWL_GZ := chebi ncbitaxon
IMPORTS := $(IMPORT_OWL) $(IMPORT_OWL_GZ)

SOURCE_OWL := $(addprefix build/, $(addsuffix .owl,$(IMPORT_OWL)))
SOURCE_OWL_GZ := $(addprefix build/, $(addsuffix .owl.gz,$(IMPORT_OWL_GZ)))
SOURCES := $(SOURCE_OWL) $(SOURCE_OWL_GZ)

VERSIONS := $(addprefix build/, $(addsuffix .version,$(IMPORTS)))

imports: $(IMPORTS)

sources: $(SOURCES)

versions: $(VERSIONS)

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

build build/last build/last/src:
	mkdir -p $@


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

# Extracts versionIRI from pre-opened OWL files (works for local & remote files)
# NOTES:
# 1. Reads stdin ONLY to versionIRI -> req'd to avoid long read time of
#	large files (e.g. chebi).
# 2. The last `sed` replaces a custom XML entity (used in foodon) with the OBO
#	URI it represents (i.e. '&obo;' -> 'http://purl.obolibrary.org/obo/'),
#	see https://www.w3schools.com/xml/xml_dtd_entities.asp for bkgd info.
define extract_versionIRI
	sed -n '/owl:versionIRI/p;/owl:versionIRI/q' | \
	sed -E 's/.*"([^"]+)".*/\1/' | \
	sed 's|&obo;|http://purl.obolibrary.org/obo/|'
endef

# Save *_import.owl before update for comparison
define save_last
	@if [[ -f $@ ]]; then \
		mv $@ build/last ; \
	 fi
endef


# ----------------------------------------
# DOWNLOAD IMPORTS (SOURCES)
# ----------------------------------------

# Download source if not present or a newer version is available
# NOTE: Existing source is moved to build/last for possible diff (not yet implemented)
# MAKE NOTE: Targets are explicit to avoid grouped execution & prevent ambiguity (of implicit rules).
$(SOURCE_OWL): build/%.owl: build/%.version | build build/last/src
	@if [[ -f $@ ]]; then \
		mv $@ build/last/src ; \
	 fi
	@echo "DOWNLOADING $@..."
	@curl -Lk $(OBO)$(notdir $@) > $@

$(SOURCE_OWL_GZ): build/%.owl.gz: build/%.version | build build/last/src
	@if [[ -f $@ ]]; then \
		mv $@ build/last/src ; \
	 fi
	@echo "DOWNLOADING $@..."
	@curl -Lk $(OBO)$(notdir $@) > $@


# ----------------------------------------
# CAPTURE LATEST versionIRIs
# ----------------------------------------

# Update <import>.version if newer version available (always run)
FORCE:

$(patsubst %,build/%.version,$(IMPORT_OWL)): FORCE | build
	@SRC=$(basename $@).owl ; \
	 LATEST=$$(curl -sLk $(OBO)$$(basename $${SRC}) | $(extract_versionIRI)) ; \
	 if [[ -f $@ && -f $${SRC} ]]; then \
		SRC_VERS=$$(sed '1q' $@) ; \
		if [[ $${SRC_VERS} != $${LATEST} ]]; then \
			echo $${LATEST} > $@ ; \
		fi ; \
	 else \
		echo $${LATEST} > $@ ; \
	 fi

$(patsubst %,build/%.version,$(IMPORT_OWL_GZ)): FORCE | build
	@SRC=$(basename $@).owl.gz ; \
	 LATEST=$$(curl -sLk $(OBO)$$(basename $${SRC}) | gzcat | $(extract_versionIRI)) ; \
	 if [[ -f $@ && -f $${SRC} ]]; then \
		SRC_VERS=$$(sed '1q' $@) ; \
		if [[ $${SRC_VERS} != $${LATEST} ]]; then \
			echo $${LATEST} > $@ ; \
		fi ; \
	 else \
		echo $${LATEST} > $@ ; \
	 fi


# ----------------------------------------
# FULL IMPORTS
# ----------------------------------------

disdriv: disdriv_import.owl
disdriv_import.owl: build/disdriv.owl | build/disdriv.version build/last
	@$(call announce_version,$@,$|)
	@$(save_last)
	@$(ROBOT) remove \
	 --input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	$(call annotate_import,$@,$|)

symp: symp_import.owl
symp_import.owl: build/symp.owl | build/symp.version build/last
	@$(call announce_version,$@,$|)
	@$(save_last)
	@$(ROBOT) remove \
	 --input $< \
	 --select "owl:deprecated='true'^^xsd:boolean" \
	remove \
	 --select object-properties \
	$(call annotate_import,$@,$|)

trans: trans_import.owl
trans_import.owl: build/trans.owl | build/trans.version build/last
	@$(call announce_version,$@,$|)
	@$(save_last)
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
chebi_import.owl: build/chebi.owl.gz chebi_terms.txt | annotations.txt \
 build/chebi.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
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
cl_import.owl: build/cl.owl cl_terms.txt | annotations.txt build/cl.version \
 build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term obo:CL_0000000 \
	 --lower-terms $(word 2,$^) \
	extract \
	 --method mireot \
	 --branch-from-term obo:CL_0000000 \
	remove \
	 --term GO:0005623 \
	 --select "self ancestors" \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

# NOTE: Unlike other imports, build drops intermediate ECO classes
eco: eco_import.owl
eco_import.owl: build/eco.owl eco_terms.txt | annotations.txt build/eco.version \
 build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --intermediates minimal \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	 --term IAO:0000115 \
	 --term oboInOwl:hasDbXref \
	$(call annotate_import,$@,$(word 2,$|))

foodon: foodon_import.owl
foodon_import.owl: build/foodon.owl foodon_terms.txt | annotations.txt \
 build/foodon.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) merge \
	 --input $< \
	extract \
	 --method mireot \
	 --upper-term obo:FOODON_00002403 \
	 --lower-terms $(word 2,$^) \
	extract \
	 --method mireot \
	 --branch-from-term obo:FOODON_00002403 \
	remove \
	 --term obo:FOODON_00002381 \
	 --term obo:FOODON_00001002 \
	 --term obo:FOODON_03400361 \
	 --term obo:FOODON_00001176 \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	query \
	 --update ../../sparql/build/remove_non_en_labels.ru \
	$(call annotate_import,$@,$(word 2,$|))

geno: geno_import.owl
geno_import.owl: build/geno.owl geno_terms.txt | annotations.txt \
 build/geno.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
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
hp_import.owl: build/hp.owl hp_terms.txt exclude-hp.txt | annotations.txt \
 build/hp.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term HP:0000118 \
	 --upper-term HP:0003674 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --term-file $(word 3,$^) \
	query \
	 --update ../../sparql/build/remove_def_annotations.ru \
	 --update ../../sparql/build/remove_phenotype_defs.ru \
	 --update ../../sparql/build/remove_non_en_labels.ru \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	 --term IAO:0000115 \
	remove \
	 --term HP:0003674 \
	 --term rdfs:label \
	 --axioms annotation \
	 --trim false \
	$(call annotate_import,$@,$(word 2,$|))

# WARNING: NCBITaxon is BIG! This will take time.
ncbitaxon: ncbitaxon_import.owl
ncbitaxon_import.owl: build/ncbitaxon.owl.gz ncbitaxon_terms.txt | \
 annotations.txt build/ncbitaxon.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --upper-term NCBITaxon:1 \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties\
	 --term-file annotations.txt \
	remove \
	 --term NCBITaxon:1 \
	 --term rdfs:label \
	 --axioms annotation \
	 --trim false \
	$(call annotate_import,$@,$(word 2,$|))

ro: ro_import.owl
ro_import.owl: build/ro.owl ro_terms.txt | annotations.txt build/ro.version \
 build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) extract \
	 --input $< \
	 --method mireot \
	 --lower-terms $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

# The SO import contains only the sequence_variant branch plus a few terms
# from sequence_feature. See IMPORT INTERMEDIATES below for more details.
so: so_import.owl
so_import.owl: build/so_feature.owl build/so_variant.owl | annotations.txt \
 build/so.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	remove \
	 --select complement \
	 --select annotation-properties \
	 --term-file annotations.txt \
	$(call annotate_import,$@,$(word 2,$|))

uberon: uberon_import.owl
uberon_import.owl: build/uberon.owl uberon_terms.txt build/uberon_rm_label.txt \
 | annotations.txt build/uberon.version build/last
	@$(call announce_version,$@,$(word 2,$|))
	@$(save_last)
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
	remove \
	 --term-file $(word 3,$^) \
	 --term UBERON:0001062 \
	 --term rdfs:label \
	 --axioms annotation \
	 --trim false \
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
	 --precious-terms $(word 2,$^) \
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

build/uberon_rm_label.txt: uberon_terms.txt | build
	@sed -nE 's/^[^U]*(UBERON:[0-9]+).*@REPLACE/\1/p' $< > $@