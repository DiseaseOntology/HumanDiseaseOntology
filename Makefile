# config
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:
.NOTPARALLEL:

include src/util/functions.mk
include src/util/help-root.mk
include src/util/help.mk

DO = src/ontology/doid
EDIT = src/ontology/doid-edit.owl
OBO = http://purl.obolibrary.org/obo/

# Other products
DB = src/ontology/doid-base
DM = src/ontology/doid-merged
DNC = src/ontology/doid-non-classified
HD = src/ontology/HumanDO

# Set the software versions to use
ROBOT_VRS = 1.9.11
FASTOBO_VRS = 0.4.6

# ***NEVER run make commands in parallel (do NOT use the -j flag)***

# Run `make help` for available targets; release steps are in src/ontology/README-make.md
.PHONY: release all
## [release] Release, without import updates
release: test-release version-imports products verify publish post
	@echo "Release complete!"

## [release] Release, with import updates
all: imports release

.PHONY: FORCE
FORCE:


##########################################
## SETUP
##########################################

.PHONY: clean
## [caution] Remove the build directory (start fresh)
clean:
	rm -rf build

build build/update build/reports build/reports/temp build/translations:
	mkdir -p $@

# ----------------------------------------
# ROBOT
# ----------------------------------------

# ROBOT is automatically updated
ROBOT := java -jar build/robot.jar

.PHONY: check-robot
check-robot:
	@if [[ -f build/robot.jar ]]; then \
		VRS=$$($(ROBOT) --version) ; \
		if [[ "$$VRS" != *"$(ROBOT_VRS)"* ]]; then \
			printf "\e[1;37mUpdating\e[0m from $$VRS to $(ROBOT_VRS)...\n" ; \
			rm -rf build/robot.jar && $(MAKE) build/robot.jar ; \
		fi ; \
	else \
		echo "Downloading ROBOT version $(ROBOT_VRS)..." ; \
		$(MAKE) build/robot.jar ; \
	fi

.PHONY: refresh-robot
## [caution] Re-download ROBOT
refresh-robot:
	rm -rf build/robot.jar && $(MAKE) build/robot.jar

build/robot.jar: | build
	@curl -L -o $@ https://github.com/ontodev/robot/releases/download/v$(ROBOT_VRS)/robot.jar

# ----------------------------------------
# FASTOBO
# ----------------------------------------

# fastobo is used to validate OBO structure
FASTOBO := build/fastobo-validator

.PHONY: check-fastobo
check-fastobo:
	@if [[ -f $(FASTOBO) ]]; then \
		VRS=$$($(FASTOBO) --version) ; \
		if [[ "$$VRS" != *"$(FASTOBO_VRS)"* ]]; then \
			printf "\e[1;37mUpdating\e[0m from $$VRS to $(FASTOBO_VRS)...\n" ; \
			rm -rf build/fastobo-validator && $(MAKE) $(FASTOBO) ; \
		fi ; \
	else \
		printf "\e[1;37mDownloading\e[0m fastobo-validator version $(FASTOBO_VRS)...\n" ; \
		$(MAKE) $(FASTOBO) ; \
	fi

$(FASTOBO): | build
	@if [[ $$(uname -m) == 'x86_64' ]]; then \
		curl -L -o build/fastobo-validator.zip https://github.com/fastobo/fastobo-validator/releases/download/v$(FASTOBO_VRS)/fastobo-validator_null_x86_64-apple-darwin.zip ; \
		cd build && unzip -DD fastobo-validator.zip fastobo-validator && rm fastobo-validator.zip ; \
	else \
		if [[ $$(command -v cargo) != *"cargo" ]]; then \
			printf "\e[1;33mWARNING:\e[0m fastobo-validator must be built from source on ARM64 machines\n" ; \
			printf " --> Install the Rust programming language, then repeat desired make command\n" ; \
			printf "\e[1;33mSKIPPING\e[0m fastobo-validator install\n\n" ; \
		else \
			echo "fastobo-validator must be built from source on ARM64 machines, one moment..." ; \
			cargo install --quiet --root $(dir $@) \
				--git "https://github.com/fastobo/fastobo-validator/" \
				--tag "v$(FASTOBO_VRS)" fastobo-validator && \
			mv build/bin/fastobo-validator $@ && rm -d build/bin ; \
		fi ; \
	fi

.PHONY: refresh-fastobo
## [caution] Re-download fastobo-validator
refresh-fastobo:
	rm -rf build/fastobo-validator && $(MAKE) $(FASTOBO)


##########################################
## CI TESTS & DIFF
##########################################

.PHONY: test-ci test report reason verify-edit test-quarterly

## [tests] GitHub continuous integration tests
test-ci: reason report verify-edit
	@echo ""

## [tests] test-ci + diff
test: test-ci diff
	@echo ""

## [tests:test-ci] ROBOT QC reports for doid-edit.owl
report: build/reports/report-obo.tsv build/reports/report.tsv

.PRECIOUS: build/reports/report.tsv build/reports/report-obo.tsv
build/reports/report.tsv: $(EDIT) src/sparql/report/report_profile.txt | check-robot build/reports
	@echo -e "\n## doid-edit QC report\nFull report at $@"
	@$(ROBOT) report \
	 --input $< \
	 --profile $(word 2,$^) \
	 --labels true \
	 --output $@

