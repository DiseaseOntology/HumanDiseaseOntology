# DO Releases

* [2022 Releases](#2022-releases)
* [2021 Releases](#2021-releases)
* [2020 Releases](#2020-releases)
* [2019 Releases](#2019-releases)
* [2018 Releases](#2018-releases)
* [2017 Releases](#2017-releases)
* [2016 Releases](#2016-releases)

---

## 2024 Releases

### [v2024-05-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2024-05-29)

In this release of the Human Disease Ontology, all cross-references to OMIM in all files have had their prefixes changed from 'OMIM' to 'MIM' to align with OMIM. _Prefixes will stably remain 'MIM' going forward. We apologize for any inconvenience this may cause._

There are now 11,575  disease classes, 9,237 with textual definitions (79.8%) in the ontology with revisions and additions to amino acid metabolic disorders, polycystic kidney diseases, galactosemias, hypotrichosis, episodic ataxias, Loeys-Dietz syndromes, orofaciodigital syndrome, and holoprosencephalies.

## What's Changed
* Implement OMIM-to-MIM prefix change requested by OMIM by @allenbaron in https://github.com/DiseaseOntology/HumanDiseaseOntology/pull/1334

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2024-04-30...v2024-05-29

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-05-29/src/ontology/doid-merged.obo) | |

### [v2024-04-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2024-04-30)

The DO's April 2024 release includes: 11,550 human disease terms. This release includes classification revisions for anemia, and B-cell lymphoma; the addition of  genes to additional DOID definitions; the addition of disease subtypes for: cone-rod dystrophy; amelogenesis imperfecta, anemia, Ullrich congenital muscular dystrophy and autosomal recessive intellectual developmental disorder 82; the addition of new DOIDs: interstitial lung disease, large B-cell lymphoma, hyperimmunoglobulinemia D periodic fever syndrome, and PFAPA syndrome.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-04-30/src/ontology/doid-merged.obo) | |

### [v2024-03-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2024-03-28)

This release includes 11,537 disease terms; 8,419 SubClassOf axioms. The addition of 26 new disease terms. This month the DO was updated, we added Peroxisome biogenesis disorder and dystonia subtypes, reclassified Zellweger syndrome subtypes, updated frontotemporal dementia and/or amyotrophic lateral sclerosis and Ohdo syndrome subtype nomenclature, added neurodevelopmental disorder with poor growth and behavioral abnormalities, Stolerman neurodevelopmental syndrome, Nicolaides-Baraitser syndrome, blepharophimosis-impaired intellectual development syndrome, and microcephaly-micromelia syndrome and microcephaly, short stature, Halperin-Birk syndrome and limb abnormalities; revised Lisch epithelial corneal dystrophy.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-03-28/src/ontology/doid-merged.obo) | |

### [v2024-02-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2024-02-28)

This release of the Human Disease Ontology includes 11,511 disease classes, 9,160 with textual definitions (79.6%). Diseases that have been revised and/or expanded include CACNA1C-related diseases, long QT syndromes, LAL-D, ARVC, autosomal recessive distal hereditary motor neuronopathy 8, Pick's disease, hyper IgM syndromes, hypoparathyroidism, parasitic protozoa infectious diseases, and Canavan disease. New diseases include 'syndromic X-linked intellectual developmental disorder bain type', SPATCCM, ACM subtypes, 'neurodevelopmental disorder with microcephaly, epilepsy, and brain atrophy', 'developmental delay, dysmorphic facies, and brain anomalies', and 'infantile hypotonia with psychomotor retardation and characteristic facies-3'.

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2024-01-31...v2024-02-28

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-02-28/src/ontology/doid-merged.obo) | |

### [v2024-01-31](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2024-01-31)

This release of the Human Disease Ontology includes 11,501 disease classes, 9,146 with textual definitions (79.5%). Diseases that have been revised and expanded include aniridia, osteosarcomas, distal spinal muscular atrophies, distal hereditary motor neuropathies, peeling skin syndromes, pyridoxine-dependent epilepsies, and Graves disease. New diseases include foveal hypoplasias, developmental dysplasias of the hip, familial focal epilepsies with variable foci, dystonia subtypes, Sifrim-Hitz-Weiss syndrome, cepacia syndrome, round cell sarcoma subtypes, Borrelia miyamotoi disease, PLACK syndrome, familial multiple lipomatosis, and retinal macular dystrophy 2. A number of definitions have additionally been updated with NHGRI sources and xrefs to obsolete EFO terms have been removed.

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2023-12-20...v2024-01-31

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2024-01-31/src/ontology/doid-merged.obo) | |

## 2023 Releases

### [v2023-12-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-12-20)

This release of the Human Disease Ontology includes 11,454 disease classes, 9,093 with textual definitions (79.4%). Revisions have been made to sarcomas and rare diseases. New diseases include Schinzel Giedion Syndrome, inflammatory poikiloderma with hair abnormalities and acral keratoses (LIPHAK syndrome), polyhydramnios, megalencephaly, and symptomatic epilepsy (PMSE syndrome), Mitchell syndrome, and a number of rare neurodevelopmental syndromes.

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2023-11-30...v2023-12-20

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-12-20/src/ontology/doid-merged.obo) | |

### [v2023-11-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-11-30)

This release of the Human Disease Ontology includes 11,432 disease classes, 9,071 with textual definitions (79.3%). New diseases include mito complex 4 disease subtypes, Caroli syndrome, dopamine transporter deficiency syndromes, Zaki syndrome, chromosome 1p36.33 duplication syndrome, digenic diseases, and cerebellar ataxia disease subtypes. Revisions have been made to steatotic liver disease and NAFLD to match recent international consensus, dystal myopathies, and frontotemporal dementias.

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2023-10-21...v2023-11-30

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-11-30/src/ontology/doid-merged.obo) | |

### [v2023-10-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-10-21)

This DO release includes 11,386 diseases, 8,276 SubClassOf and 726 EQ axioms. This release includes the addition of 13 disease terms, 19  definitions, 25 SubClassOf axioms and 1 EQ axiom. New and revised content includes: added synonyms for autosomal recessive spinocerebellar ataxia; the addition of autosomal recessive spinocerebellar ataxia, amyotrophic lateral sclerosis subtypes; revised classifications for schwannomatosis and neurofibromatosis, rhabdomyosarcoma,;the addition of new disease terms: Legius syndrome and Watson syndrome, diphthamide deficiency syndrome and subtypes, renal medullary carcinoma; augmentation of the DO_cancer_slim, updated nomenclature for thyroid cancer and a revised NCIthesaurus slim, produced programmatically based on NCI xrefs or skis mappings.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-10-21/src/ontology/doid-merged.obo) | |

