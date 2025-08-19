# Human Disease Ontology - Release Files

This document lists the Human Disease Ontology files produced at each release, along with their [Internationalized Resource Identifier (IRI)](https://en.wikipedia.org/wiki/Internationalized_Resource_Identifier) (sometimes referred to as a [PURL](https://en.wikipedia.org/wiki/Persistent_uniform_resource_locator)), location in this GitHub repository, and a short description.


## Table of Contents
1. [General File Location](#general-file-location)
2. [Stable Download Access](#stable-download-access)
    - [Accessing a Specific File Version](#accessing-a-specific-file-version)
3. [Complete List of Release Files](#complete-list-of-release-files)
    - [Main Files](#main-files)
    - [Translations](#translations)
    - [Subsets](#subsets)
        - [Project-Specific Subsets](#project-specific-subsets)
        - [Content-Specific Subsets](#content-specific-subsets)


## General File Location
All files are available in the [src/ontology/releases](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/master/src/ontology/releases) directory of the Human Disease Ontology GitHub repository.

Files from a specific release can be accessed by choosing the desired release from the [Releases](https://github.com/DiseaseOntology/HumanDiseaseOntology/releases) of the Human Disease Ontology GitHub repository and navigating to the `src/ontology/releases` directory within that release.

_While files may be downloaded directly from the repository, we recommend using the IRIs for stable access._


## Stable Download Access
For stable access to the latest files, we **strongly recommend** using a files IRI. The base IRI for all files is `http://purl.obolibrary.org/obo/doid/<relative-path>`, where `<relative-path>` corresponds to the relative path within the `src/ontology/releases` directory of the DO GitHub repository. Note that the primary release file is an exception to this and has the IRI `http://purl.obolibrary.org/obo/doid.owl` (or `.json`, `.obo` for alternate versions).

Except where noted, release files are available in OWL (RDF/XML; preferred), OBO, and JSON formats. To access alternate file formats via IRI, replace the file extension in the IRI with the desired format (e.g., `doid.json`, `doid.obo`, or `doid.owl`). Please note that the OBO format does not support logical definitions, so the OBO files will not contain logical definitions even if the OWL files do. The IRI of all OWL files are specified in complete form in the file on the line defining the ontology  (e.g. `<owl:Ontology rdf:about="http://purl.obolibrary.org/obo/doid.owl">`). JSON files currently list this same IRI in an "graph", "id" field, while OBO files use relative IRIs (lacking a prefix) defined by `ontology:`. 


### Accessing a Specific File Version
To access a specific release version of a file via IRI, use the file's versionIRI. All versionIRIs conform to the format `http://purl.obolibrary.org/obo/doid/releases/{date}/<relative-path>`. Note that while the IRI of the primary file, `doid.owl`, has a uniquely formatted IRI, its version IRI follows this convention. The versionIRI of all OWL files are specified in complete form on the `owl:versionIRI` line, while JSON files list this same IRI in an "graph", "version" field and OBO files use relative versionIRIs (lacking a prefix) defined by `data-version:`.

Example with doid-international.owl from the 2025-08-01 release:
- IRI: `http://purl.obolibrary.org/obo/doid/translations/doid-international.owl`
- versionIRI for v2025-08-01 release: `http://purl.obolibrary.org/obo/doid/releases/2025-08-01/translations/doid-international.owl`



## Complete List of Release Files

### Main Files
- GitHub release subdirectory: _none_, all are found in the main release directory, [src/ontology/releases](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/master/src/ontology/releases)
- IRI prefix: `http://purl.obolibrary.org/obo/doid/`

1. **doid.owl**
    - Primary file for the Human Disease Ontology in RDF/XML format
    - This file is post-reasoned (more disease relationships) and contains all logical definitions built with terms imported from other ontologies, but those terms are not included in the file (ontology browsers such as Protege and OLS will automatically load the necessary ontologies via `owl:import` statements).
    - IRI: `http://purl.obolibrary.org/obo/doid.owl`
    - versionIRI format: `http://purl.obolibrary.org/obo/doid/releases/{date}/doid.owl`
2. **doid-merged.owl**
    - Equivalent to doid.owl but with all terms from imported ontologies present in the file.
3. **doid-base.owl**
    - Simplified ontology file with only pre-reasoned relations (fewer) and without terms from imported ontologies (logical definitions are preserved).
4. **doid-non-classified.owl**
    - Simplified ontology with only pre-reasoned relations (fewer) and without logical definitions or terms from imported ontologies.
    - Originally this included a single, asserted parent for each disease in the ontology, however, some diseases now have multiple asserted parents.
    - **HumanDO.owl** is an alias for `doid-non-classified.owl`. It does _NOT_ have a separate IRI. It was previously the primary file for the Human Disease Ontology but was superseded by `doid.owl` in 2015. Where this file does exist, there is no guarantee it will be up-to-date. 



### Translations
- GitHub release subdirectory: [translations/](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/master/src/ontology/releases/translations)
- IRI prefix: `http://purl.obolibrary.org/obo/doid/translations/`

1. **doid-international.owl**
    - Equivalent to `doid-merged.owl` with text from all translations included. 
2. **doid-es.owl**
    - Equivalent to `doid-merged.owl` but with Spanish text only.
3. **doid-es.obo**
    - Equivalent to `doid.obo` but with Spanish text only.


### Subsets
All subsets are derived from `doid-non-classified.owl` by the [MIREOT method](https://robot.obolibrary.org/extract#mireot) to create a smaller ontology file for targeted purposes (usually as requested to support a specific project).

- GitHub release subdirectory: [subsets/](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/master/src/ontology/releases/subsets)
- IRI prefix: `http://purl.obolibrary.org/obo/doid/subsets/`

#### Project-Specific Subsets
1. **DO_AGR.owl**
    - Created for the Alliance of Genome Resources (now known as "the Alliance" instead of AGR).
2. **DO_cancer_slim.owl**
3. **TopNodes_DOcancerslim.owl**
4. **DO_CFDE_slim.owl**
    - Created for the Common Fund Data Ecosystem (CFDE) project.
5. **DO_FlyBase_slim.owl**
    - Created for the FlyBase project, which focuses on Drosophila genetics and genomics.
6. **DO_GXD_slim.owl**
    - Created for 
7. **DO_IEDB_slim.owl**
8. **DO_MGI_slim.owl**
    - Created for Mouse Genome Informatics (MGI), which focuses on mouse genetics and genomics.
9. **DO_RAD_slim.owl**
10. **GOLD.owl**

#### Content-Specific Subsets
11. **DO_rare_slim.owl**
    - Includes only diseases defined as "rare" according to the guidelines of least one governmental or authoritative body.
12. **NCIthesaurus.owl**
13. **DO_infectious_disease_slim.owl**
14. **gram-negative_bacterial_infectious_disease.owl**
15. **gram-positive_bacterial_infectious_disease.owl**
16. **sexually_transmitted_infectious_disease.owl**
17. **tick-borne_infectious_disease.owl**
18. **zoonotic_infectious_disease.owl**

