## DO Imports

Each import consists of two files: a `*_terms.txt` file and a `*_import.owl` file. The `.txt` file is used to generate the `.owl` import module using [ROBOT extract](http://robot.obolibrary.org/extract).

### To add a new import term

Open the corresponding `.txt` file and do a text search to ensure the ID has not yet been added. Append a new line with the ID, followed by a comment with the class label, e.g.:
```
UBERON:0000955	# brain
```

Save the file, and then in terminal, run the desired `make` command (see below and [README-make.md](../README-make.md)). This can be run from the `root` directory OR the `imports` directory. You can make one at a time with the command `make <import name>`, e.g.:

```
make uberon
```

Or you can make all the import modules at once:

```
make imports
```

Keep in mind that NCBITaxon is very large and will take some time to extract the terms.

### To remove an import term

Open the corresponding `.txt` file and do a text search to find the line with the ID to remove. Delete the whole line, and then follow the steps above to `make` the import module.

### Current 'makeable' imports

* `chebi` - Chemical Entities of Biological Interest
* `cl` - Cell Ontology
* `disdriv` - Disease Drivers Ontology[^1]
* `eco` - Evidence and Conclusion Ontology
* `foodon` - Food Ontology
* `geno` - Genotype Ontology
* `hp` - Human Phenotype Ontology
* `ncbitaxon` - NCBI organismal classification
* `ro` - OBO Relations Ontology (object properties)
* `so` - Sequence Ontology
* `symp` - Symptom Ontology[^1]
* `trans` - Pathogen Transmission Ontology[^1]
* `uberon` - Uberon multi-species anatomy ontology

[^1]: These imports are additional ontologies developed by the DO team and are available at https://github.com/DiseaseOntology.