### [v2023-09-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-09-28)

This release of the Human Disease Ontology includes 11,373 disease classes, 9,003 with textual definitions (79.2%). Updates include revised mappings based on UMLS 2023AA; the addition of early-onset epilepsy 2 & 3, Yoon-Bellen neurodevelopmental syndrome, NEDDFAC, SCAN3 and updates to other SCAN diseases; revision of viral infectious diseases to incorporate official viral nomenclature changes from ICTV; reactivation of Epstein-Barr virus infectious disease; and various definition updates & corrections.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-09-28/src/ontology/doid-merged.obo) | |

### [v2023-08-08](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-08-08)

This release includes a major fix to recently added diseases. Five diseases were added in the June 2023 release with _duplicate_ IRIs matching historically obsoleted diseases (pre-2015). These diseases with duplicate IRIs have been deleted and re-added with new, unique IRIs as follows:

- **disabling pansclerotic morphea**, DOID:0080002 -> DOID:0081373
- **nemaline myopathy 5B**, DOID:0080003 -> DOID:0081374
- **nemaline myopathy 5C**, DOID:0080004 -> DOID:0081375
- **sorbitol dehydrogenase deficiency with peripheral neuropathy**, DOID:0080025 -> DOID:0081376
- **COX deficiency, benign infantile mitochondrial myopathy**, DOID:0080035 -> DOID:0081377

If at all possible, use _THIS_ release instead of the June and July releases (v2023-06-29, v2023-07-20, & v2023-07-24).

_We apologize for any inconvenience this may have caused._

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-08-08/src/ontology/doid-merged.obo) | |

### [v2023-07-24](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-07-24)

Minor fix to inheritance information in two textual definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-24/src/ontology/doid-merged.obo) | |

### [v2023-07-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-07-20)

This release of the Human Disease Ontology includes 11,367 disease classes, 8,996 with textual definitions (79.1%). Updates include revision and addition to disease classifications for carpal tunnel syndromes, mitochondrial complex V deficiency diseases, hereditary spastic paraplegias, xanthinuria diseases, and cone-rod dystrophies, along with corrections to spelling and ICD10CM cross-references.

**Full Changelog**: https://github.com/DiseaseOntology/HumanDiseaseOntology/compare/v2023-06-29...v2023-07-20

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-07-20/src/ontology/doid-merged.obo) | |

### [v2023-06-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-06-29)

DO's June 2023 release. Includes 11,349 disease terms, the addition of 35 new diseases, 42 new SubClassOf axioms. This release includes reformatting of gene symbols in definitions, the addition of mtDNA depletion syndrome subtypes 16-20, retinal macular dystrophy and subtypes, sorbitol dehydrogenase deficiency with peripheral neuropathy, hyperphosphatasia with impaired intellectual development syndrome subtypes, revised nemaline classification and COX deficiency classification, new digenic disease annotations.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-06-29/src/ontology/doid-merged.obo) | |

### [v2023-05-31](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-05-31)

This release includes 11,314 disease terms and 8,942 textual definitions (79.0%) with added definitions, xrefs, new DO terms and revised classifications. Included are updates for bradyopsia, NBCCS - nevoid basal cell carcinoma syndrome, leukoencephalopathy with vanishing white matter, developmental and epileptic encephalopathy, hypomyelinating leukodystrophy, epidermolytic hyperkeratosis, autosomal recessive spinocerebellar ataxia, Paget's disease of bone, spastic quadriplegic cerebral palsy, spinal muscular atrophy and various myopathies. Added diseases include acrocardiofacial syndrome, Hengel-Maroofian-Schols syndrome, early onset progressive encephalopathy with brain atrophy and thin corpus callosum, Luo-Schoch-Yamamoto syndrome and Pierpont syndrome, along with many others.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-05-31/src/ontology/doid-merged.obo) | |

### [v2023-03-31](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-03-31)

This release includes 11,224 disease terms, 8,846 textual definitions, 724 EQ axioms and 8,124 SubClassOf axioms; an increase of 8 new disease terms, 10 new definitions, 2 EQs, 33 SubClassOf axioms. This release included updating of disease names, synonyms and xrefs and associated phenotypes, updates of classifications for frontotemporal dementia, major depressive disorder and related classes and updated COPD definitions, chronic granulomatous, and  glycogen storage diseases and hypoglycemia disease annotations and the addition of an axiom to define prion disease, progeria disease subtypes, chronic granulomatous disease 5.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-03-31/src/ontology/doid-merged.obo) | |

### [v2023-02-27](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-02-27)

DO February 2023 release: 11,216 disease terms. This release included the addition of new disease terms, definitions and nomenclature updates, and review and updates of rare diseases in the DO, including lymphoma nomenclature updates; the addition of new disease terms: breast implant illness; neurodevelopmental disorder with poor growth, spastic tetraplegia, and hearing loss; myoclonic-atonic epilepsy; oxoglutarate dehydrogenase deficiency; and neurodevelopmental disorder with regression, abnormal movements, loss of speech, and seizures. And the addition of a new DOreport for DO's cancer branch: new DO-ICDO-anatomy DOreport.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-02-27/src/ontology/doid-merged.obo) | |

### [v2023-01-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2023-01-30)

DO's January 2023 release includes 11,207 disease terms, with 8,820 (78.7%) textual definitions. 26 new disease terms, 76 new definitions. This release includes a new DO_infectious_disease_slim; updated xrefs from our bi-annual UMLS update, including all SNOMED_CT xrefs to the latest release; the annotation of trinucleotide repeat expansion disorders, digenic and polygenic disease annotations, a revised VEXAS syndrome, the addition of bronchopulmonary dysplasia and intellectual developmental disorder with ocular anomalies and distinctive facial features, numerous CNS neoplasm terms and their associated ICDO codes.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2023-01-30/src/ontology/doid-merged.obo) | |

## 2022 Releases

### [v2022-12-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-12-15)

This release includes 11,181 disease terms and the addition of ICDO codes for CNS cancers and breast cancers, 36 additional textual definitions and an updated disease name for monkeypox, now mpox.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-12-15/src/ontology/doid-merged.obo) | |