build/reports/report-obo.tsv: $(EDIT) | check-robot build/reports
	@echo -e "\n## OBO dashboard QC report\nFull report at $@"
	@$(ROBOT) report \
	 --input $< \
	 --labels true \
	 --output $@

## [tests:test-ci] Reasoning test for doid-edit.owl
reason: build/doid-edit-reasoned.owl

build/doid-edit-reasoned.owl: $(EDIT) | check-robot build
	@$(ROBOT) reason \
	 --input $< \
	 --create-new-ontology false \
	 --annotate-inferred-axioms false \
	 --exclude-duplicate-axioms true \
	 --equivalent-classes-allowed "asserted-only" \
	 --output $@
	@echo -e "\n## Reasoning completed successfully!"

# Verify *-edit.owl
EDIT_V_QUERIES := $(wildcard src/sparql/verify/edit-verify-*.rq src/sparql/verify/verify-*.rq)
EDIT_V_RES := $(patsubst src/sparql/verify/%.rq,build/reports/temp/%.csv,$(EDIT_V_QUERIES))

.PRECIOUS: build/reports/edit-verify.csv
## [tests:test-ci] SPARQL verification checks for doid-edit.owl
verify-edit: build/reports/edit-verify.csv
build/reports/edit-verify.csv: $(EDIT) | check-robot build/reports/temp
	@rm -f $(EDIT_V_RES)
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(EDIT_V_QUERIES) \
	 --fail-on-violation false \
	 --output-dir $(word 2,$|)
	@python3 src/util/concat_csv.py \
	 --input $(EDIT_V_RES) \
	 --category TEST \
	 --output $@

# Verify of *-edit.owl that should be run quarterly (not part of release)
QUARTER_V_QUERIES := $(wildcard src/sparql/verify/quarter-verify-*.rq)
QUARTER_V_RES := $(patsubst src/sparql/verify/%.rq,build/reports/temp/%.csv,$(QUARTER_V_QUERIES))

.PRECIOUS: build/reports/test-quarterly.csv
## [maintenance] Quarterly SPARQL checks for doid-edit.owl
test-quarterly: build/reports/test-quarterly.csv
build/reports/test-quarterly.csv: $(EDIT) | check-robot build/reports/temp
	@echo "Verifying $<..."
	@rm -f $(QUARTER_V_RES)
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(QUARTER_V_QUERIES) \
	 --fail-on-violation false \
	 --output-dir $(word 2,$|)
	@python3 src/util/concat_csv.py \
	 --input $(QUARTER_V_RES) \
	 --category TEST \
	 --output $@

# ----------------------------------------
# DIFF
# ----------------------------------------

.PHONY: diff
## [tests:test] Compare doid-edit.owl against last release
diff: build/reports/diff-ci.tsv

# Get the last release of doid-merged.owl (only if newer available)
build/doid-merged-last.version: FORCE | build
	@LATEST=$$(curl -sL "http://purl.obolibrary.org/obo/doid/doid-merged.owl" | \
				sed -n '/owl:versionIRI/p;/owl:versionIRI/q' | \
				sed -E 's/.*"([^"]+)".*/\1/') ; \
	 if [[ -f $@ ]]; then \
		SRC_VERS=$$(sed '1q' $@) ; \
		if [[ $${SRC_VERS} != $${LATEST} ]]; then \
			echo $${LATEST} > $@ ; \
		fi ; \
	 else \
		echo $${LATEST} > $@ ; \
	 fi

build/doid-merged-last.owl: build/doid-merged-last.version
	@echo "Downloading latest doid-merged.owl as $@..."
	@curl -sL http://purl.obolibrary.org/obo/doid/doid-merged.owl -o $@

# CI diff excludes 'has major susceptibility factor' relations
build/doid-merged-last-no-msf.owl: build/doid-merged-last.owl | check-robot
	@$(ROBOT) remove \
	 --input $< \
	 --term "RO:0004005" \
	 --output $@

build/reports/diff-ci.tsv: build/doid-merged-last-no-msf.owl \
	build/doid-edit-reasoned.owl | check-robot
	@$(ROBOT) export \
	 --input $< \
	 --header "ID|owl:deprecated|LABEL|SYNONYMS|IAO:0000115|SubClass Of [ID NAMED]|Equivalent Class|SubClass Of [ANON]|oboInOwl:hasDbXref|skos:exactMatch|skos:closeMatch|skos:broadMatch|skos:narrowMatch|skos:relatedMatch|oboInOwl:hasAlternativeId|oboInOwl:inSubset" \
	 --export $(addsuffix .tsv,$(basename $<))
	@$(ROBOT) export \
	 --input $(word 2,$^) \
	 --header "ID|owl:deprecated|LABEL|SYNONYMS|IAO:0000115|SubClass Of [ID NAMED]|Equivalent Class|SubClass Of [ANON]|oboInOwl:hasDbXref|skos:exactMatch|skos:closeMatch|skos:broadMatch|skos:narrowMatch|skos:relatedMatch|oboInOwl:hasAlternativeId|oboInOwl:inSubset" \
	 --export $(addsuffix .tsv,$(basename $(word 2,$^)))
	@python3 src/util/diff-re.py \
	 -1 $(addsuffix .tsv,$(basename $<)) \
	 -2 $(addsuffix .tsv,$(basename $(word 2,$^))) \
	 -p "DOID" \
	 -o $@
	@echo "Generated DOID diff report at $@"


