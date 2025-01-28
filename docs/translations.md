# Human Disease Ontology Translation

The Human Disease Ontology (DO) was accessed by researchers from more than 125 countries, with more than one quarter speaking a language other than English, in a single year. To meet the emerging needs of the DO’s diverse user community and to support equitable health care and precision public health, the DO is being translated into multiple languages, starting with Spanish.

The Disease Ontology official website, https://disease-ontology.org/, has also been translated into Spanish.


## Table of Contents

- [Files](#files)
- [Language-specific information](#language-specific-information)
	- [Spanish / español](#spanish--español)
- [Translation-to-Ontology Workflow](#translation-to-ontology-workflow)
- [Contact](#contact)


## Files

### Production Files

We **_strongly recommend_** that ontology (OWL) production files with translations be accessed using their persistent URLs (PURLs) instead of accessing them directly (translation products are currently stored with release files in the `src/ontology/releases/translations/` directory). Using PURLs is the best way to ensure reproducibility and accessibility. Each file of the ontology has a specific PURL included in the file as the ontology international resource identifier (IRI). The ontology IRI will always access the latest version of the ontology file. Additionally, each file has an ontology _version_ IRI which serves as a PURL that will always return the specified version of the ontology file.

The following production files have been created to date:

- **doid-international.owl**
	- Contains all ontology prodcution data, including all text available in any language.
	- PURL: http://purl.obolibrary.org/obo/doid/translations/doid-international.owl
- **doid-es.owl**
	- Spanish text only (soon, the 2025-01-29 release includes English placeholders for terms not yet translated).
	- PURL: http://purl.obolibrary.org/obo/doid/translations/doid-es.owl


### SOURCE FILES

The translation source files, which may be useful for some applications, are maintained as TSV files in the `src/ontology/translations/` directory. These files may contain in process, obsoleted, or complete translations.


## Language-specific Information

### Spanish / español

#### Translation Process

Manual translation of the text in the Disease Ontology was accomplished by professional translators in two phases: a test phase to determine feasibility and then full translation of the remaining text. For the test phase, text from diseases of the physical disorder branch, including labels, definitions, & synonyms, were submitted and translated.

The text for the test phase (physical disorder branch) was derived from the 2023-10-21 release, while the text for the remaining diseases was from the 2024-03-28 release. The text & data in the Disease Ontology is updated continuously, so out-of-date translations will also be updated.

After manual translation of English text to Spanish by the The Spanish Group (TSG, https://thespanishgroup.org/), translations were evaluated as follows:

1. The same text was automatically translated again by Google Translate (GT) in a Google Sheet.
2. A similarity score between manual (TSG) and automated (GT) Spanish translations was calculated using a custom algorithm based on the number of string conversions and word matches between two strings (similarity score range: 0-1, with 1 being an exact match).
3. The Spanish text translations by The Spanish Group were automatically backtranslated to English by Google Translate.
4. A similarity score between the original English text of the ontology and automated backtranslation was calculated using the same custom algorithm.
5. An overall similarity score was calculated as the mean of the similarity scores already calculated
6. All manually translated Spanish text with an overall similarity score greater than 0.75, were considered correct and their status updated to "final". Text that did not reach this threshold is marked with a "needs manual review" status.

The procedure for manual review of text below the 0.75 cutoff has been accomplished only for labels of the test phase data (diseases of the physical disorder branch), as of the date of publication, and is as follows:

1. Manual and automated label Spanish translations were compared for exact match to UMLS Spanish disease names. Translations, manual or automated, with matches were considered correct and their status updated to "final".
2. For all remaining Spanish labels, a Spanish speaker on the DO team manually reviewed them for correctness, revised them as necessary, and given a "final" status.


## Translation-to-Ontology Workflow

Manual and automated translations of the text of the Disease Ontology are stored in TSV files in the `src/ontology/translations` directory. These are the source files used to add translated text to the ontology.

Production (OWL) files are generated from the DO edit file, `src/ontology/doid-edit.owl`, and the translation source files. Translation source files are first converted to templates recognized by the Open Biomedical Ontologies Foundry (OBO Foundry) ontology tool ROBOT, originally designed by a collaboration including the DO team. ROBOT combines these templates with the data in the editors file, `doid-edit.owl`, to create the international and language-specific versions of the Disease Ontology.

## Contact

For more information or to contribute to the translation efforts, please contact the project maintainers.