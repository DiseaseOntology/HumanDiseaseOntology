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

release: all
all: | report build merged simple human subsets publish

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
# REPORT
# ----------------------------------------

REP = reports/

report: $(REP)report.yaml

# report will fail on error
$(REP)report.yaml: $(EDIT)
	$(ROBOT) report --input $< --profile "reports/profile.txt"\
	 --output $@ --format yaml

# ----------------------------------------
# RELEASE
# ----------------------------------------

build: $(DO).owl $(DO).obo $(DO).json

# release vars
TS = $(shell date +'%m:%d:%Y %H:%M')
DATE = $(shell date +'%Y-%m-%d')

$(DO).owl: $(EDIT)
	$(ROBOT) reason --input $<\
	 annotate --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/doid.owl"\
	 --annotation oboInOwl:date "$(TS)" --output $@

$(DO).obo: $(DO).owl
	$(ROBOT) convert --input $< --output $@ --check false

$(DO).json: $(DO).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# DOID-MERGED
# ----------------------------------------

DM = doid-merged

merged: $(DM).owl $(DM).obo $(DM).json

$(DM).owl: $(DO).owl
	$(ROBOT) merge --input $< --collapse-import-closure true\
	 annotate --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/doid-merged.owl"\
	 --ontology-iri "http://purl.obolibrary.org/obo/doid/doid-merged.owl"\
	 --output $@

$(DM).obo: $(DM).owl
	$(ROBOT) convert --input $< --output $@ --check false

$(DM).json: $(DM).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# DOID-SIMPLE
# ----------------------------------------

DS = doid-simple

simple: $(DS).owl $(DS).obo $(DS).json

$(DS).owl: $(DO).owl
	$(ROBOT) remove --input $< --select imports --trim true\
	 annotate --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/doid-simple.owl"\
	 --ontology-iri --ontology-iri "http://purl.obolibrary.org/obo/doid/doid-simple.owl"\
	 --output $@

$(DS).obo: $(DS).owl
	$(ROBOT) convert --input $< --output $@ --check false

$(DS).json: $(DS).owl
	$(ROBOT) convert --input $< --output $@

# ----------------------------------------
# HUMANDO
# ----------------------------------------

DNC = doid-non-classified
HD = HumanDO

human: $(DNC).owl $(DNC).obo $(DNC).json

$(DNC).owl: $(DS).owl
	$(ROBOT) remove --input $< --axioms logical --trim true\
	 annotate --ontology-iri "http://purl.obolibrary.org/obo/doid/doid-non-classified.owl"\
	 --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/doid-non-classified.owl"\
	 --output $@ &&\
	 annotate --input $@ --ontology-iri "http://purl.obolibrary.org/obo/doid/HumanDO.owl"\
	 --version-iri "http://purl.obolibrary.org/obo/doid/releases/$(DATE)/HumanDO.owl"\
	 --output $(HD).owl\

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
	 --select "oboInOwl:inSubset=<http://purl.obolibrary.org/obo/doid#$(basename $@)>"\
	 --trim true \
	 annotate --version-iri "http://purl.obolibrary.org/obo/doid/$(DATE)/subsets/$@.owl"\
	 --ontology-iri "http://purl.obolibrary.org/obo/doid/subsets/$@.owl"\
	 --output $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 && $(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .obo, $@)) --check false\
	 && $(ROBOT) convert --input $(addprefix $(SUB), $(addsuffix .owl, $@))\
	 --output $(addprefix $(SUB), $(addsuffix .json, $@))

# ----------------------------------------
# FOLDER
# ----------------------------------------

RD = releases/$(DATE)/

publish:
	mkdir $(RD) \
	 && cp $(DO).* $(RD)\
	 && cp $(DM).* $(RD)\
	 && cp $(DS).* $(RD)\
	 && cp $(HD).* $(RD)\
	 && cp $(DNC).* $(RD)\
	 && mkdir $(RD)/$(SUB)\
	 && cp -r $(SUB) $(RD)/$(SUB)
