# SPARQL Queries

There are currently two types of SPARQL queries utilized for the DO ROBOT commands:
1. Verification queries
2. Reporting queries

The verification queries are used with [robot verify](http://robot.obolibrary.org/verify) and the reporting queries are used with [robot query](http://robot.obolibrary.org/verify).

To add another verifcation query, simply create a SPARQL file with the name `verify-*.rq` to check `doid.obo` and `doid-non-classified.obo` or `dnc-verify-*.rq` for just `doid-non-classified.obo`. To add another reporting query, the file name should follow `*-report.rq` and not begin with `verify`.

When you `make release`, all outputs will be generated in the `build` directory for review. If `verify` returns results, the build will fail. All verification queries are also ran in our Travis CI.
