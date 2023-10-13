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
DB = src/ontology/doid-base
DM = src/ontology/doid-merged
DNC = src/ontology/doid-non-classified
HD = src/ontology/HumanDO

# Set the ROBOT version to use
ROBOT_VRS = 1.9.4

# to make a release, use `make release`
# to update imports, use `make imports`
# to run QC tests on doid-edit.owl, use `make test`

# Release process:
# 1. Build import modules (if anything has changed)
# 2. Update versionIRIs of import modules to release
# 3. Build all products (doid, doid-non-classified, doid-merged, all subsets)
# 4. Validate syntax of OBO-format products with fastobo-validator
# 5. Verify logical structure of products with SPARQL queries
# 6. Publish to release directory
# 7. Generate post-build reports (counts, etc.)
.PHONY: release all
release: version_imports test products verify publish post

# Only run `make all` if you'd like to update imports to the latest version
#	during the release!
all: imports release


##########################################
## SETUP
##########################################

.PHONY: clean
clean:
	rm -rf build

build build/update build/reports build/reports/temp:
	mkdir -p $@

# ----------------------------------------
# ROBOT
# ----------------------------------------

# ROBOT is automatically updated
ROBOT := java -jar build/robot.jar

.PHONY: check_robot
check_robot:
	@if [[ -f build/robot.jar ]]; then \
		VRS=$$($(ROBOT) --version) ; \
		if [[ "$$VRS" != *"$(ROBOT_VRS)"* ]]; then \
			echo "Updating ROBOT from version $$VRS to $(ROBOT_VRS)..." ; \
			rm -rf build/robot.jar && $(MAKE) build/robot.jar ; \
		fi ; \
	else \
		echo "Downloading ROBOT version $(ROBOT_VRS)..." ; \
		$(MAKE) build/robot.jar ; \
	fi

# run `make refresh_robot` if ROBOT is not working correctly
.PHONY: refresh_robot
refresh_robot:
	rm -rf build/robot.jar && $(MAKE) build/robot.jar

build/robot.jar: | build
	@curl -L -o $@ https://github.com/ontodev/robot/releases/download/v$(ROBOT_VRS)/robot.jar

# ----------------------------------------
# FASTOBO
# ----------------------------------------

# fastobo is used to validate OBO structure
FASTOBO := build/fastobo-validator

build/fastobo-validator.zip: | build
	curl -Lk -o $@ https://github.com/fastobo/fastobo-validator/releases/latest/download/fastobo-validator_null_x86_64-apple-darwin.zip

$(FASTOBO): build/fastobo-validator.zip
	cd build && unzip -DD $(notdir $<) fastobo-validator


##########################################
## PRE-BUILD TESTS
##########################################

.PHONY: test report reason verify-edit quarterly_test

# `make test` is used for Github integration
test: reason report verify-edit

# Report for general issues on doid-edit
report: build/reports/report.tsv

.PRECIOUS: build/reports/report.tsv
build/reports/report.tsv: $(EDIT) src/sparql/report/report_profile.txt | check_robot build/reports
	@echo ""
	@$(ROBOT) report \
	 --input $< \
	 --profile $(word 2,$^) \
	 --labels true \
	 --output $@
	@echo "Full doid-edit QC report available at $@"
	@echo ""

# Simple reasoning test
reason: build/update/doid-edit-reasoned.owl

build/update/doid-edit-reasoned.owl: $(EDIT) | check_robot build/update
	@$(ROBOT) reason \
	 --input $< \
	 --create-new-ontology false \
	 --annotate-inferred-axioms false \
	 --exclude-duplicate-axioms true \
	 --output $@
	@echo "Reasoning completed successfully!"

# Verify doid-edit.owl
EDIT_V_QUERIES := $(wildcard src/sparql/verify/edit-verify-*.rq)

verify-edit: $(EDIT) | check_robot
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(EDIT_V_QUERIES) \
	 --output-dir build/reports

# Verify of doid-edit.owl that should be run quarterly (not part of release)
QUARTER_V_QUERIES := $(wildcard src/sparql/verify/quarter-verify-*.rq)