### [v2022-11-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-11-30)

This release includes 11,171 DO disease terms, with 8,746 terms with textual definitions (78.29%). This build includes 12 new diseases including: pulmonary veno-occlusive disease subtypes, Smith-McCort dysplasia subtypes, Sandestig-Stefanova syndrome, overactive bladder syndrome, graft verus host disease, and several neurodevelopmental disorders. New symptom and phenotype axioms have been added and we have standardized 'has_material_basis_in' in textual definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-30/src/ontology/doid-merged.obo) | |

### [v2022-11-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-11-01)

This release updates the October release, minor updates to EQ/SubClassOf statements.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-11-01/src/ontology/doid-merged.obo) | |

### [v2022-10-31](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-10-31)

This release includes 11,160 Disease Ontology terms along with the addition of skos exact mappings for MeSH xrefs, new disease terms, including: REV3L related disease; intellectual developmental disorder with hypotonia, impaired speech, and dysmorphic facies; revision of spinocerebellar ataxia type 27; spermatogenic failure,  augmentation of the Symptom Ontology logical definitions, new symptom axioms with review of DO-SYMP term overlap, updated SYMP import; and the addition of MeSH xref skos exact mappings & addition of terms to the DO_cancerslim.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-10-31/src/ontology/doid-merged.obo) | |

### [v2022-09-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-09-29)

This release of 11,158 disease terms includes expansion of DO's logical axioms defining disease to phenotype, disease to symptom and disease to disease features along with new disease terms (e.g. RCDP type 4, COPA syndrome, peroxisomal biogenesis disorder); enhancement of ICDO codes for CIViC/ClinGen collaboration, cleaning up of duplicate synonyms that differed by capitalization along with a UMLS xref update.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-09-29/src/ontology/doid-merged.obo) | |

### [v2022-08-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-08-29)

DO's August release includes the revision of disease classifications and the addition of new disease terms and xrefs. This release includes 11,137 disease terms which includes the addition of:  injection anthrax, 89 autosomal recessive intellectual  developmental disorder subtypes, hypotonia, ataxia, and delayed development syndrome and short stature, hearing loss, retinitis pigmentosa, and distinctive facies,  Leber congenital amaurosis 19,   HMG-CoA synthase 2 deficiency, DeSanto-Shinawi syndrome. This release includes revised classifications/added subtypes:  acromesomelic dysplasia, dilated cardiomyopathy, common variable immunodeficiency, agammaglobulinemia, 3-methylglutaconic aciduria, tetrahydrobiopterin (BH4)-deficient hyperphenylalaninemia, Mandibuloacral dysplasia, arthrogryposis. This release includes the addition of the annotation property, 'term replaced by': we will now add this annotation to  obsolete terms, relating the obsoleted term to the term that it was merged into; and we updated NCBITaxon logical definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-08-29/src/ontology/doid-merged.obo) | |

### [v2022-07-27](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-07-27)

This release includes the addition of new disease terms, definitions, and xrefs with updates to the SYMP symptom ontology. 11,033 DO disease terms, 9,171 (83%) with textual definitions, over 200 new axioms. New disease terms and their subtypes including hot water epilepsy, keratosis palmoplantaris striata, Baraitser-Winter syndrome, benign familial infantile seizures, Graves ophthalmopathy, inclusion body myopathy and brain white matter abnormalities, Catel Manzke syndrome, X-linked mental retardation Gustavson type, hyperthyroidism, nasal cavity benign neoplasm and spastic paraplegia with deafness; added term replaced by annotation property; definitions for biliary tract benign neoplasm, dental diseases, revised DO imports, augmented SYMP symptom ontology terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-07-27/src/ontology/doid-merged.obo) | |

### [v2022-06-07](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-06-07)

Updating DO imports.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-07/src/ontology/doid-merged.obo) | |

### [v2022-06-06](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-06-06)

This release includes a revised diabetes DM1 classification and revision of synonyms for two DO terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-06/src/ontology/doid-merged.obo) | |

### [v2022-06-02](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-06-02)

DO's May release was delayed a couple of days, as we were curating updates to some classifications. This release contains 11,003 DOIDs disease terms. New definitions, xrefs, uberon import terms, symptom axioms and terms were added, including: leukemia molecular subtypes & their ICDO codes; ectodermal dysplasia, immune deficiency, blastic plasmacytoid dendridic cell neoplasm, Marsili syndrome, Teebi hypertelorism syndrome terms. The Opitz GBBB syndrome and intellectual disability classifications were revised.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-06-02/src/ontology/doid-merged.obo) | |

### [v2022-04-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-04-28)

This release includes 10, 960 human diseases. This release includes the addition of diffuse large B-cell lymphoma molecular subtypes and spondylocostal dysostosis subtypes, syndrome definitions, updated definition source URLs and new symptom SubClassOf axioms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-28/src/ontology/doid-merged.obo) | |

### [v2022-04-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-04-01)

This release includes 10,948 DO disease terms, 77% with textual definitions; new cancer syndrome synonyms, ICDO xrefs, DLBCL disease subtypes, DICER1 syndrome and symptom SubClassOf statements have been added.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-04-01/src/ontology/doid-merged.obo) | |

### [v2022-03-02](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-03-02)

An extra release this week, including new DO terms Tatton-Brown-Rahman syndrome, craniotubular dysplasia Ikegawa type, updated series for spermatogenic failure and hereditary spastic paraplegia.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-03-02/src/ontology/doid-merged.obo) | |

### [v2022-02-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-02-28)

Re-releasing February DO release to fix typo in one name space.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-28/src/ontology/doid-merged.obo) | |

### [v2022-02-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-02-21)

This release includes 10,924 disease terms, an increase of 23 disease and 69 definitions; additional ICD-O xrefs for leukemias, revised classifications of cranial nerve neoplasms, diabetes, anemia and [glutathione synthetase deficiency; addition of > 350 symptom axioms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-02-21/src/ontology/doid-merged.obo) | |

### [v2022-01-31](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2022-01-31)

DO's January 2022 release. This release includes 10,902 disease terms with 77% (8,419 defined). We have added over 300 ICDO xrefs, new has_symptom axioms, revised sexual dysfunction and amblyopia terms and added lymphatic system diseases.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2022-01-31/src/ontology/doid-merged.obo) | |

