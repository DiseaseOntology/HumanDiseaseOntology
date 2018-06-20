## Human Disease Ontology tests

This directory contains the test code to check some properties of the Disease Ontology files. It is a Python3 [pytest](https://pypi.org/project/pytest/) test suite and uses the  [pronto](https://pypi.org/project/pronto/) library. These tests are executed by the Travis CI system and provide the build status on the main README.

To install pronto and pytest:
```
pip install pronto pytest
```

To run the tests
```
pytest -v
```

This runs all Python functions that start with "test_" in the test files here.

### Coverage

The tests currently cover the current topics for the doid.obo and doid-non-classified.obo files
- Parent properties
  - All items in doid.obo should have at least one parent (but can have multiple)
  - All items in doid-non-classified.obo should have exactly one parent
- Connectedness
  - All items on both files should link through IS_A relations to the root Disease (DOID:4)
- Cycles
  - No cycles should exist in the parent property chains in the doid-non-classified.obo file
  
### Contributions

Please contribute more tests or create an issue and tag [@jakelever](https://github.com/jakelever/) as he may be able to build it quickly.