quarterly_test: build/reports/quarterly_test.csv
build/reports/quarterly_test.csv: $(EDIT) | check_robot build/reports/temp
	@echo "Verifying $<..."
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(QUARTER_V_QUERIES) \
	 --fail-on-violation false \
	 --output-dir $(word 2,$|)
	@TMP_FILES=$$(find $(word 2,$|) -name "quarter-verify-*.csv") ; \
	 if [ "$$TMP_FILES" ]; then \
		awk 'BEGIN { OFS = FS = "," } ; { \
			if (FNR == 1) { \
				gsub(/^.*quarter-verify-|\.csv/, "", FILENAME) ; \
				if (NR != 1) { print "" } ; \
				print "TEST: " FILENAME ; print $$0 \
			} \
			else { print $$0 } \
		}' $$TMP_FILES > $@ && \
		rm -f $$TMP_FILES ; \
		echo "--> See $@ for errors" ; \
	 fi ;


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
	curl -Lk -o $@ https://raw.githubusercontent.com/obophenotype/human-phenotype-ontology/master/src/ontology/hpo_british_english_dictionary.csv

build/update/synonyms.csv: $(EDIT) src/sparql/update/doid_synonyms.rq | check_robot build/update
	@echo "Retrieving DO synonyms..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/update/labels.csv: $(EDIT) src/sparql/update/doid_labels.rq | check_robot build/update
	@echo "Retrieving DO labels..."
	@$(ROBOT) query -i $< --query $(word 2,$^) $@

build/be_synonyms.csv: src/util/compute_british_synonyms.py \
 build/update/labels.csv build/update/synonyms.csv \
 build/update/british_english_dictionary.csv
	@echo "Building synonyms template..."
	@python3 $^ $@

build/update/british_synonyms.owl: $(EDIT) build/update/be_synonyms.csv | check_robot
	@$(ROBOT) template --input $< --template $(word 2,$^) --output $@

add_british_synonyms: $(EDIT) build/update/british_synonyms.owl | check_robot
	@$(ROBOT) merge \
	 --input $< \
	 --input $(word 2,$^) \
	 --collapse-import-closure false \
	 --output doid-edit.ofn \
	&& mv doid-edit.ofn $^
	@echo "British synonyms added to $^"

# ----------------------------------------
# AUTO-UPDATE SUBSETS
# ----------------------------------------