## 2021 Releases

### [v2021-12-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-12-15)

DO's December 2021 release: includes the addition of has_symptom subClassOf axioms and term definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-12-15/src/ontology/doid-merged.obo) | |

### [v2021-11-17](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-11-17)

This release addresses two issues, an IAO ID substitution for the rdf:label, and the revision of has_symptom property.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-17/src/ontology/doid-merged.obo) | |

### [v2021-11-16](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-11-16)

The DO's November 2021 release includes 10,901 disease terms, the addition of: 32 disease terms,  a new slim file: DO_CFDE_slim with 44 DO terms, for the Common Fund Data Ecosystem project, the addition of: over 2,600 has_symptom axioms, DO terms for the OMIM pontocerebellar hypoplasia phenotypic series, and additional definitions and xrefs.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-11-16/src/ontology/doid-merged.obo) | |

### [v2021-10-11](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-10-11)

An extra release in early October to update imports and push out 11 new disease terms added by MGI.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-10-11/src/ontology/doid-merged.obo) | |

### [v2021-09-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-09-30)

DO's September 2021 release, contains updated biotin deficiency, dextro-looped transposition of the great arteries, glycogen storage diseases, the addition of the WHO's critical, severe and non-severe COVID-19 terms, classification updates for sexual health disorders and fibromyalgia, additional HPO phenotype axioms, and the addition of RO term object property 'disease has feature', and updated DISDRIV import.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-09-30/src/ontology/doid-merged.obo) | |

### [v2021-08-17v2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-08-17v2)

2nd August release to update ID label for Klippel-Feil syndrome 3 DOID:0080591

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17v2/src/ontology/doid-merged.obo) | |

### [v2021-08-17](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-08-17)

The 100th GitHub Release of the Human Disease Ontology. 10,862 disease terms. 76% (8312) textual definitions. Includes UMLS bi-annual update: new MESH, NCI, SNOMEDCT xrefs. New disease terms including parsley allergy, dill allergy, RNASET2-deficient cystic leukoencephalopathy.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-08-17/src/ontology/doid-merged.obo) | |

### [v2021-07-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-07-29)

DO's 99th GitHub release: includes 10,855 disease terms (76% with text definitions), 707 EQ and 6,542 SubClassOf disease axioms. Addition of "Disease Drivers" and "Onset" imports; doid-base.owl file, new disease terms including: diffuse large B-cell lymphoma activated B-cell type, diffuse large B-cell lymphoma germinal center B-cell type, autoimmune epilepsy, tuberculous encephalopathy; revised the Cowden classification; replace Relation term: 'located in' with 'disease has location'.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-07-29/src/ontology/doid-merged.obo) | |

### [v2021--6-08](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021--6-08)

This release includes axiom updates defining anatomy to disease relationships (change from ‘located in’ to ‘disease has location’ usage in the logical axioms); the addition of Ryanodine receptor-1 (RYR1) related disease terms. 10,844 DO disease terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021--6-08/src/ontology/doid-merged.obo) | |

### [v2021-06-03](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-06-03)

DO's May 2021 release. This release includes updates to 115 files, the addition of 23 new DO disease terms, 58 textual definitions and 198 SubClassOf axioms, additional OMIM cross references, defining environmental exposures for alcohol and age of onset.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-06-03/src/ontology/doid-merged.obo) | |

### [v2021-04-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-04-29)

This release includes 10,791 disease terms with 76% of terms defined - including the addition of 64 new disease terms, 67 textual definitions. and new cross references (OMIM, MeSH, GARD, Orphanet). Updates include: amyloidosis reclassification based on 2020 nomenclature update, polymicrogyria subtypes, sporadic amyotrophic lateral sclerosis, cytochrome P450 oxidoreductase deficiency and chromosomal 7q11.23 microduplication syndrome along with reorganization of the skeletal dysplasias, updated pediatric cancer nomenclature, and additional  ICDO codes.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-04-29/src/ontology/doid-merged.obo) | |

### [v2021-03-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-03-29)

This release includes 10,727 DO disease terms: an increase of 56 diseases; 74 definitions; 76% of DO terms defined; new glioma molecular subtypes; additional cross references and a new DO_RAD_slim.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-03-29/src/ontology/doid-merged.obo) | |

### [v2021-02-24](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-02-24)

This release includes 10,671 disease terms, the addition of 23 new diseases, 41 definitions and 211 SubClassOf statements in this release. New terms include glioma molecular subtypes and Bainbridge-Ropers syndrome, axioms defining transmission methods for bacterial infectious diseases and DO's Spring 2021 UMLS update.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-02-24/src/ontology/doid-merged.obo) |  |

### [v2021-01-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2021-01-28)

This release of 10,648 human diseases, includes 50 new diseases, including Parkinsonism and vascular Parkinsonism, a revised glioma classification, new subtypes for pemphigus, developmental and epileptic encephalopathy, and hypocalcemia.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2021-01-28/src/ontology/doid-merged.obo) |  |

---

## 2020 Releases

### [v2020-12-22](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-12-22)

This release includes a single syntax update from the previous release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-22/src/ontology/doid-merged.obo) |  |

### [v2020-12-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-12-21)

This release includes 10,598 disease terms, a revised classification of lung adenocarcinoma, augmented DO cancer slim, the addition of 30 new DO term, including long COVID, spermatogenic failure 47, Mayer-Rokitansky-Kuster-Hauser syndrome, urocanase deficiency, and latent autoimmune diabetes in adults.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-21/src/ontology/doid-merged.obo) |  |

### [v2020-12-02](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-12-02)

This release includes 10,560 Disease terms (75%, 7,916 defined), with logical axioms defined for congenital diseases and symptoms, the addition of UMLS, NCI cross references for COVID-19 and new disease terms (e.g. X-linked dyserythropoietic anemia, subtypes of hypomyelinating leukodystrophy and inflammatory bowel disease, and mild cognitive impairment, subjective cognitive decline) and definitions added for all lung disease terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-12-02/src/ontology/doid-merged.obo) |  |

### [v2020-11-11](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-11-11)

This release includes an updated classification of diabetes, defining an EQ statement for physical disorders, updated NCBItaxon import (Mumps virus and Dobrava-Belgrade virus), addition of VEXAS syndrome and low-grade glioma.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-11/src/ontology/doid-merged.obo) |  |

