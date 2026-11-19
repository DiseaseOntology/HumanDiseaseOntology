# Running Make Commands

Run commands from the repository root or, for import specific commands, from the `src/ontology/imports` directory. **Never use `make -j`** (parallel runs are unsupported).

`make` with no target, or `make help`, provides information about specific targets or, where many targets exist, for target documentation groups. Use `make help-<group>` (or `make help-all`) to list the targets in a group, each with a one-line description.

| Group | Audience | What it covers |
|---|---|---|
| `help-tests` | all curators | Curation QC tests |
| `help-maintenance` | curators (occasional) | fixes, updates and quarterly tests on `doid-edit.owl` |
| `help-imports` | curators, release managers | building import modules |
| `help-release` | release managers | creating release files and reports |
| `help-caution` | developers | reset software and support files |

Data-driven targets are described by the first line of their SPARQL file: `make help-fix` lists `fix-*` and `opt-fix-*` rules, and `make help-update` lists `update-*` targets.


## Curators: Test Your Edits

Before committing changes to `doid-edit.owl`:

```
make test
```

This runs the reasoner, ROBOT QC report and SPARQL verification queries, then diffs against the last release. Results are written to `build/reports`. `make report` alone is a faster check for common issues.


## Curators: Occasional Maintenance

These targets modify `doid-edit.owl`. Commit first so changes can be reviewed with `git diff`.

- `make fix` runs all `fix-*` rules; `opt-fix-*` rules must be run individually and their results reviewed carefully (see `make help-fix`).
- `make update-slims` / `make update-xrefs` run all subset or xref updates; each can also be run individually (see `make help-update`). Details of changes are written to `build/update`.
- `make add-british-synonyms` requires the Python `pandas` module.
- `make test-quarterly` runs checks that are not part of the release.


## Imports

Imports can be built from the root directory or from `src/ontology/imports`. See [imports/README.md](imports/README.md) for adding terms.

- `make imports` builds all imports, downloading sources only when a newer version exists.
- `make <import name>` builds one import (e.g. `make uberon`).
- `make refresh-imports` and `make refresh-<import name>` rebuild from newly downloaded sources (slow; rarely needed).

Additional `make` commands are available in the `src/ontology/imports` directory.


## Release Managers

`make release` runs, in order:

1. `test-release`: tests and a diff against the last release.
2. `version-imports`: sets versionIRIs of import modules and `ext.owl`.
3. `products`: builds `doid`, `doid-base`, `doid-merged`, `doid-non-classified`, all subsets, DOreports and website files.
4. `verify`: validates OBO syntax with fastobo-validator and checks logical structure with SPARQL queries.
5. `publish`: copies products to `src/ontology/releases`.
6. `post`: generates post-build reports (counts, diffs, HP overlap).

Use `make all` instead of `make release` only to also update imports to their latest versions. `make translations` builds translation products after a release build.


## Developers

- ROBOT and fastobo-validator are downloaded or updated automatically (`check-robot`, `check-fastobo`); versions are set at the top of the Makefile. Use `make refresh-robot` or `make refresh-fastobo` if one misbehaves.
- Build products can be made individually (`primary`, `base`, `merged`, `human`, `subsets`, `release-reports`, `website`); see the "RELEASE PRODUCTS" section of the Makefile.
- Document a new target with a `## [group] description` line directly above its rule. To nest a sub-target under a documented parent, use `## [group:parent] description` (same group as the parent). Data-driven targets need a descriptive first comment line in their SPARQL file instead.
- The help logic is in `src/util/help.mk` and `src/util/help.awk`; `src/util/help-root.mk` has the root-only parts. Each Makefile sets its own `HELP_GROUPS` and `HELP_DESC_<group>` before including `help.mk` (root: `help-root.mk`; imports: top of `src/ontology/imports/Makefile`). A Makefile with a single group gets a flat `make help`. A tag with an unknown group prints a warning.
