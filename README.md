<!-- badges: start -->
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10030383.svg)](https://doi.org/10.5281/zenodo.10030383)
[![Build Status](https://github.com/DiseaseOntology/HumanDiseaseOntology/workflows/DOID%20CI/badge.svg)](https://github.com/DiseaseOntology/HumanDiseaseOntology/actions)
<!-- badges: end -->

# HumanDiseaseOntology
Repository for the Human Disease Ontology (DO).

## Announcements
- **_LIVE as of the [May 2024 release](https://github.com/DiseaseOntology/HumanDiseaseOntology/releases/tag/v2024-05-29)_** -- The prefix for **OMIM cross-references and susceptibilities** is now 'MIM', not 'OMIM', in the Human Disease Ontology. For details refer to https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/1301.

- **_LIVE as of the [July 2024 release](https://github.com/DiseaseOntology/HumanDiseaseOntology/releases/tag/v2024-07-31)_** -- **Acronyms** are now annotated in the DO. For background information refer to https://github.com/information-artifact-ontology/ontology-metadata/issues/135. Note: Acronyms retain their synonym scope (exact, narrow, etc.). This is an additional annotation using `owl:Axiom`, `oboInOwl:hasSynonymType` and the new synonym type `OMO:0003012` (acronym), e.g.

```owl
<owl:Axiom>
	<owl:annotatedSource rdf:resource="http://purl.obolibrary.org/obo/DOID_0040093"/>
	<owl:annotatedProperty rdf:resource="http://www.geneontology.org/formats/oboInOwl#hasExactSynonym"/>
	<owl:annotatedTarget xml:lang="en">DIL</owl:annotatedTarget>
	<oboInOwl:hasSynonymType rdf:resource="http://purl.obolibrary.org/obo/OMO_0003012"/>
</owl:Axiom>
```


## Details

DO OBO and OWL files are available in our GitHub repository. The DO provides both the asserted DO is_a hierarchy and inferred versions of our ontology files. [Please review our file README for details.](https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/master/src/ontology/README_DO_Files)

DO website: http://www.disease-ontology.org

DO curation and production moved to OWL, git, and GitHub in November 2015. DO's [SVN repository on Sourceforge.net](https://sourceforge.net/projects/diseaseontology/) has been retired but is still available for historical reference.

A tutorial describing DO's editorial activities is available at:
https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/master/src/ontology/README-editors.md

Documentation on [Disease Ontology web site](http://disease-ontology.org).
Contact: [Lynn Schriml](mailto:lynn.schriml@gmail.com)