### [v2020-11-03](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-11-03)

DO's November release. This release includes the addition of 51 new DO terms and the addition of xrefs. Example new terms: X-linked severe congenital neutropenia, combined oxidative phosphorylation deficiency 51. Formatting of skos mappings for xref annotations (broad, exact, narrow) has been revised, from an annotation on the xref to the addition of a skos property item.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-11-03/src/ontology/doid-merged.obo) |  |

### [v2020-10-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-10-15)

Early release this month. 10,478 DO terms. This release include a revised asthma classification, the addition of cancer terms for CIViC, splits of genetic diseases - OMIM subtypes.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-10-15/src/ontology/doid-merged.obo) |  |

### [v2020-09-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-09-28)

Data updates: 10,394 DO terms, 74% of terms defined. 57 new DO terms. Revised HP and SO imports. New terms include non-syndromic intellectual disability subtypes, acute erythroid leukemia and plasmablastic lymphoma.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-28/src/ontology/doid-merged.obo) |  |

### [v2020-09-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-09-15)

This months Disease Ontology release of 10,347 DO disease terms (73%, 7654 defined) includes our bi-annual UMLS update, which includes updating to the latest SNOMEDCT_US release, and the addition of DO xrefs (ICD10CM, ICD9CM, MESH and NCI) and 191 OMIM IDs. This release includes new DO terms and term definitions, including lung sarcomatous carcinoma, autoimmune myocarditis and the addition of autoimmune, allergy disease logical definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-09-15/src/ontology/doid-merged.obo) |  |

### [v2020-08-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-08-21)

DO's monthly data release. All files are updated with new content. This release includes 10,334 DO disease terms (73% textual definitions: 7,630/10,334), an addition of 141 new disease terms, 159 textual definitions, and enhancement of cross references (OMIM, MeSH, GARD, Orphanet). This release includes the addition of COVID-19 related multisystem inflammatory syndrome in children (MIS-C), a new genetic disease classification type: gene duplication syndromes, and defining inferred parentage to immune system diseases, allergy diseases and autoimmune diseases.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-08-21/src/ontology/doid-merged.obo) |  |

### [v2020-07-23](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-07-23)

Release crated 07/23/2020: addition of medulloblastoma subtypes, pdated MESH xrefs, update
and thrombophilia series, coagulation diseases, added symptom axioms. 10,194 DO Disease terms,
73% (7,471) terms with textual definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-07-23/src/ontology/doid-merged.obo) |  |

### [v2020-06-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-06-18)

The DO June 2020 release includes 65 new DO terms, the addition of 173 text definitions (73% of DO terms now defined), the addition of 326 SubClassOf axioms, including defining viral, bacterial and fungal inferred child-parent relationships. This build includes 10,151 disease terms, splitting of Diamond-Blackfin anemia by subtype.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-06-18/src/ontology/doid-merged.obo) |  |

### [v2020-05-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-05-20)

In the DO May 2020 release, the DO contains 10,086 disease terms, with 71% of terms defined. This month the team has focused on augmenting DO's xrefs: OMIM ID, MESH, GARD and review of specific ICD10CM and NCI xrefs. 25 new DO terms have been created, parentage of cerebellar ataxia subtypes have been updated, additional axioms added to refine disease connections.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-05-20/src/ontology/doid-merged.obo) |  |

### [2020-04-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/2020-04-20)

In the DO April 20th 2020 release: Includes 10,014 DOIDs with 71% of DO terms defined! This release includes the updated COVID-19 parent term to the Coronavirus infectious disease, updated NCI cross references, and revised classification for absolute glaucoma.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/2020-04-20/src/ontology/doid-merged.obo) |  |

### [v2020-04-03](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-04-03)

In the DO April 3rd 2020 release: Includes 10,012 DOIDs with 71% of DO terms defined! This release includes the updated taxonomy name for Severe acute respiratory syndrome coronavirus 2 from NCBI Taxon, and the addition of B-ALL leukemia subtypes to the DO Cancer Slim.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-03/src/ontology/doid-merged.obo) |  |

### [v2020-04-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-04-01)

In the DO April 1st 2020 release: Includes 10,012 DOIDs with 71% of DO terms defined! This release includes updated cross references from the UMLS QC report, the addition of definition for dental cavities, new  UniProt terms, and Symptom Ontology logical definitions.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-04-01/src/ontology/doid-merged.obo) |  |

### [v2020-03-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-03-20)

In the DO March 20th 2020 release: Includes 9,955 DOIDs with 71% of DO terms defined! As an update to the release earlier this week, it includes MERS Middle East Respiratory Syndrome.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-20/src/ontology/doid-merged.obo) |  |

### [v2020-03-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-03-18)

In the DO March 18th 2020 release: Includes 9,949 DOIDs with 71% of DO terms defined! This release includes  new terms from UniProt and MGI requests, addition of OMIM phenotypic series, new eye disease definitions, and updated definitions for leukemias.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-18/src/ontology/doid-merged.obo) |  |

### [v2020-03-05](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-03-05)

In the DO March 2020 release: Includes 9,909 DOIDs with 70% of DO terms defined! This release includes updated neoplasm classifications as identified by MGI, 15 new Uniprot terms, additional logical definitions for symptoms, new plant allergy terms, and added GARD, MESH, ORDO xrefs from Wikidata Jenkins.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-03-05/src/ontology/doid-merged.obo) |  |

### [v2020-02-19v2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-02-19v2)

Latest version of the build includes changes and fixes to warnings, as well as the addition of British synonyms

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19v2/src/ontology/doid-merged.obo) |  |

### [v2020-02-19](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-02-19)

Rerelease to fix faulty DOID

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-19/src/ontology/doid-merged.obo) |  |

### [v2020-02-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-02-18)

In the DO February 2020 release: Includes 9,871 DOIDs with 69% of DO terms defined. This release includes the updated novel coronavirus term and definition, new MGI additions, revised synonyms, and new skos properties for Wikidata mappings.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-18/src/ontology/doid-merged.obo) |  |

### [v2020-02-04](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-02-04)

In the DO February 2020 release: Includes 9,834 DOIDs with 69% of DO terms defined. This release includes the novel coronavirus definition (2019-nCoV Coronavirus infectious diseases), addition of >200 logical definitions for symptoms (SYMP), updated NCBITaxon import, splits of DO terms based on OMIM subtypes, and the addition of the OMIM PS series and ORDO xrefs for autosomal dominant and recessive spinocerebellar ataxia.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-02-04/src/ontology/doid-merged.obo) |  |