##########################################
## UPDATE DATA IN DOID-EDIT.OWL
##########################################

# ----------------------------------------
# BRITISH SYNONYMS
# ----------------------------------------

# Add British synonyms from DO labels and exact synonyms
# This script requires `pandas` module: `python3 -m pip install pandas`

# Script and pipeline adapted from https://github.com/obophenotype/human-phenotype-ontology

build/update/british_english_dictionary.csv: | build/update
	curl -L -o $@ https://raw.githubusercontent.com/obophenotype/human-phenotype-ontology/master/src/ontology/hpo_british_english_dictionary.csv

build/update/synonyms.csv: $(EDIT) src/sparql/update/doid_synonyms.rq | check-robot build/update
	@echo "Retrieving DO synonyms..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/update/labels.csv: $(EDIT) src/sparql/update/doid_labels.rq | check-robot build/update
	@echo "Retrieving DO labels..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/update/be_synonyms.csv: src/util/compute_british_synonyms.py \
 build/update/labels.csv build/update/synonyms.csv \
 build/update/british_english_dictionary.csv
	@echo "Building synonyms template..."
	@python3 $^ $@

## [maintenance] Add British English synonyms to doid-edit.owl
add-british-synonyms: $(EDIT) build/update/be_synonyms.csv | \
 check-robot src/sparql/update/doid-edit_prefixes.json
	@$(ROBOT) template \
	 --input $< \
	 --template $(word 2,$^) \
	 --merge-before \
	 --output build/update/doid-edit.ofn \
	&& mv build/update/doid-edit.ofn $<
	@echo "British synonyms added to $^"

# ----------------------------------------
# AUTO-UPDATE SUBSETS
# ----------------------------------------

