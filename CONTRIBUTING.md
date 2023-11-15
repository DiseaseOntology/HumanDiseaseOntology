# Human Disease Ontology Contributor Guidelines

We value every :sparkles:contribution:sparkles:.&nbsp;&nbsp;&nbsp; Thank you! :clap:



## Table of Contents

1. [Introduction](#1-introduction)
2. [Contributing Guidelines](#2-contributing-guidelines)  
   2.1. [Issues Preferred](#21-issues-preferred)  
   2.2. [Issue Templates](#22-issue-templates)
3. [What to Expect from Us](#3-what-to-expect-from-us)
4. [Contact Information](#4-contact-information)
5. _[Additional Information](#5-additional-information)_

## 1. Introduction

The goal of this document is to make contributing to data in the Disease Ontology _easy_ :muscle:, for both beginners and experts. All suggestions for improvement and requests for new data are welcome. The inclusion of supporting documentation (when available) and author ORCiD IDs for attribution, are also highly appreciated :pray:.

If you have a request or suggestion regarding the display or functionality of disease-ontology.org, please [contact us](#4-contact-information) directly.

When contributing, please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md).

## 2. Contributing Guidelines

### 2.1. Issues Preferred

We strongly encourage contributors to use GitHub issues _instead of pull requests_ to propose and discuss changes. Using issues allows for collaborative discussion, consensus building, and thorough review before they are implemented.

Pull requests (PRs) are generally harder to create and harder to review with current ontology editing tools, requiring more effort on your part and ours.

### 2.2. Issue Templates

[Issue templates](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new/choose) have been created to streamline the contribution process. Each identifies the information required and simply optional/helpful. Use them when you can.

:clock10: Your time is valuable, we won't judge the format of your contributions. :point_up: _Remember, something is always better than nothing_.

**Templates:**

1. [Request a new disease term]()
2. [Suggest missing mapping(s) or cross-reference(s)]()
3. [Specify incorrect mapping(s) or cross-reference(s)]()
4. [Suggest a simple correction (no need for supporting research)]()
5. [Suggest data correction for a single disease]()
6. [Suggest data correction for multiple diseases]()
7. [Request classification update/review]()

If you have suggestions for new or existing templates, please use a [blank issue](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new) or [contact us](#4-contact-information) directly.

## 3. What to Expect from Us

Always expect a cordial and timely response. When requests are straightforward and accepted, expect the issue to be implemented and closed with little, if any, additional comment. When issues are complex or expanded upon, we may provide or request further information in the issue to support or outline decision-making. **Discussion is welcome**, it aids curation and decision-making, but _don't feel obligated to reply_. If for some reason changes suggested or requested will _not_ be implemented, we will explain why at the time we close an issue. If you disagree or just feel a desire to comment further, please do!

## 4. Contact Information

If you have questions or need further assistance, please feel free to reach out to us:

- By email: [Lynn](mailto:lschriml@som.umaryland.edu), [Allen](mailto:allenbaron@som.umaryland.edu), or [Claudia](mailto:csbjohnson@som.umaryland.edu)
- Using the contact form at [disease-ontology.org](https://disease-ontology.org/outreach/contact-us)
- Via the Human Disease Ontology Slack channel ([join](https://join.slack.com/t/humandiseaseontology/shared_invite/zt-25vj64myc-h~DOMTJ_iNyyZnPhlDmJFA))
- Via Twitter ([@diseaseontology](https://twitter.com/diseaseontology))

Thank you for your interest in contributing to the Human Disease Ontology. Your contributions play a vital role in maintaining this valuable resource for the scientific and medical community.

---

## 5. Additional Information

For those new to the Disease Ontology, or just wishing to better understand how it's organized or what's in it :wink:.

### Curation

Curation of the ontology follows established procedures and patterns that are outlined on the disease-ontology.org [Curation page](https://disease-ontology.org/curation). However, diseases are not static entities :grey_exclamation:, requiring continuous update and improvement. To suggest changes to patterns or procedures governing data in the Disease Ontology, please open a [blank issue](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new) or [contact us](#4-contact-information) directly.

### Data in the Ontology

- Diseases are organized hierarchically using multiple disease [classifications](https://www.britannica.com/science/human-disease/Classifications-of-diseases), with the primary being etiological (by cause). This multi-classification makes the DO a directed acyclic graph.
- The following data is required for each disease:
  - **Uniform Resource Identifier (URI)**: A persistent, web-accessible URL and ID (example: http://purl.obolibrary.org/obo/DOID_4).
  - **label**: The current, active disease name (example: 'syndrome').
  - **ID**: A short version of the URI using the prefix 'DOID' (example: DOID:4).
  - **OBO namespace**: The namespace assigned to the DO by the OBO Foundry ('disease_ontology').
  - **parent/superclass**: One or more curator-asserted, direct disease-to-disease relationship(s) using `rdfs:subClassOf` in OWL or `is_a` in OBO files (example: the parent of ['syndrome'](https://disease-ontology.org/?id=DOID:225) is 'disease').
- Additional data which may be available for a disease, includes:
  - **definition**: A human-readable text definition. Most diseases have definitions. All definitions have supporting sources (specified as xrefs).
  - **synonym(s)**: Zero or more alternate names for a disease. These include historical and alternate names, acronyms, etc. and may be exact, narrow, broad, or related in nature.
  - **xref(s)**: Zero or more cross-references to other medical vocabularies (e.g. OMIM, GARD, UMLS, etc.).
  - **skos mapping(s)**: Similar to cross-references but organized by the nature of the mapping using the [Simple Knowledge Organization System](https://www.w3.org/TR/skos-reference/) (i.e. exact, close, narrow, broad, or related).
  - **logical statements**: Zero or more curator-asserted disease-to-feature relationships using terms from other ontologies (onset, anatomy, taxonomy, cell, etc.).
  - **deprecated**: A boolean indicating whether a disease has been deprecated, or no longer active. Only present on inactive disease terms.
  - **alternate ID(s)**: Zero or more alternate IDs for equivalent diseases that have been deprecated. Deprecated terms pre-dating the use of OWL (<2015) may not be present in current ontology files.
  - **term_replaced_by**: The term to use instead of this one; only present on deprecated terms.
