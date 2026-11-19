# Help configuration and data-driven targets for the root Makefile only. Include
# BEFORE help.mk, which needs the groups below. Descriptions of data-driven
# targets are the first line of each SPARQL file. args = files, target prefix

# Display order of groups
HELP_GROUPS := tests imports maintenance release caution
HELP_DESC_tests := Curation Quality Control (QC) tests
HELP_DESC_imports := Build and update import modules
HELP_DESC_maintenance := Occasional curator tools: fixes, updates, quarterly tests
HELP_DESC_release := Creating release files and reports
HELP_DESC_caution := Reset software and support files

HELP_COMMON_tests := test, test-omim_susc
HELP_COMMON_release := release, translations

define list_sparql
	@for f in $(1); do \
		n=$$(basename $$f) ; n=$${n%.*} ; \
		d=$$(sed '1s/^# *//;q' $$f) ; \
		printf -- '  %-36s %s\n' "$(2)$${n}" "$${d:-(no description)}" ; \
	 done
endef

.PHONY: help-fix help-update

## [maintenance] List fix-* rules and descriptions
help-fix:
	@echo -e "\nRules that 'fix' data ('make fix' runs all):\n"
	$(call list_sparql,$(FIX_FILES),)
	@echo -e "\nOptional rules, excluded from 'make fix' (REVIEW RESULTS CAREFULLY):\n"
	$(call list_sparql,$(OPT_FIX_FILES),)
	@echo ""

## [maintenance] List update-* targets and descriptions
help-update:
	@echo -e "\nSubset updates ('make update-slims' runs all):\n"
	$(call list_sparql,$(wildcard src/sparql/update/subsets/*.rq src/sparql/update/subsets/*.ru),update-)
	@echo -e "\nxref updates ('make update-xrefs' runs all):\n"
	$(call list_sparql,$(wildcard src/sparql/update/xrefs/*.ru),update-)
	@echo ""
