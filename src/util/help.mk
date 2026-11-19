# Self-documenting `make help*` targets. Document a target with a
# `## [group] description` line directly above its rule (parsed by help.awk);
# nest a sub-target under a documented parent with `## [group:parent] description`.
#
# Each Makefile must set, BEFORE including this file:
#   HELP_GROUPS        groups in display order (a single group gives a flat `make help`)
#   HELP_DESC_<group>  optional description of each group
# and may set HELP_COMMON_<group> (frequent targets) or HELP_COMMON (ungrouped).
# Group names are case-sensitive and must match the tags exactly

HELP_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
# Recursive so that makefiles included after this one are also parsed.
HELP_SRC = $(MAKEFILE_LIST)
HELP_COMMON ?=
HELP_DEFAULT_MODE ?= summary
HELP_COMMON_GROUPS = $(foreach g,$(HELP_GROUPS),$(if $(filter undefined,$(origin HELP_COMMON_$(g))),,$(if $(strip $(HELP_COMMON_$(g))),$(g))))

HELP_SPEC = $(foreach g,$(HELP_GROUPS),$(g)|$(if $(filter undefined,$(origin HELP_DESC_$(g))),,$(HELP_DESC_$(g)));)
HELP_AWK = awk -v spec="$(HELP_SPEC)" -f $(HELP_DIR)help.awk

.PHONY: help help-all $(addprefix help-,$(HELP_GROUPS))
help:
	@echo "Usage: make <target>   (NEVER use -j)"
ifneq "$(strip $(HELP_COMMON_GROUPS))" ""
	@echo ""
	@echo "Frequent target(s):"
	@$(foreach g,$(HELP_COMMON_GROUPS),printf "  %s %s (make help-%s)\n" "-" "$(HELP_COMMON_$(g))" "$(g)"; )
else ifneq "$(strip $(HELP_COMMON))" ""
	@echo ""
	@echo "Frequent target(s): $(HELP_COMMON)"
endif
ifeq ($(HELP_DEFAULT_MODE),all)
	@$(HELP_AWK) -v mode=all $(HELP_SRC)
else ifeq ($(words $(HELP_GROUPS)),1)
	@$(HELP_AWK) -v mode=all $(HELP_SRC)
else
	@echo ""
	@echo "Display help for groups of targets:"
	@echo "  help-all           Show all documentation groups and their targets"
	@$(HELP_AWK) -v mode=summary $(HELP_SRC)
endif
	@echo ""
	@echo "Workflows & details: src/ontology/README-make.md"

$(addprefix help-,$(HELP_GROUPS)): help-%:
	@$(HELP_AWK) -v mode=list -v grp=$* $(HELP_SRC)
	@$(if $(filter undefined,$(origin HELP_AFTER_$*)),:,$(HELP_AFTER_$*))
	@echo ""

help-all:
	@$(HELP_AWK) -v mode=all $(HELP_SRC)
	@$(if $(filter undefined,$(origin HELP_AFTER_all)),:,$(HELP_AFTER_all))
	@echo ""
