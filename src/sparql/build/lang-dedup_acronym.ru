# Drop acronyms from non-English languages if they match English acronyms
# NOTE!!!! Acronyms are difficult to translate and are, in some cases, reused
#   across languages, so this approach is not perfect and may be revised in the
#   future.
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?scope ?acronym_lang .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?scope ;
		owl:annotatedTarget ?acronym_lang ;
		oboInOwl:hasSynonymType obo:OMO_0003012 ;
		?pred ?obj .
}
WHERE {
	VALUES ?scope {
		oboInOwl:hasExactSynonym
		oboInOwl:hasRelatedSynonym
		oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym
	}

	?iri ?scope ?acronym_en, ?acronym_lang .
	[] owl:annotatedSource ?iri ;
		owl:annotatedProperty ?scope ;
		owl:annotatedTarget ?acronym_en ;
		oboInOwl:hasSynonymType obo:OMO_0003012 ;
		?pred ?obj .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?scope ;
		owl:annotatedTarget ?acronym_lang ;
		oboInOwl:hasSynonymType obo:OMO_0003012 ;
		?pred ?obj .

	FILTER(lang(?acronym_en) = "" || langMatches(lang(?acronym_en), "en"))
	FILTER(lang(?acronym_lang) != "" && !langMatches(lang(?acronym_lang), "en"))
	FILTER(str(?acronym_lang) = str(?acronym_en))
}
