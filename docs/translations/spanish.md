# Spanish / español

Spanish is the second most widely spoken primary language in the world.

# Translation Process

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