### [v2020-01-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-01-15)

Version 2 Release of 01/14/2020 January Release to correct release date in files

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-15/src/ontology/doid-merged.obo) |  |

### [v2020-01-14](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2020-01-14)

In the DO  January 2020 release: Includes 9,749 DOIDs with 69% of DO terms defined. This release includes the addition of legume allergy, OMIM updates, and multiple quality control checks, including the updating of invalid definition links.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2020-01-14/src/ontology/doid-merged.obo) |  |

---

## 2019 Releases

### [v2019-12-12](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-12-12)

In the DO November 2019 release: Includes 9,690 DOIDs with 69% of DO terms defined. This release includes the addition over >200 more definition source types from Evidence and Conclusion Ontology, updates to the sources for definitions, and replacing lost located_in axioms for two branches. Early and late onset symptoms were also added to Alzheimer subtypes.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-12-12/src/ontology/doid-merged.obo) |  |

### [v2019-11-20_v2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-11-20_v2)

Release Updated with suite of DO files.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20_v2/src/ontology/doid-merged.obo) |  |

### [v2019-11-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-11-20)

In the DO November 2019 release: Includes 9,690 DOIDs, an increase in 36 DO terms, with 69% of DO terms defined. This release includes splits of DO terms based on OMIM subtypes, addition of definitions, new terms, Symptom Ontology logical axioms, and a new DO_IEDB_slim for the Immune Epitope Database.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-11-20/src/ontology/doid-merged.obo) |  |

### [v2019-10-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-10-30)

The DO's October 2019 release contains 9,654 DO Diseases (OBO file)with 68% of terms with textual definitions (6652/9654), with a total class count (doid.owl), 18,302. Curation activities for this release have focused on OMIM splits, the addition of 148 new DO diseases & their associated OMIM and MeSH xrefs, 152 textual definitions, 276 SubClass Of axioms, 32 new Symptom Ontology terms, and the addition of new IEDB alternative disease names.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-10-30/src/ontology/doid-merged.obo) |  |

### [v2019-09-16](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-09-16)

This release contains 9506 disease terms with 68% of terms defined (6500/9506). This release includes `dc:type` reference types using ECO classes as annotations on the definitions to show what kind of reference was used to create the definition. These annotations do not appear in the OBO-format release products. It also includes addition of more symptoms and new additions from OMIM splits.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-09-16/src/ontology/doid-merged.obo) |  |

### [v2019-8-22](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-8-22)

This release includes new Axioms for defining disease symptoms, contains 9,480 disease terms, with 68% of terms defined (6472/9480), review and revision of genetic susceptibility terms from OMIM, thus the creation of new DO diseases for psoriasis, epilepsy and febrile seizures. Inheritance axioms have been added across the genetic disease branch to further refine diseases as monogenic, autosomal or X-linked inheritance diseases.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-22/src/ontology/doid-merged.obo) |  |

### [v2019-8-06](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-8-06)

This release includes 9,423 Disease Terms with 68% defined (6414/9423),  the inclusions of additional OMIM Phenotype Series (e.g. congenital disorder of glycosylation, LEOPARD syndrome), added 39 new disease terms (e.g. Naxos disease, non-alcoholic fatty liver NAFL), added 42 definitions. The genetic disease branch was further refined, with the inclusion of 'polygenic disease' and 'digenic disease' terms and the addition of SubClassOf definitions to classify genetic disease terms to the more specific monogenic disease subtypes.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-8-06/src/ontology/doid-merged.obo) |  |

### [v2019-07015](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-07015)

The DO's July 2019 release includes a revised classification for early-onset  & late onset Parkinson's disease (coordinated with MGI and OMIM), the addition of new OMIM subtypes and term definitions. E.g. Angelman syndrome, leukocyte adhesion deficiency diseases, Boucher-Neuhauser syndrome, geroderma osteodysplasticum, hyaline body myopathy, autosomal recessive hyaline body myopathy, autosomal dominant hyaline body myopathy, isolated sulfite oxidase deficiency and Olive-McFarlane syndrome. This release includes 9,384 DO classes (67% defined: 6372/9384).

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-07015/src/ontology/doid-merged.obo) |  |

### [v2019-06-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-06-28)

June 2019 DO release. The addition of 90 new DO terms, term count = 9358, with 67% of terms defined (6341/9358) terms defined - an addition of 175 text definitions. This release includes the addition of: genetic disease subtypes (e.g. corneal dystrophy, bronchiectasis); revision of Parkinson's major subtypes (juvenile, early); OMIM cross-references; ICDO codes in collaboration with ClinGen and CIViC; new DO terms for MGI; and curation of cross-reference formats.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-06-28/src/ontology/doid-merged.obo) |  |

### [v2019-05-13](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-05-13)

The May 2019 DO release includes 9,268 disease classes, with 6166/9268 defined (66%).
This month's release includes updates to the mitochondrial depletion and dysfunction syndromes, removal of obsolete OMIM IDs, and new terms requested via DO's GitHub tracker including: thyroid gland anaplastic carcinoma, lung non-squamous non-small cell carcinoma, adult-onset leukoencephalopathy with axonal spheroids and pigmented glia, and adult-onset leukoencephalopathy with axonal spheroids and pigmented glia; adding missing xrefs and synonyms, e.g.  primary coenzyme Q10 deficiency series. Updates to the Disease Ontology for each GitHub commit are documented in:
https://github.com/DiseaseOntology/HumanDiseaseOntology/commits/master/src/ontology/doid-edit.owl.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-05-13/src/ontology/doid-merged.obo) |  |

### [v2019-04-18v2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-04-18v2)

Fixed incorrect names space property for one disease.
This release also includes updated OMIM IDs.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18v2/src/ontology/doid-merged.obo) |  |

### [v2019-04-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-04-18)

This release contains (doid.obo file): 9,262 disease terms, 98% with a single is_a parent, 6158/9262 (66%) of terms defined. This release includes the addition of ICD-O xrefs, inferred Y-linked inheritance disease terms, updating of the OMIM susceptibility terms, addition of pediatric cancer terms for ClinGen, addition of disease subtypes (e.g. Meier-Gorlin syndrome, miliaria), new DO terms (e.g. thiamine deficiency syndrome), adding back into DO Equivalent To statements that had disappeared during the file processing, reinstating Nipah virus encephalitis and the addition of OMIM, GARD, Orphanet and MESH IDs based on Wikidata updates.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-04-18/src/ontology/doid-merged.obo) |  |

