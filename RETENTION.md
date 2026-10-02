# DO-KB Data Retention Policy

This documentation outlines our automated repository archival schedules, compliance with federal records requirements, and the specific metadata preservation standards used to ensure the data remains findable, accessible, interoperable, and reusable (FAIR) over time.

## Data Retention and Sustainability Policy

This policy outlines the data lifecycle, long-term preservation strategy, and retention timelines for the **Human Disease Ontology (DO)** repository. As an open-access biomedical resource developed and maintained under public funding, this repository adheres to federal guidelines to guarantee scientific transparency, compliance, and long-term reproducibility.

### 1. Compliance Framework

This repository complies with the **2023 NIH Data Management and Sharing (DMS) Policy**. In accordance with federal guidelines, all public datasets, source files, and ontology builds generated under NIH funding will be retained for a **minimum of three (3) years** following the submission of the final financial report for the respective funding award period.

### 2. Retention Timeline and Long-Term Availability

To maximize the utility of the Human Disease Ontology to the global bioinformatics and medical research community, the project aims to retain data **indefinitely** beyond the required federal minimums.

* **Active Code and Data:** Maintained continuously within this active GitHub repository (`DiseaseOntology/HumanDiseaseOntology`).
* **Historic Records and Releases:** Obsoleted terms, older versions, and deprecated classifications are never permanently deleted from the codebase. Instead, they are retained within git history or explicitly tagged as "obsolete" within the ontology schema to prevent breaking dependencies in downstream clinical or analytical applications.

### 3. Persistent Identifiers & Long-Term Archival Strategy

Because active Git repositories are dynamic, permanent archiving and citable version snapshots are achieved through automation:

* **Zenodo Archiving:** Every official project release is automatically mirrored, preserved, and structurally locked using the **Zenodo** repository (https\://zenodo.org/records/21107133) hosted by CERN.
* **Digital Object Identifiers (DOIs):** Each version release is issued a unique, persistent DOI (e.g., https\://zenodo.org/records/22212316 for the August 2026 snapshot) to establish an immutable, verifiable, and globally citable record.
* **Archival Longevity:** Data stored via Zenodo is guaranteed to remain online in the public domain under a **CC0 1.0 Universal (Public Domain Dedication)** waiver for the lifespan of the host infrastructure.

### 4. Repository Contingency Plan

In the highly improbable event that the `DiseaseOntology` GitHub organization dissolves or is modified, the underlying research data, mappings, definitions, and codebooks will remain fully accessible through:

1. The **Zenodo long-term archive library** using the core concept DOI loop.
2. Alternative institutional repositories or federally supported biomedical knowledge bases designated by the project's Principal Investigators.
