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

This document describes how to make contributions and requests related to data in the Human Disease Ontology (DO). We want it to be  _easy_ :muscle:, for both beginners and experts. All suggestions for improvement and requests for new data are welcome. The inclusion of supporting documentation and author ORCiD IDs for attribution, are also highly appreciated :pray:.

If you have a request or suggestion regarding the display or functionality of disease-ontology.org, please [contact us](#4-contact-information) directly.

When contributing, please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md).

## 2. Contributing Guidelines

### 2.1. Issues Preferred

We strongly encourage contributors to use GitHub issues _instead of pull requests_ to propose and discuss changes. Using issues allows for collaborative discussion, consensus building, and thorough review before they are implemented.

Pull requests (PRs) are generally harder to create and harder to review with current ontology editing tools, requiring more effort on your part and ours.

### 2.2. Issue Templates

A number of [issue templates](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new/choose) have been created to streamline the contribution process. Each type identifies requested information to enable our team to address the issue, along with additional information that would be helpful to include. We request that users utilize the [issue templates](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new/choose).

:clock10: Your time is valuable, we won't judge the format of your contributions. :point_up: _Remember, something is always better than nothing_. Please include your ORCiD ID with your request, so that we can recognize your contribution on our contributors page.

If you have suggestions for new or existing templates, or an issue that is not covered by a template, please use a [blank issue](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new) or [contact us](#4-contact-information) directly.

## 3. What to Expect from Us

Always expect a cordial and timely response. When requests are straightforward and accepted, expect the issue to be implemented and closed with little, if any, additional back and forth comments. When issues are complex or expanded upon, we may provide or request further information on the issue to support or outline decision-making. **Discussions are always welcome**, it aids curation and decision-making, but _don't feel obligated to reply_. If for some reason changes suggested or requested will _not_ be implemented, we will explain why in a comment posted to the issue. If you disagree or just feel a desire to comment further, please do!

## 4. Contact Information

If you have questions or need further assistance, please feel free to reach out to us:

- By email: [Lynn](mailto:lschriml@som.umaryland.edu), [Allen](mailto:allenbaron@som.umaryland.edu), or [Claudia](mailto:csbjohnson@som.umaryland.edu)
- Using the contact form at [disease-ontology.org](https://disease-ontology.org/outreach/contact-us)
- Via the Human Disease Ontology public Slack channel ([join](https://join.slack.com/t/humandiseaseontology/shared_invite/zt-25vj64myc-h~DOMTJ_iNyyZnPhlDmJFA))
- Via Twitter ([@diseaseontology](https://twitter.com/diseaseontology))
- Via Facebook ([Disease Ontology](https://www.facebook.com/diseaseontology))

Thank you for your interest in contributing to the Human Disease Ontology. Your contributions play a vital role in maintaining this valuable resource for the scientific and medical community.

---

## 5. Additional Information

For those new to the Human Disease Ontology, or just wishing to better understand how it's organized or what's in it :wink:.

### Curation

Curation of the ontology follows established procedures and patterns that are outlined on the disease-ontology.org [Curation page](https://disease-ontology.org/curation). However, diseases are not static entities! Continuous updates and revisions are required to incorporate new knowledge. To suggest changes to design patterns or procedures governing data in the Human Disease Ontology, please open a [blank issue](https://github.com/DiseaseOntology/HumanDiseaseOntology/issues/new) or [contact us](#4-contact-information) directly.

### Data in the Ontology

- Diseases are organized hierarchically based on their etiology (or cause, one of many possible [classifications](https://www.britannica.com/science/human-disease/Classifications-of-diseases)), in a [directed acyclic graph (DAG)](https://en.wikipedia.org/wiki/Directed_acyclic_graph) providing a conceptual representation of the relatedness of human diseases.
  
- In the Human Disease Ontology, each disease record includes:
  - **Uniform Resource Identifier (URI)**: A persistent, web-accessible URL and ID (example: `http://purl.obolibrary.org/obo/DOID_4`).
  - **label**: The current, active disease name (example: 'syndrome').
  - **ID**: A short version of the URI using the approved, [OBO Foundry](https://obofoundry.org/ontology/doid.html) prefix 'DOID' (example: DOID:4).
  - **OBO namespace**: The namespace assigned to the DO by the OBO Foundry ('disease_ontology').
  - **parent/superclass**: One or more curator-asserted, direct disease-to-disease relationship(s) using `rdfs:subClassOf` in OWL or `is_a` in OBO files (example: the parent of [syndrome](https://disease-ontology.org/?id=DOID:225) is disease).
- Additional data which may be available for a disease, includes:
  - **definition**: A human-readable text definition, written by a DO curator. Most DO diseases have textual definitions. All definitions have supporting sources (specified as xrefs).
  - **synonym(s)**: Alternate names for a disease. These include historical and alternate names or acronyms, and may be exact, narrow, broad, or related in nature, denoted by [oboInOwl](https://github.com/geneontology/go-ontology/blob/master/contrib/oboInOwl.obo) annotations.
  - **xref(s)**: Cross-references to other clinical vocabularies (e.g. NCI Thesaurus, OMIM, Orphanet, GARD, UMLS, SNOMED CT, ICD).
  - **skos mapping(s)**: Denoting the level of similarity between the DO term and the cross-reference ID, organized by the nature of the mapping using the [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-reference/) (e.g., exact, close, narrow, broad, or related).
  - **logical statements**: Curator-asserted disease-to-feature relationships using terms from ontologies imports (phenotype, cell type, age of onset, anatomy, taxonomy, cell, symptom, transmission method, sequence variant type).
  - **deprecated**: A boolean utilized to indicate whether a disease has been deprecated, or no longer active. Only present on obsoleted or merged disease terms. These terms are included in the DO ontology files, but are not shown on the DO website.
  - **alternate ID(s)**: Alternate IDs for diseases that have been merged into another DOID. DOIDs for merged or obsoleted terms pre-dating the use of OWL (<2015) may not be present in current ontology files, but can be found in the DO's [Sourceforge repository](https://sourceforge.net/projects/diseaseontology/files/).
  - **term_replaced_by**: An annotation that is utilized to denote the term an obsoleted term was merged into, where applicable.
