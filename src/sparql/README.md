# SPARQL Queries

There are currently two types of SPARQL queries utilized for the DO ROBOT commands:
1. Verification queries
2. Reporting queries

The verification queries are used with [robot verify](http://robot.obolibrary.org/verify) and the reporting queries are used with [robot query](http://robot.obolibrary.org/verify).

To add another verifcation query, simply create a SPARQL file with the name `verify-*.rq` to check `doid.obo` and `doid.owl` files. To check the edit file only, the file should folllow the naming convention `edit-verify-*.rq`. Similarly, to check the non-classified version of DO, use `dnc-verify-*.rq`. To add another reporting query, the file name should follow `*-report.rq` and not begin with `verify`.

When you `make release` or `make test`, all outputs will be generated in the `build` directory for review. If `verify` returns results, the build will fail. All verification queries are also ran in our Travis CI.