SUB_ADD := $(patsubst src/sparql/update/subsets/%.rq, update_%, \
	$(wildcard src/sparql/update/subsets/*.rq))
SUB_AUTO := $(patsubst src/sparql/update/subsets/%.ru, update_%, \
	$(wildcard src/sparql/update/subsets/*.ru))

.PHONY: update_slims $(SUB_ADD) $(SUB_AUTO)
update_slims: $(SUB_ADD) $(SUB_AUTO)

# so far only DO_infectious_disease_slim needs a reasoned doid-edit but it's
#	easier to keep one rule for all slim templates at the moment; may change
#	this if multiple slims don't need reasoned file.
build/update/%-template.tsv: build/update/doid-edit-reasoned.owl \
 src/sparql/update/subsets/%.rq | check_robot build/update
	@echo "CHECKING $* subset for missing classes..."
	@$(ROBOT) query \
	 --input $< \
	 --query $(word 2,$^) build/update/$*-missing.tsv
	@sed '1s/.*/ID\tsubset\nID\tAI oboInOwl:inSubset/' build/update/$*-missing.tsv | \
	 sed -E 's|<(.+)>|\1\tdoid:$*|' > build/update/$*-template.tsv
	@rm build/update/$*-missing.tsv

$(SUB_ADD): update_%: $(EDIT) build/update/%-template.tsv | check_robot
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

$(SUB_AUTO): update_%: $(EDIT) src/sparql/update/subsets/%.ru | check_robot \
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
# FIX DATA - TYPOS, PATTERNS, ETC. (use fix_cmds to list)
# ----------------------------------------

FIX_FILES := $(wildcard src/sparql/update/fix_*.ru)
FIX := $(basename $(notdir $(FIX_FILES)))

.PHONY: fix_cmds fix_data $(FIX)

# reports possible commands with description from first line of SPARQL update file
fix_cmds:
	@echo -e "\n\nThe following make rules can be used to 'fix' data:\n"
	@for f in $(FIX_FILES); do \
		printf -- '- %s:\t%s\n' $$(basename $$f .ru) "$$(sed '1s/# //;q' $$f )" ; \
	 done
	@echo -e "\nTo run all use: fix_data\n\n"

# run all fix_cmds
fix_data: $(FIX)

$(FIX): fix_%: $(EDIT) src/sparql/update/fix_%.ru | \
 check_robot src/sparql/update/doid-edit_prefixes.json
	@$(ROBOT) \
	 --add-prefixes $(word 2,$|) \
	query \
	 --input $< \
	 --update $(word 2,$^) \
	 --output doid-edit.ofn \
	&& mv doid-edit.ofn $<
	@echo "Fixed $* (review with: git diff --word-diff-regex='.' -- src/ontology/doid-edit.owl)"


##########################################
## BUILDING IMPORTS
##########################################

# Import update options (each can be executed here or from the src/ontology/imports dir):
# 1. `make imports` - Make all imports from existing source files (WARNING: will download ONLY if they don't exist).
# 2. `make refresh_imports` - Make all imports from newly downloaded source files.
# 3. `make <import name>` - Make specified import from existing soure file (WARNING: will download ONLY if it doesn't exist).
# 4. `make refresh_<import name>` - Make specified import from newly downloaded source file.

IMPS := chebi cl eco foodon geno hp ncbitaxon ro so symp trans uberon
# define imports updated manually, solely for versioning
MANUAL_IMPS := disdriv omim_susc

imports: | check_robot
	@echo "Checking import modules..."
	@cd src/ontology/imports && $(MAKE) imports

refresh_imports: | check_robot
	@echo "Refreshing import modules (this may take some time)..."
	@cd src/ontology/imports && $(MAKE) refresh_imports

$(IMPS): | check_robot
	@echo "Generating $@ import module..."
	@cd src/ontology/imports && $(MAKE) $@

# Refresh (clean & rebuild) *individual* imports with `refresh_{import}`
REFRESH_IMPS := $(foreach IMP,$(IMPS),refresh_$(IMP))
$(REFRESH_IMPS):
	@cd src/ontology/imports && $(MAKE) $@

.PHONY: imports refresh_imports $(IMPS) $(REFRESH_IMPS)


##########################################
## RELEASE PRODUCTS
##########################################

.PHONY: products
products: primary human merged base subsets release_reports

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

$(DO).owl: $(EDIT) build/reports/report.tsv | check_robot
	@$(ROBOT) reason \
	 --input $< \
	 --create-new-ontology false \
	 --annotate-inferred-axioms false \
	 --exclude-duplicate-axioms true \
	annotate \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation oboInOwl:date "$(TS)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@echo "Created $@"

$(DO).obo: $(DO).owl | check_robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","")
	@echo "Created $@"

$(DO).json: $(DO).owl | check_robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# DOID-BASE
# ----------------------------------------

.PHONY: base
base: $(DB).owl $(DB).obo $(DB).json

$(DB).owl: $(EDIT) | check_robot
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim false \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@echo "Created $@"

$(DB).obo: $(DB).owl | check_robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@echo "Created $@"

$(DB).json: $(DB).owl | check_robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

.PHONY: merged
merged: $(DM).owl $(DM).obo $(DM).json

$(DM).owl: $(DO).owl | check_robot
	@$(ROBOT) merge \
	 --input $< \
	 --collapse-import-closure true \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --output $@
	@echo "Created $@"

$(DM).obo: $(DM).owl | check_robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@echo "Created $@"

$(DM).json: $(DM).owl | check_robot
	@$(ROBOT) convert --input $< --output $@
	@echo "Created $@"

# ----------------------------------------
# HUMANDO
# ----------------------------------------

.PHONY: human
human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(EDIT) | check_robot
	@$(ROBOT) remove \
	 --input $< \
	 --select imports \
	 --trim true \
	remove \
	 --select "parents equivalents" \
	 --select anonymous \
	annotate \
	 --ontology-iri "$(OBO)doid/$(notdir $@)" \
	 --version-iri "$(RELEASE_PREFIX)$(notdir $@)" \
	 --annotation owl:versionInfo "$(DATE)" \
	 --output $@
	@cp $@ $(HD).owl
	@echo "Created $@"

$(DNC).obo: $(DNC).owl | check_robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)$(notdir $@)","$(OBO)doid/$(notdir $(basename $@))")
	@cp $@ $(HD).obo
	@echo "Created $@"

$(DNC).json: $(DNC).owl | check_robot
	@$(ROBOT) convert --input $< --output $@
	@cp $@ $(HD).json
	@echo "Created $@"

# ----------------------------------------
# SUBSETS
# ----------------------------------------

SUB_NAMES = DO_AGR_slim DO_cancer_slim DO_FlyBase_slim DO_GXD_slim DO_IEDB_slim DO_MGI_slim\
 DO_rare_slim DO_RAD_slim DO_CFDE_slim GOLD NCIthesaurus TopNodes_DOcancerslim gram-negative_bacterial_infectious_disease\
 gram-positive_bacterial_infectious_disease sexually_transmitted_infectious_disease\
 tick-borne_infectious_disease zoonotic_infectious_disease DO_infectious_disease_slim
SUBS = $(foreach N,$(SUB_NAMES),$(addprefix src/ontology/subsets/, $(N)))
OWL_SUBS = $(foreach N,$(SUBS),$(addsuffix .owl, $(N)))
OBO_SUBS = $(foreach N,$(SUBS),$(addsuffix .obo, $(N)))
JSON_SUBS = $(foreach N,$(SUBS),$(addsuffix .json, $(N)))

.PHONY: subsets
subsets: $(OWL_SUBS) $(OBO_SUBS) $(JSON_SUBS)

$(OWL_SUBS): $(DNC).owl | check_robot
	@$(ROBOT) filter \
	 --input $< \
	 --select "oboInOwl:inSubset=<$(OBO)doid#$(basename $(notdir $@))> annotations" \
	annotate \
	 --version-iri "$(RELEASE_PREFIX)subsets/$(notdir $@)" \
	 --ontology-iri "$(OBO)doid/subsets/$(notdir $@)" \
	 --output $@
	@echo "Created $@"

src/ontology/subsets/%.obo: src/ontology/subsets/%.owl | check_robot
	$(call build_obo,$@,$<,"$(RELEASE_PREFIX)subsets/$(notdir $@)","$(OBO)doid/subsets/$(notdir $(basename $@))")
	@echo "Created $@"

src/ontology/subsets/%.json: src/ontology/subsets/%.owl | check_robot
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

.PHONY: release_reports
release_reports: $(REL_REPORTS) DOreports/DO-subClassOf-anonymous.tsv \
 DOreports/DO-equivalentClass.tsv

DOreports:
	mkdir $@

DOreports/%.tsv: $(EDIT) src/sparql/DOreports/%.rq | DOreports check_robot
	@$(ROBOT) query --input $< --query $(word 2,$^) $@
	@sed '1 s/?//g' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"

DOreports/DO-subClassOf-anonymous.tsv: $(EDIT) | DOreports check_robot
	@robot export \
	 --input $< \
	 --header "ID|LABEL|SubClass Of [ANON]" \
	 --export $@
	@awk -F"\t" '$$3!=""' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"

DOreports/DO-equivalentClass.tsv: $(EDIT) | DOreports check_robot
	@robot export \
	 --input $< \
	 --header "ID|LABEL|Equivalent Class" \
	 --export $@
	@awk -F"\t" '$$3!=""' $@ > $@.tmp && mv $@.tmp $@
	@echo "Created $@"


# ----------------------------------------
# VERSION IMPORTS
# ----------------------------------------

# Set versionIRI for imports & ext.owl (whether updated or not)
VERSION_IMPS = $(foreach I,$(IMPS) $(MANUAL_IMPS),$(addprefix version_, $(I)))

.PHONY: version_imports version_ext $(VERSION_IMPS)
version_imports: $(VERSION_IMPS) version_ext

version_ext: src/ontology/ext.owl | check_robot
	@$(ROBOT) annotate \
	 --input $< \
	 --version-iri "$(RELEASE_PREFIX)ext.owl" \
	 --output $<
	@echo "Updated versionIRI of $<"

$(VERSION_IMPS): version_%: src/ontology/imports/%_import.owl | check_robot
	@$(ROBOT) annotate \
	 --input $< \
	 --version-iri "$(RELEASE_PREFIX)imports/$(notdir $<)" \
	 --output $<
	@echo "Updated versionIRI of $<"

# ----------------------------------------
# RELEASE COPY
# ----------------------------------------

# Copy the latest release to the releases directory

.PHONY: publish
publish: $(DO).owl $(DO).obo $(DO).json\
 $(DB).owl\
 $(DM).owl $(DM).obo\
 $(DNC).owl $(DNC).obo $(DNC).json\
 subsets
	@cp $(DO).* src/ontology/releases
	@cp $(DB).owl src/ontology/releases
	@cp $(DM).* src/ontology/releases
	@cp $(DNC).* src/ontology/releases
	@cp -r src/ontology/subsets src/ontology/releases
	@echo "Published to src/ontology/releases"
	@echo ""


##########################################
## VERIFY build products
##########################################

.PHONY: verify validate-obo verify-do verify-dnc validate-doid \
 validate-doid-merged validate-doid-non-classified validate-doid-base

verify: validate-obo verify-do verify-dnc

# Using fastobo-validator
OBO_V := $(patsubst src/ontology/%.obo,validate-%,$(wildcard src/ontology/*.obo))
validate-obo: validate-doid validate-doid-merged validate-doid-non-classified \
 validate-doid-base
$(OBO_V): validate-%: src/ontology/%.obo | $(FASTOBO)
	@$(FASTOBO) $<

# Verify doid.obo
V_QUERIES := $(wildcard src/sparql/verify/verify-*.rq)
verify-do: $(DO).obo | check_robot build/reports/report.tsv
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
verify-dnc: $(DNC).obo | check_robot build/reports/report.tsv
	@echo "Verifying $< (see build/reports on error)"
	@$(ROBOT) verify \
	 --input $< \
	 --queries $(V_QUERIES) $(DNC_V_QUERIES) \
	 --output-dir build/reports


##########################################
## POST-BUILD REPORT
##########################################

# Count classes, imports, and logical defs from old and new
post: build/reports/report-diff.txt \
      build/reports/branch-count.tsv \
      build/reports/missing-axioms.txt \
      build/reports/hp-do-overlap.csv

# Get the last build of DO from IRI
# .PHONY: build/doid-last.owl
build/doid-last.owl: | check_robot
	@$(ROBOT) merge \
	 --input-iri http://purl.obolibrary.org/obo/doid/doid-merged.owl \
	 --collapse-import-closure true \
	 --output $@

build/reports/doid-diff.html: build/doid-last.owl $(DM).owl | check_robot build/reports
	@$(ROBOT) diff --left $< --right $(word 2, $^) --format html --output $@
	@echo "Generated DOID diff report at $@"

# all report queries
QUERIES := $(wildcard src/sparql/build/*-report.rq)

# target names for previous release reports
LAST_REPORTS := $(foreach Q,$(QUERIES), build/reports/$(basename $(notdir $(Q)))-last.tsv)
last-reports: $(LAST_REPORTS)
build/reports/%-last.tsv: src/sparql/build/%.rq build/doid-last.owl | check_robot build/reports
	@echo "Counting: $(notdir $(basename $@))"
	@$(ROBOT) query \
	 --input $(word 2,$^) \
	 --query $< $@

# target names for current release reports
NEW_REPORTS := $(foreach Q,$(QUERIES), build/reports/$(basename $(notdir $(Q)))-new.tsv)
new-reports: $(NEW_REPORTS)
build/reports/%-new.tsv: src/sparql/build/%.rq $(DM).owl | check_robot build/reports
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
branch_reports = $(foreach O, doid-non-classified doid, build/reports/temp/branch-count-$(O).tsv)

.INTERMEDIATE: $(branch_reports)
$(branch_reports): build/reports/temp/branch-count-%.tsv: src/ontology/%.owl \
 src/sparql/build/branch-count.rq | check_robot build/reports/temp
	@echo "Counting all branches in $<..."
	@$(ROBOT) query \
	 --input $< \
	 --query $(word 2,$^) $@

build/reports/branch-count.tsv: $(branch_reports)
	@join -t $$'\t' -o $$'\t' <(sed '/^?/d' $< | sort -k1) <(sed '/^?/d' $(word 2,$^) | sort -k1) > $@
	@awk 'BEGIN{ FS=OFS="\t" ; print "branch\tasserted\tinferred\ttotal" } \
	 {print $$1, $$2, $$3-$$2, $$3}' $@ > $@.tmp && mv $@.tmp $@
	@echo "Branch counts available at $@"


# the following targets are used to build a smaller diff with only removed axioms to review
build/robot.diff: build/doid-last.owl $(DM).owl | check_robot
	@echo "Comparing axioms in previous release to current release"
	@$(ROBOT) diff \
	 --left $< \
	 --right $(word 2,$^) \
	 --labels true \
	 --output $@

build/reports/missing-axioms.txt: src/util/parse-diff.py build/robot.diff | build/reports
	@python3 $^ $@

build/hp-do-terms.tsv: $(DM).owl src/sparql/build/hp-and-do-terms.rq | check_robot
	@echo "Finding overlap between HP and DO terms..."
	@$(ROBOT) query --input $< --query $(word 2,$^) $@

build/reports/hp-do-overlap.csv: src/util/get_hp_overlap.py build/hp-do-terms.tsv
	@python3 $^ $@
