# Human Disease Ontology Translation

## Table of Contents

- [Overview](#overview)
- [Files](#files)
- [Spanish Translation Process](#spanish-translation)
- [Translation-to-Ontology Workflow](#translation-to-ontology-workflow)


## Overview

Over a single year, the Human Disease Ontology (DO) was accessed by researchers from more than 125 countries, with more than one quarter speaking a language other than English. To meet the emerging needs of the DO’s diverse user community and to support equitable health care and precision public health, the DO is being translated into multiple languages, starting with Spanish.



## Files

Translations are stored in TSV files in the `src/ontology/translations/` directory.

Ontology (OWL) files with translations are available with the release files in the `src/ontology/releases/translations/` directory. While these _can_ be accessed directly, we **_strongly recommend_** these be accessed using their persistent URLs (PURLs).

- **doid-es.owl**: Spanish text only (soon, the 2025-01-29 release includes English placeholders for terms not yet translated).
	- PURL: http://purl.obolibrary.org/obo/doid/translations/doid-es.owl
- **doid-international.owl**: International version of the DO with original English and all currently translated text.
	- PURL: http://purl.obolibrary.org/obo/doid/translations/doid-international.owl


## Spanish Translation Process

Spanish translation of the DO was initiated in 2023

### Identifying Content

- Compiled a detailed list of website pages/content for translation.
- Confirmed translation accuracy with [The Spanish Group](https://thespanishgroup.org/), specializing in medical term translations.
- Obtained estimates and reviewed translation samples for quality assurance.

### Translation Process

- Created detailed documents for translations outlining specifics covering all live webpages of the DO in a [translation key](https://docs.google.com/spreadsheets/d/1DTKwKr6AYSiLsTmnKavtKN6b52xJM0Kp3LTh1bxxknc/edit#gid=0) for manual review and future implementation.
- Implemented translations using the [translation key](https://docs.google.com/spreadsheets/d/1DTKwKr6AYSiLsTmnKavtKN6b52xJM0Kp3LTh1bxxknc/edit#gid=0) for accuracy and consistency.
- Translations are programmatically verified via Google Translate by adding the Google Translate function for Google Sheets to the adjoining column (e.g., `=googletranslate(A2, "en", "es")`), translating the word in the A2 cell from English to Spanish.
- Vetted and verified Spanish terms are integrated into the DO via a ROBOT formatted template that defines the data types to be loaded.

### Testing Translations

- Tested a specific [DO branch for accuracy](https://drive.google.com/drive/u/0/folders/1dYVyHm5ZR4-sBGX3f8HUMbB1QTktxtol) obtained from DO-KB SPARQL.
- Used the Disease Ontology [SPARQL Sandbox](https://disease-ontology.org/do-kb/sparql) to query 'physical disorders' (DOID:0080015) and obtain the DOID, name, definition, and synonym data.
- Conducted two separate SPARQL queries: one for labels & definitions and another for synonyms.

## Translation-to-Ontology Workflow

Conversion of translated text from standardized TSV to OWL ontologies files is primarily accomplished by ROBOT using templates. The workflow involves the following steps:

1. **Source Files**: The source TSV files for the translations are located in the `src/ontology/translations/` directory.
2. **ROBOT Templates**: Generate ROBOT templates to facilitate the translation process.
3. **Translation**: Apply translations to create the final ontology files.
4. **Products**: The final translated ontology files are stored in the `src/ontology/releases/translations/` directory.

## Contact

For more information or to contribute to the translation efforts, please contact the project maintainers.