### [v2019-03-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-03-01)

This release includes data and software updates:
DO website file (doid-non-classified.obo): 9,233 DO terms, 66%  (6,118/9233) DO terms defined; 83% with 1 parent, 15 % with 2 parents. doid.owl file: class count: 17,814; SubClassOf class axioms: 21,507; EquivalentClasses class axioms: 684. And the addition of new definitions, fixes to X-linked recessive disease logical definitions, fixes addressing GitHub ticker (dual parentage seen in doid-non-classified.obo/HumanDO.obo file; missing inferred child terms. DO's Makefile and robot.jar file have been enhanced to improve our QC and release process.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-03-01/src/ontology/doid-merged.obo) |  |

### [v2019-02-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2019-02-21)

Many updates included in this DO release.
Logical definitions have been added across cell and organ cancers.
285 Textual definitions were added. DO term definitions have been increased
to 66% (6102/9332) DO terms (a 4% increase) - as seen in doid.obo.
doid.owl - class count = 17,811, SubClassOf axioms: 20,008, EquivalentClasses: 674,
DisJointClasses: 28
109 new DO terms, based on OMIM subtype splits.
Many new terms from MGI, Xenbase, PomBase and FlyBase.
The Genotype Ontology (GENO)'s updates have been incorporated into the
DO, thus enabling us to create logical definitions for X-linked DO terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2019-02-21/src/ontology/doid-merged.obo) |  |

---

## 2018 Releases

### [v2018-12-17](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-12-17)

Revert back to database xrefs for definition sources.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-17/src/ontology/doid-merged.obo) |  |

### [v2018-12-14](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-12-14)

Major updates in this release:
added cancer terms for CIViC, MGI and PomBase.
Updated DO_cancer_slim and DO_AGR_slim files.
Revised cell type benign neoplasm inferred parent, logical
definitions. Term counts: doid.obo 9,113 terms, 5702/9113 Disease terms defined.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-12-14/src/ontology/doid-merged.obo) |  |

### [v2018-11-02](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-11-02)

Major updates for this release: logical definitions in cell type cancer branch.
ROBOT warnings for white spaces fixed.
9,095 DOIDs in OBO file- 62% defined, 11,493 in OWL file.
3,670 SubClassOf and 725 Equivalent To statements.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-11-02/src/ontology/doid-merged.obo) |  |

### [v2018-10-24](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-10-24)

Incorporated updates to genetic disease logical defs for modes of inheritance.
For this release, SO ontology (that DO imports) deprecated their root node, SO_000000.
To enable DO to have a root node, we kept 'sequence' , with the ID: doid#sequence.
Updates this release to cell type cancer, logical defs to Cell Ontology.
DO terms: 9,095, 62% defined, 5685/9095.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-24/src/ontology/doid-merged.obo) |  |

### [v2018-10-11](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-10-11)

This weeks release includes updates on X-linked dominant inheritance inferred parents, the addition of many cell type inferred parent axioms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-11/src/ontology/doid-merged.obo) |  |

### [v2018-10-05](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-10-05)

DO October 5th 2018 release.
9,092 DO terms, 5682/9092 terms defined (62%).
In doid.owl file: 4,071 SubClass Of statements, 940 Equivalent To axioms.
Added new human disease terms from MGI:  retinitis pigmentosa 77,
CLOVES syndrome, arly infantile epileptic encephalopathy 39. Defining
additional axioms for cell type cancer.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-10-05/src/ontology/doid-merged.obo) |  |

### [v2018-09-25](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-25)

This DO release includes updates to sarcoma axioms, fixing missing property values from Protege (obo_name_space, default-name-space), dc:date, missing label.
Example Term updates: Robinow syndrome, Goodpasture syndrome.
Updated DO_MGI_slim

Total DO terms (non-obosolete): 9,079 DOIDs, 62% with definitions (5655/9079)
Total DO terms (with imports): diid-merged.obo : 15,193 terms
Total DO classes (obsolete + non-obsolete): 11,476  (doid.owl file).

Check out our new Release diff file (release folder)

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-25/src/ontology/doid-merged.obo) |  |

### [v2018-09-13](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-13)

Updating release files to incorporate one fix, empty property field.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-13/src/ontology/doid-merged.obo) |  |

### [v2018-09-10v2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-10v2)

Updating names for subsetdefs.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10v2/src/ontology/doid-merged.obo) |  |

### [v2018-09-10](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-10)

Release files updated to incorporate updates for has obo name space annotations.
This release includes: OWL files : class count includes obsolete and non-obsolete DO terms.
doid-edit.owl file - class count includes classes in the import ontologies = 17579 classes
void-non-classified.owl [equivalent to HumanDO.owl] = class count only includes DO terms, class count = 11463, OBO files: count of only non-obsolete DO terms: 9069 terms, with 62% of terms having a textual definition.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-10/src/ontology/doid-merged.obo) |  |

### [v2018-09-07.2](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-07.2)

Updating the release files, to fix missing name space for newest IEDB disease terms.
Thank you Sue Bello at MGI for identifying this problem.

Cheers,
Lynn

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07.2/src/ontology/doid-merged.obo) |  |

### [v2018-09-07](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-09-07)

DO Monthly release
This release includes a number of updates: (1) subsets: creation of NCIt slim (includes 4268 DOIDs);(2) creation of complex disease logical definitions; (3) DOID term count : 9,460 disease terms, with 62% of DO terms having textual definitions, this includes the addition of 833 textual definitions produced from the DO UMSOM medical students; (4) the addition of 1491 GARD rare disease xrefs and 665 MeSH xrefs identified by Wikidata users and validated by the DO team; (5) the addition of equivalent axioms populating inferred genetic disease, monogenic disease, autosomal dominant disease, cell type cancer parent to child relationships -- to date the DO contains 730 equivalent axioms and 3612 subClassOf statements. As the DO team transitions cell type cancer asserted parents to inferred parents, the DO files now 3,318 DOIDs with more than one asserted parent term. This will be resolved in the next DO build.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-09-07/src/ontology/doid-merged.obo) |  |

