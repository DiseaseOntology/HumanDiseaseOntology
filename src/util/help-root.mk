# Help configuration and data-driven targets for the root Makefile only. Include
# BEFORE help.mk, which needs the groups below. Descriptions of data-driven
# targets are the first line of each SPARQL file. args = files, target prefix

# Display order of groups
HELP_GROUPS := tests imports maintain release caution
HELP_DESC_tests := Curation Quality Control (QC) tests
HELP_DESC_imports := Build and update import modules
HELP_DESC_maintain := Occasional curator tools: fixes, updates, quarterly tests
HELP_DESC_release := Creating release files and reports
HELP_DESC_caution := Reset software and support files

HELP_COMMON_tests := test, test_omim_susc
HELP_COMMON_release := release, translations

define list_sparql
	@for f in $(1); do \
		n=$$(basename $$f) ; n=$${n%.*} ; \
		d=$$(sed '1s/^# *//;q' $$f) ; \
		printf -- '  %-36s %s\n' "$(2)$${n}" "$${d:-(no description)}" ; \
	 done
endef

.PHONY: help-fix help-update

## [maintain] List fix_* rules and descriptions
help-fix:
	@echo -e "\nRules that 'fix' data ('make fix' runs all):\n"
	$(call list_sparql,$(FIX_FILES),)
	@echo -e "\nOptional rules, excluded from 'make fix' (REVIEW RESULTS CAREFULLY):\n"
	$(call list_sparql,$(OPT_FIX_FILES),)
	@echo ""

## [maintain] List update_* targets and descriptions
help-update:
	@echo -e "\nSubset updates ('make update_slims' runs all):\n"
	$(call list_sparql,$(wildcard src/sparql/update/subsets/*.rq src/sparql/update/subsets/*.ru),update_)
	@echo -e "\nxref updates ('make update_xrefs' runs all):\n"
	$(call list_sparql,$(wildcard src/sparql/update/xrefs/*.ru),update_)
	@echo ""
