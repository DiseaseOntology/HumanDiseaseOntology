# SPARQL Queries

This directory contains SPARQL queries use for the DO release process, verification, reporting, and other "extra" queries that can be run as one-off tasks. These are separated into four directories:

* `build`: queries used for the DO release process and post-build reporting with [robot query](http://robot.obolibrary.org/verify)
* `extra`: extra queries for one-off reporting purposes (e.g., symptoms in DO, terms with more than one NCI xref, etc.)
* `report`: queries used for [robot report](http://robot.obolibrary.org/report)
* `verify`: queries used for [robot verify](http://robot.obolibrary.org/verify)

When you `make release` or `make test`, all outputs will be generated in the `build` directory for review. If `verify` returns results, the build will fail. All verification queries are also ran in our Travis CI.