### [v2018-07/05](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-07/05)

updating dangling merge and updating logical defs.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07/05/src/ontology/doid-merged.obo) |  |

### [v2018-07-03](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-07-03)

Add new disease terms for MGI, updates related to DO tickets, complex disease logical definitions

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-07-03/src/ontology/doid-merged.obo) |  |

### [v2018-06-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-06-29)

Updated ICD9 xrefs based on latest UMLS file, MESH terms updated, UBERON logical definitions augmented

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-29/src/ontology/doid-merged.obo) |  |

### [v2018-06-25](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-06-25)

Updated xrefs, for MESH.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-25/src/ontology/doid-merged.obo) |  |

### [v2018-06-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-06-21)



|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-06-21/src/ontology/doid-merged.obo) |  |

### [v2018-6-20](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-6-20)

This DO release includes a UMLS update, the addition of over 600 definitions, new terms for IEDB and logical definitions linking DO terms to UBERON anatomy terms.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-merged.obo) | [doid-merged.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-6-20/src/ontology/doid-merged.json) |

### [v2018-05-15](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-05-15)

Fix import issues.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-15/src/ontology/doid-merged.obo) |  |

### [v2018-05-11](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-05-11)

This DO release includes updates of synonyms, addition of UBERON logical definitions for multiple anatomy branches, addition of new DO terms, fixing of previous typos and addition of OMIM terms from Wikidata review.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-05-11/src/ontology/doid-merged.obo) |  |

### [v2018-03-02](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2018-03-02)

This release includes a new terms requested, a set of splits of OMIM terms from MGI, expanded axioms for endocrine system diseases and updates requested via our GitHub ticketing system.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2018-03-02/src/ontology/doid-merged.obo) |  |

---

## 2017 Releases

### [v2017-11-28](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-11-28)

DO's latest updates of terms, definitions and cross references. Details documented in DO tracker tickets.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-11-28/src/ontology/doid-merged.obo) |  |

### [v2017-9-29](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-9-29)

This release includes the AGR slim (subset), the addition of new MGI created susceptibility terms, addition of new DO terms for ZFIN and MGI.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-9-29/src/ontology/doid-merged.obo) |  |

### [v2017-07-14](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-07-14)

DO's July release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-07-14/src/ontology/doid-merged.obo) |  |

### [v2017-06-13](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-06-13)

New DO release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-06-13/src/ontology/doid-merged.obo) |  |

### [v2017-05-24](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-05-24)

New release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-24/src/ontology/doid-merged.obo) |  |

### [v2017-05-05](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-05-05)

New DO Release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid.obo) | [doid.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid.json) |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid-non-classified.obo) | [doid-non-classified.json](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid-non-classified.json) |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-05-05/src/ontology/doid-merged.obo) |  |

### [v2017-04-13](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-04-13)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-04-13/src/ontology/doid-merged.obo) |  |

### [v2017-03-10](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-03-10)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-03-10/src/ontology/doid-merged.obo) |  |

### [v2017-02-17](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-02-17)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-02-17/src/ontology/doid-merged.obo) |  |

### [v2017-01-27](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-01-27)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-27/src/ontology/doid-merged.obo) |  |

### [v2017-01-13](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-01-13)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-13/src/ontology/doid-merged.obo) |  |

### [v2017-01-09](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2017-01-09)

New release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2017-01-09/src/ontology/doid-merged.obo) |  |

---

## 2016 Releases

### [v2016-12-16](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-12-16)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid-non-classified.obo) |  |
| DO Merged | [doid-merged.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid-merged.owl) | [doid-merged.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-16/src/ontology/doid-merged.obo) |  |

### [v2016-12-09](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-12-09)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-12-09/src/ontology/doid-non-classified.obo) |  |

### [v2016-11-22](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-11-22)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-22/src/ontology/doid-non-classified.obo) |  |

### [v2016-11-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-11-18)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-18/src/ontology/doid-non-classified.obo) |  |

### [v2016-11-04](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-11-04)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-11-04/src/ontology/doid-non-classified.obo) |  |

### [v2016-10-21](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-10-21)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-10-21/src/ontology/doid-non-classified.obo) |  |

### [v2016-09-30](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-09-30)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-30/src/ontology/doid-non-classified.obo) |  |

### [v2016-09-26](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-09-26)

New release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-26/src/ontology/doid-non-classified.obo) |  |

### [v2016-09-23](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-09-23)

September 23 release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-09-23/src/ontology/doid-non-classified.obo) |  |

### [v2016-08-12](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-08-12)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-08-12/src/ontology/doid-non-classified.obo) |  |

### [v2016-07-08](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-07-08)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-08/src/ontology/doid-non-classified.obo) |  |

### [v2016-07-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-07-01)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-07-01/src/ontology/doid-non-classified.obo) |  |

### [v2016-06-17](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-06-17)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-06-17/src/ontology/doid-non-classified.obo) |  |

### [vv2016-06-10](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/vv2016-06-10)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/vv2016-06-10/src/ontology/doid-non-classified.obo) |  |

### [v2016-05-23](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-05-23)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-23/src/ontology/doid-non-classified.obo) |  |

### [v2016-05-06](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-05-06)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-05-06/src/ontology/doid-non-classified.obo) |  |

### [v2016-04-08](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-04-08)

Weekly release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-08/src/ontology/doid-non-classified.obo) |  |

### [v2016-04-01](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-04-01)

Weekly release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-04-01/src/ontology/doid-non-classified.obo) |  |

### [v2016-03-25](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-03-25)

Weekly release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-25/src/ontology/doid-non-classified.obo) |  |

### [v2016-03-18](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-03-18)

Weekly release

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-18/src/ontology/doid-non-classified.obo) |  |

### [v2016-03-11](https://github.com/DiseaseOntology/HumanDiseaseOntology/tree/v2016-03-11)

Weekly release.

|  | OWL | OBO | JSON |
| --- | --- | --- | --- |
| Disease Ontology | [doid.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/doid.owl) | [doid.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/doid.obo) |  |
| Human DO | [HumanDO.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/HumanDO.owl) | [HumanDO.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/HumanDO.obo) | |
| DO Non-Classified | [doid-non-classified.owl](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/doid-non-classified.owl) | [doid-non-classified.obo](https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/v2016-03-11/src/ontology/doid-non-classified.obo) |  |