SUB_ADD := $(patsubst src/sparql/update/subsets/%.rq, update-%, \
	$(wildcard src/sparql/update/subsets/*.rq))
SUB_AUTO := $(patsubst src/sparql/update/subsets/%.ru, update-%, \
	$(wildcard src/sparql/update/subsets/*.ru))

.PHONY: update-slims $(SUB_ADD) $(SUB_AUTO)
## [maintenance] Update subsets/slims in doid-edit.owl (see help-update)
update-slims: $(SUB_ADD) $(SUB_AUTO)

# so far only DO_infectious_disease_slim needs a reasoned doid-edit but it's
#	easier to keep one rule for all slim templates at the moment; may change
#	this if multiple slims don't need reasoned file.
build/update/%-template.tsv: build/doid-edit-reasoned.owl \
 src/sparql/update/subsets/%.rq | check-robot build/update
	@echo "CHECKING $* subset for missing classes..."
	@$(ROBOT) query \
	 --input $< \
	 --query $(word 2,$^) build/update/$*-missing.tsv
	@sed '1s/.*/ID\tsubset\nID\tAI oboInOwl:inSubset/' build/update/$*-missing.tsv | \
	 sed -E 's|<(.+)>|\1\tdoid:$*|' > build/update/$*-template.tsv
	@rm build/update/$*-missing.tsv

$(SUB_ADD): update-%: $(EDIT) build/update/%-template.tsv | check-robot
	@if [ $$(awk 'END{print NR}' $(word 2,$^)) -gt "0" ]; then \
		echo "UPDATING in $<..." ; \
		$(ROBOT) template \
		 --prefix "doid: http://purl.obolibrary.org/obo/doid#" \
		 --input $< \
		 --template $(word 2,$^) \
		 --collapse-import-closure false \
		 --merge-before \
		convert \
		 --format ofn \
		 --output $< ; \
		echo " -> See $(word 2,$^) for additions" ; \
	else echo " -> Already up-to-date" ; \
	fi

$(SUB_AUTO): update-%: $(EDIT) src/sparql/update/subsets/%.ru | check-robot \
 src/sparql/update/doid-edit_prefixes.json build/update
	@echo "UPDATING $* subset in $<..."
	@NEW_DE=build/update/$*.ofn ; \
	$(ROBOT) \
	 --add-prefixes $(word 2,$|) \
	query \
	 --input $< \
	 --update $(word 2,$^) \
	 --output $$NEW_DE \
	&& $(ROBOT) diff \
	 --prefix "doid: http://purl.obolibrary.org/obo/doid#" \
	 --left $< \
	 --right $$NEW_DE \
	 --format pretty \
	 --output build/update/$*-report.txt \
	&& $(ROBOT) convert \
	 --input $$NEW_DE \
	 --format ofn \
	 --output $< \
	&& rm $$NEW_DE
	@echo " -> See build/update/$*-report.txt for changes"

# ----------------------------------------
# AUTO-UPDATE XREFs
# ----------------------------------------

XREF_AUTO := $(patsubst src/sparql/update/xrefs/%.ru, update-%, \
	$(wildcard src/sparql/update/xrefs/*.ru))

.PHONY: update-xrefs $(XREF_AUTO)
## [maintenance] Update xrefs in doid-edit.owl (see help-update)
update-xrefs: $(XREF_AUTO)

$(XREF_AUTO): update-%: $(EDIT) src/sparql/update/xrefs/%.ru | check-robot \
 src/sparql/update/doid-edit_prefixes.json build/update
	@echo "UPDATING $* xrefs in $<..."
	@NEW_DE=build/update/$*.ofn ; \
	$(ROBOT) \
	 --add-prefixes $(word 2,$|) \
	query \
	 --input $< \
	 --update $(word 2,$^) \
	 --output $$NEW_DE \
	&& $(ROBOT) diff \
	 --prefix "doid: http://purl.obolibrary.org/obo/doid#" \
	 --left $< \
	 --right $$NEW_DE \
	 --format pretty \
	 --output build/update/$*-report.txt \
	&& $(ROBOT) convert \
	 --input $$NEW_DE \
	 --format ofn \
	 --output $< \
	&& rm $$NEW_DE
	@echo " -> See build/update/$*-report.txt for changes"

# ----------------------------------------
# FIX DATA - TYPOS, PATTERNS, ETC. (use help-fix to list)
# ----------------------------------------

FIX_FILES := $(wildcard src/sparql/update/fix-*.ru)
OPT_FIX_FILES := $(wildcard src/sparql/update/opt-fix-*.ru)
FIX := $(basename $(notdir $(FIX_FILES)))
OPT_FIX :=  $(basename $(notdir $(OPT_FIX_FILES)))

.PHONY: fix $(FIX) $(OPT_FIX)

## [maintenance] Run all fix-* rules (see help-fix)
fix: $(FIX)
	@echo " -> Review with: git diff --word-diff-regex='.' -- src/ontology/doid-edit.owl)"

$(FIX): fix-%: $(EDIT) src/sparql/update/fix-%.ru | \
 check-robot src/sparql/update/doid-edit_prefixes.json
	@$(ROBOT) \
	 --add-prefixes $(word 2,$|) \
	query \
	 --input $< \
	 --update $(word 2,$^) \
	 --output doid-edit.ofn \
	&& mv doid-edit.ofn $<
	@echo "Fixed $*"

$(OPT_FIX): opt-fix-%: $(EDIT) src/sparql/update/opt-fix-%.ru | \
 check-robot src/sparql/update/doid-edit_prefixes.json
	@$(ROBOT) \
	 --add-prefixes $(word 2,$|) \
	query \
	 --input $< \
	 --update $(word 2,$^) \
	 --output doid-edit.ofn \
	&& mv doid-edit.ofn $<
	@echo "Fixed $* (review with: git diff --word-diff-regex='.' -- src/ontology/doid-edit.owl)"


##########################################
## IMPORTS
##########################################

# Imports can be built here or from src/ontology/imports; see `make help-imports`.
# Individual imports (`make <name>`, `make refresh-<name>`) are listed in IMPS.

IMPS := chebi cl disdriv eco foodon geno hp ncbitaxon ro so symp trans uberon
# define imports updated manually, solely for versioning
MANUAL_IMPS := omim_susc

# ----------------------------------------
# VALIDATION
# ----------------------------------------

.PHONY: test-omim_susc
## [tests] ROBOT QC report for omim_susc_import.owl
test-omim_susc: build/reports/report-omim_susc.tsv

.PRECIOUS: build/reports/report-omim_susc.tsv
build/reports/report-omim_susc.tsv: src/ontology/imports/omim_susc_import.owl \
  src/sparql/report/omim_susc_import/report_profile.txt | build/reports
	@echo -e "\n## omim_susc_import QC report\nFull report at $@"
	@$(ROBOT) report \
	 --input $< \
	 --profile $(word 2,$^) \
	 --labels true \
	 --output $@

# ----------------------------------------
# BUILD
# ----------------------------------------

## [imports] Build all imports; use OBO namespace for specific import(s) (e.g. `make hp`)
imports: | check-robot
	@echo "Checking import modules..."
	@$(MAKE) -C src/ontology/imports imports

## [imports] Rebuild all imports from fresh downloads (slow); use `refresh-<import>` for specific import
refresh-imports: | check-robot
	@echo "Refreshing import modules (this may take some time)..."
	@$(MAKE) -C src/ontology/imports refresh-imports

$(IMPS): | check-robot
	@echo "Generating $@ import module..."
	@$(MAKE) -C src/ontology/imports $@

# Refresh (clean & rebuild) *individual* imports with `refresh-{import}`
REFRESH_IMPS := $(foreach IMP,$(IMPS),refresh-$(IMP))
$(REFRESH_IMPS):
	@$(MAKE) -C src/ontology/imports $@

.PHONY: imports refresh-imports $(IMPS) $(REFRESH_IMPS)


##########################################
## PRE-RELEASE UPDATES & TESTS
##########################################

# ----------------------------------------
# AUTOMATED IMPORTS -- MERGE ONLY
# ----------------------------------------

# version omim_susc_import.owl first to avoid file churn with repeat commands
build/update/omim-susc-invert.owl: $(EDIT) src/ontology/imports/omim_susc_import.owl \
 src/sparql/update/omim-susc-invert.rq | check-robot build/update \
 version-omim_susc
	@echo "Inverting OMIM susceptibility relations..."
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	 --collapse-import-closure false \
	query \
	 --query $(word 3,$^) $@

EDIT_EXT := build/doid-edit-extended.owl
$(EDIT_EXT): $(EDIT) build/update/omim-susc-invert.owl | check-robot
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	 --collapse-import-closure false \
	 --output $@

# ----------------------------------------
# PRE-REASON
# ----------------------------------------

build/doid-precursor.owl: $(EDIT_EXT) | check-robot
	@$(ROBOT) reason \
	 --input $< \
	 --create-new-ontology false \
	 --annotate-inferred-axioms false \
	 --exclude-duplicate-axioms true \
	 --output $@

# ----------------------------------------
# PRE-RELEASE TESTS & DIFF
# ----------------------------------------

.PHONY: test-release
## [release:release] Pre-release tests
test-release: test-ci build/reports/diff-release.tsv

# includes 'has major susceptibility factor' relations
build/reports/diff-release.tsv: build/doid-merged-last.owl \
 build/doid-precursor.owl | check-robot build/reports
	@$(ROBOT) export \
	 --input $< \
	 --header "ID|owl:deprecated|LABEL|SYNONYMS|IAO:0000115|SubClass Of [ID NAMED]|Equivalent Class|SubClass Of [ANON]|oboInOwl:hasDbXref|skos:exactMatch|skos:closeMatch|skos:broadMatch|skos:narrowMatch|skos:relatedMatch|oboInOwl:hasAlternativeId|oboInOwl:inSubset" \
	 --export $(addsuffix .tsv,$(basename $<))
	@$(ROBOT) export \
	 --input $(word 2,$^) \
	 --header "ID|owl:deprecated|LABEL|SYNONYMS|IAO:0000115|SubClass Of [ID NAMED]|Equivalent Class|SubClass Of [ANON]|oboInOwl:hasDbXref|skos:exactMatch|skos:closeMatch|skos:broadMatch|skos:narrowMatch|skos:relatedMatch|oboInOwl:hasAlternativeId|oboInOwl:inSubset" \
	 --export $(addsuffix .tsv,$(basename $(word 2,$^)))
	@python3 src/util/diff-re.py \
	 -1 $(addsuffix .tsv,$(basename $<)) \
	 -2 $(addsuffix .tsv,$(basename $(word 2,$^))) \
	 -p "DOID" \
	 -o $@
	@echo "Generated pre-release diff report at $@"


##########################################
## RELEASE PRODUCTS
##########################################

.PHONY: products
## [release:release] Build ontologies, subsets, DOreports, sitemap, & facets
products: primary human merged base subsets release-reports website

# release vars
TS = $(shell date +'%d:%m:%Y %H:%M')
DATE := $(shell date +'%Y-%m-%d')
RELEASE_PREFIX := "$(OBO)doid/releases/$(DATE)/"

# standardized .obo creation;
#	args = output,input,version-iri,ontology-iri (optional, use "" to keep from input file)
define build_obo
	@ONT_IRI=$(4) ; \
	 ONT_IRI=$${ONT_IRI:+"--ontology-iri $(4)"} ; \
	$(ROBOT) query \
	 --input $(2) \
	 --update src/sparql/build/remove-ref-type.ru \
	remove \
	 --select "parents equivalents" \
	 --select "anonymous" \
	remove \
	 --select imports \
	 --trim true \
	annotate \
	 --version-iri $(3) \
	 $${ONT_IRI} \
	convert \
	 --output $(1)
    @grep -v ^owl-axioms $(1) | \
     grep -v ^date | \
     perl -lpe 'print "date: $(TS)" if $$. == 3' > $(1).tmp.obo && \
	 mv $(1).tmp.obo $(1)
endef

# ----------------------------------------
# DOID
# ----------------------------------------

.PHONY: primary
primary: $(DO).owl $(DO).obo $(DO).json

$(DO).owl: build/doid-precursor.owl src/sparql/build/add_en_tag.ru | \
 check-robot test-release
	@$(ROBOT) query \
	 --input $< \
	 --update $(word 2,$^) \
	annotate \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation oboInOwl:date "$(TS)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@echo "Created $@"

$(DO).obo: $(DO).owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","")
	@echo "Created $@"

$(DO).json: $(DO).owl | check-robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# DOID-BASE (pre-reasoned, includes logical axioms, excludes imports)
# ----------------------------------------

.PHONY: base
base: $(DB).owl $(DB).obo $(DB).json

$(DB).owl: $(EDIT_EXT) src/sparql/build/add_en_tag.ru | check-robot test-release
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim false \
	query \
	 --update $(word 2,$^) \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation oboInOwl:date "$(TS)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@echo "Created $@"

$(DB).obo: $(DB).owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@echo "Created $@"

$(DB).json: $(DB).owl | check-robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

.PHONY: merged
merged: $(DM).owl $(DM).obo $(DM).json

$(DM).owl: $(DO).owl | check-robot
	@$(ROBOT) merge \
	 --input $< \
	 --collapse-import-closure true \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --output $@
	@echo "Created $@"

$(DM).obo: $(DM).owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@echo "Created $@"

$(DM).json: $(DM).owl | check-robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# HUMANDO (pre-reasoned, excludes logical axioms and imports)
# ----------------------------------------

.PHONY: human
human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(EDIT_EXT) src/sparql/build/add_en_tag.ru | check-robot test-release
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim true \
	remove \
	 --select "parents equivalents" \
	 --select anonymous \
	query \
	 --update $(word 2,$^) \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@cp $@ $(HD).owl
	@echo "Created $@"

$(DNC).obo: $(DNC).owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@cp $@ $(HD).obo
	@echo "Created $@"

$(DNC).json: $(DNC).owl | check-robot
	@$(ROBOT) convert --input $< --output $@
	@cp $@ $(HD).json
	@echo "Created $@"


# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB_NAMES = DO_AGR_slim DO_cancer_slim DO_FlyBase_slim DO_GXD_slim DO_IEDB_slim DO_MGI_slim\
 DO_rare_slim DO_RAD_slim DO_CFDE_slim GOLD NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease DO_infectious_disease_slim \
 DO_childhood_cancer_slim
SUBS = $(foreach N,$(SUB_NAMES),$(addprefix src/ontology/subsets/, $(N)))
OWL_SUBS = $(foreach N,$(SUBS),$(addsuffix .owl, $(N)))
OBO_SUBS = $(foreach N,$(SUBS),$(addsuffix .obo, $(N)))
JSON_SUBS = $(foreach N,$(SUBS),$(addsuffix .json, $(N)))

.PHONY: subsets
subsets: $(OWL_SUBS) $(OBO_SUBS) $(JSON_SUBS)

$(OWL_SUBS): $(DNC).owl | check-robot
	@$(ROBOT) filter \
	 --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate \
	 --version-iri "$(RELEASE_PREFIX)subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" \
	 --output $@
	@echo "Created $@"

src/ontology/subsets/%.obo: src/ontology/subsets/%.owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)subsets/$(notdir $@)","$(OBO)doid/subsets/$(notdir $(basename $@))")
	@echo "Created $@"

src/ontology/subsets/%.json: src/ontology/subsets/%.owl | check-robot
	@$(ROBOT) annotate \
	 --input $< \
	 --version-iri "$(RELEASE_PREFIX)subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" \
	convert \
	 --output $@
	@echo "Created $@"


# ----------------------------------------
# DOreports (publicly available)
# ----------------------------------------

REL_REPORTS := $(patsubst src/sparql/DOreports/%.rq, DOreports/%.tsv, \
	$(wildcard src/sparql/DOreports/*.rq)) \

.PHONY: release-reports
release-reports: $(REL_REPORTS) DOreports/DO-subClassOf-anonymous.tsv \
 DOreports/DO-equivalentClass.tsv

DOreports:
	mkdir $@

DOreports/%.tsv: $(EDIT_EXT) src/sparql/DOreports/%.rq | DOreports check-robot
	@$(ROBOT) query --input $< --query $(word 2,$^) $@
	@sed '1 s/?//g' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"

DOreports/DO-subClassOf-anonymous.tsv: $(EDIT_EXT) | DOreports check-robot
	@$(ROBOT) export \
	 --input $< \
	 --header "ID|LABEL|SubClass Of [ANON]" \
	 --export $@
	@awk -F"\t" '$$3!=""' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"

DOreports/DO-equivalentClass.tsv: $(EDIT_EXT) | DOreports check-robot
	@$(ROBOT) export \
	 --input $< \
	 --header "ID|LABEL|Equivalent Class" \
	 --export $@
	@awk -F"\t" '$$3!=""' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"


# ----------------------------------------
# VERSION INPUT FILES (IMPORTS)
# ----------------------------------------

# Set versionIRI for imports & ext.owl (whether updated or not)
VERSION_IMPS = $(foreach I,$(IMPS) $(MANUAL_IMPS),$(addprefix version-, $(I)))

# No longer versioning edit file, following pattern of most of OBO
.PHONY: version-imports version-ext $(VERSION_IMPS)

## [release:release] Set versionIRIs of imports and ext.owl
version-imports: $(VERSION_IMPS) version-ext

version-ext: src/ontology/ext.owl | check-robot
	@CUR_VERS=$$(cat $< | $(extract_versionIRI)) ; \
	NEW_VERS="$(RELEASE_PREFIX)ext.owl" ; \
	if [[ "$$CUR_VERS" != "$$NEW_VERS" ]]; then \
		$(ROBOT) annotate --input $< --version-iri "$$NEW_VERS" --output $< ; \
		echo "Updated versionIRI of $<" ; \
	fi

# only version if needed to avoid omim_susc_import.owl forced file churn
$(VERSION_IMPS): version-%: src/ontology/imports/%_import.owl | check-robot
	@CUR_VERS=$$(cat $< | $(extract_versionIRI)) ; \
	NEW_VERS="$(RELEASE_PREFIX)imports/$(notdir $<)" ; \
	if [[ "$$CUR_VERS" != "$$NEW_VERS" ]]; then \
		$(ROBOT) annotate --input $< --version-iri "$$NEW_VERS" --output $< ; \
		echo "Updated versionIRI of $<" ; \
	fi


# ----------------------------------------
# RELEASE COPY
# ----------------------------------------

# Copy the latest release to the releases directory

.PHONY: publish
## [release:release] Copy products to release directory
publish: products
	@cp $(DO).* src/ontology/releases
	@cp $(DB).* src/ontology/releases
	@cp $(DM).* src/ontology/releases
	@cp $(DNC).* src/ontology/releases
	@cp $(HD).* src/ontology/releases
	@cp -r src/ontology/subsets src/ontology/releases
	@echo "Published to src/ontology/releases"
	@echo ""


# ----------------------------------------
# FILES SUPPORTING disease-ontology.org
# ----------------------------------------

.PHONY: website
website: src/facets.tsv.gz src/sitemap-disease-terms.xml

# Supports faceted search on disease-ontology.org
src/facets.tsv.gz: $(DM).owl src/sparql/build/facets.rq | check-robot
	@$(ROBOT) query --input $< --query $(word 2,$^) $(basename $@)
	@gzip -f $(basename $@)
	@echo "Created $@"

src/sitemap-disease-terms.xml: build/reports/diff-release.tsv
	@python3 src/util/update-sitemap.py --date "$(DATE)" --diff $< --sitemap $@
	@echo "Updated $@"


##########################################
## VERIFY build products
##########################################

.PHONY: verify validate-obo verify-do verify-dnc validate-doid \
 validate-doid-merged validate-doid-non-classified validate-doid-base

## [release:release] Verify OBO release products
verify: validate-obo verify-do verify-dnc

# Using fastobo-validator
OBO_V := $(patsubst src/ontology/%.obo,validate-%,$(wildcard src/ontology/*.obo))
validate-obo: validate-doid validate-doid-merged validate-doid-non-classified \
 validate-doid-base
$(OBO_V): validate-%: src/ontology/%.obo | check-fastobo
	@$(FASTOBO) $<

# Verify doid.obo
V_QUERIES := $(wildcard src/sparql/verify/verify-*.rq)
verify-do: $(DO).obo | check-robot build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(V_QUERIES) \
	 --output-dir build/reports

# Verify doid-non-classified.obo
DNC_V_QUERIES := src/sparql/verify/dnc-verify-connectivity.rq
    # We are not reduced to single inheritence in DNC
    # Once this is cleaned up, we can change to all DNC verifications
#DNC_V_QUERIES := $(wildcard src/sparql/dnc-verify-*.rq)
verify-dnc: $(DNC).obo | check-robot build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) \
	 --output-dir build/reports


##########################################
## POST-BUILD REPORT
##########################################

# Count classes, imports, and logical defs from old and new
## [release:release] Post-build reports for release products
post: build/reports/report-diff.txt \
      build/reports/branch-count.tsv \
      build/reports/missing-axioms.txt \
      build/reports/hp-do-overlap.csv

# all report queries
QUERIES := $(wildcard src/sparql/build/*-report.rq)

# target names for previous release reports
LAST_REPORTS := $(foreach Q,$(QUERIES), build/reports/$(basename $(notdir $(Q)))-last.tsv)
last-reports: $(LAST_REPORTS)
build/reports/%-last.tsv: src/sparql/build/%.rq build/doid-merged-last.owl | check-robot build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@

# target names for current release reports
NEW_REPORTS := $(foreach Q,$(QUERIES), build/reports/$(basename $(notdir $(Q)))-new.tsv)
new-reports: $(NEW_REPORTS)
build/reports/%-new.tsv: src/sparql/build/%.rq $(DM).owl | check-robot build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@

# create a clean diff between last and current reports
build/reports/report-diff.txt: last-reports new-reports
	@python3 src/util/report-diff.py
	@echo "Diff report between current release and last release available at $@"

# create a count of asserted and total (asserted + inferred) classes in each branch
#	doid-edit.owl could be used in place of doid-non-classified (pre-reasoned = same results)
branch-reports = $(foreach O, doid-non-classified doid, build/reports/temp/branch-count-$(O).tsv)

.INTERMEDIATE: $(branch-reports)
$(branch-reports): build/reports/temp/branch-count-%.tsv: src/ontology/%.owl \
 src/sparql/build/branch-count.rq | check-robot build/reports/temp
	@echo "Counting all branches in $<..."
	@$(ROBOT) query \
	 --input $< \
	 --query $(word 2,$^) $@

build/reports/branch-count.tsv: $(branch-reports)
	@join -t $$'\t' -o $$'\t' <(sed '/^?/d' $< | sort -k1) <(sed '/^?/d' $(word 2,$^) | sort -k1) > $@
	@awk 'BEGIN{ FS=OFS="\t" ; print "branch\tasserted\tinferred\ttotal" } \
	 {print $$1, $$2, $$3-$$2, $$3}' $@ > $@.tmp && mv $@.tmp $@
	@echo "Branch counts available at $@"


# the following targets are used to build a smaller diff with only removed axioms to review
build/robot.diff: build/doid-merged-last.owl $(DM).owl | check-robot
	@echo "Comparing axioms in previous release to current release"
	@$(ROBOT) diff \
	 --left $< \
	 --right $(word 2,$^) \
	 --labels true \
	 --output $@

build/reports/missing-axioms.txt: src/util/parse-diff.py build/robot.diff | build/reports
	@python3 $^ $@

build/hp-do-terms.tsv: $(DM).owl src/sparql/build/hp-and-do-terms.rq | check-robot
	@echo "Finding overlap between HP and DO terms..."
	@$(ROBOT) query --input $< --query $(word 2,$^) $@

build/reports/hp-do-overlap.csv: src/util/get_hp_overlap.py build/hp-do-terms.tsv
	@python3 $^ $@


##########################################
## TRANSLATIONS
##########################################

LANGS := es
DOLANG := src/ontology/releases/translations/doid

.PHONY: translations international $(LANGS)
## [release] Build translation products & generate reports
translations: $(LANGS) international lang-reports

## [release:translations] Build doid-international.owl
international: $(DOLANG)-international.owl

$(LANGS): %: $(DOLANG)-%.owl $(DOLANG)-%.obo


# ----------------------------------------
# INTERMEDIATE FILES
# ----------------------------------------

## LANG-SPECIFIC QUERY FILES
LANGQPFX := $(addprefix build/translations/,$(LANGS))

$(LANGQPFX)-%.ru: src/sparql/build/lang_param-%.ru | build/translations
	@sed 's/@lang/"$(subst -$*,,$(notdir $(basename $@)))"/g' $< > $@

## GENERATE ROBOT TEMPLATES
build/translations/%-rtlist.txt build/translations/%-annot.txt: \
  src/translations/doid-%.tsv src/util/lang-rt.py | build/translations
	@python3 $(word 2,$^) $< $(dir $@)$*
	@ls $(dir $@)$*-rt-*.tsv > build/translations/$*-rtlist.txt
	@echo "Created language templates: $*"

# ----------------------------------------
# DOID-LANG
# ----------------------------------------

# start from doid.owl instead of doid-merged.owl to avoid processing lang tags
# on imported classes
$(DOLANG)-%.owl build/translations/%.owl build/translations/%-unmerged.owl: \
  $(DO).owl build/translations/%-rtlist.txt build/translations/%-annot.txt \
  src/sparql/build/lang-dedup_acronym.ru \
  build/translations/%-mv_def_annot.ru build/translations/%-only_lang.ru | \
  check-robot
	@TMPLT=$$(sed 's/^/--template /' $(word 2,$^)) ; \
	ANNOT_ARRAY=() ; \
	 while IFS= read -r line; do \
		ANNOT_ARRAY+=("$$line") ; \
	 done < $(word 3,$^) ; \
	$(ROBOT) template \
	 --input $< \
	 $$TMPLT \
	 --merge-after \
	 --output build/translations/$*.owl \
	query \
	 --update $(word 4,$^) \
	 --update $(word 5,$^) \
	 --update $(word 6,$^) \
	annotate \
	 --ontology-iri "$(OBO)doid/translations/$(notdir $(DOLANG)-$*.owl)" \
	 --version-iri "$(RELEASE_PREFIX)translations/$(notdir $(DOLANG)-$*.owl)" \
	 --annotation dc11:language "$*" \
	 "$${ANNOT_ARRAY[@]}" \
	 --output build/translations/$*-unmerged.owl
	@$(ROBOT) --catalog src/ontology/catalog-v001.xml merge \
	 --input build/translations/$*-unmerged.owl \
	 --collapse-import-closure true \
	 --output $(DOLANG)-$*.owl
	@echo "Created $(DOLANG)-$*.owl"

$(DOLANG)-%.obo: build/translations/%-unmerged.owl | check-robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)translations/$(notdir $@)","$(OBO)doid/translations/$(notdir $(basename $@))")
	@echo "Created $@"

# ----------------------------------------
# DOID-INTERNATIONAL
# ----------------------------------------

LANG_IMPORTS := $(addprefix build/translations/,$(addsuffix .owl, $(LANGS)))
LANG_ANNOTS := $(addprefix build/translations/,$(addsuffix -annot.txt, $(LANGS)))

# must set --collapse-import-closure true to use up-to-date imports
#  ignores catalog files otherwise?
$(DOLANG)-international.owl: $(DO).owl $(LANG_IMPORTS) $(LANG_ANNOTS) \
  src/sparql/build/lang-dedup_acronym.ru | check-robot
	@ANNOT_ARRAY=() ; \
	 for file in $(filter build/translations/%-annot.txt,$^); do \
		while IFS= read -r line; do \
			ANNOT_ARRAY+=("$$line") ; \
		done < "$$file" ; \
	done ; \
	$(ROBOT) merge \
	 $(addprefix --input ,$(filter %.owl,$^)) \
	 --collapse-import-closure true \
	query \
	 --update $(lastword $^) \
	annotate \
	 --ontology-iri "$(OBO)doid/translations/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)translations/$(notdir $@)" \
	 $(patsubst %,--annotation dc11:language "%",$(LANGS)) \
	 "$${ANNOT_ARRAY[@]}" \
	 --output $@
	@echo "Created $@"

# ----------------------------------------
# INTERNATIONAL REPORT
# ----------------------------------------

LANG_QUERIES := $(wildcard src/sparql/build/intl-report-*.rq)
LANG_REPORTS := $(foreach Q,$(LANG_QUERIES),build/reports/$(basename $(notdir $(Q))).tsv)

.PHONY: lang-reports
## [release:translations] Language counts
lang-reports: $(LANG_REPORTS)

$(LANG_REPORTS): build/reports/%.tsv: src/sparql/build/%.rq $(DOLANG)-international.owl | check-robot build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@
