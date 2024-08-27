# Annotate acronyms (i.e. 1-2 letters, then 0-6 capital letters/numbers)
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

INSERT {
	oboInOwl:hasSynonymType a owl:AnnotationProperty ;
		rdfs:label "has_synonym_type" .

	oboInOwl:SynonymTypeProperty a owl:AnnotationProperty ;
		rdfs:label "synonym_type_property" .

	obo:OMO_0003012 a owl:AnnotationProperty ;
		rdfs:label "acronym" ;
		rdfs:subPropertyOf oboInOwl:SynonymTypeProperty .

	[] a owl:Axiom ;
		owl:annotatedSource ?class ;
		owl:annotatedProperty ?synonym_scope ;
		owl:annotatedTarget ?syn ;
		oboInOwl:hasSynonymType obo:OMO_0003012 .
}
WHERE {
	VALUES ?synonym_scope {
		oboInOwl:hasExactSynonym oboInOwl:hasRelatedSynonym
		oboInOwl:hasBroadSynonym oboInOwl:hasNarrowSynonym
	}

	?class ?synonym_scope ?syn .
	FILTER(REGEX(?syn, "^[A-Za-z][A-Z0-9]{1,7}$"))
	FILTER NOT EXISTS { ?class owl:deprecated true }
	FILTER NOT EXISTS {
		[] a owl:Axiom ;
			owl:annotatedSource ?class ;
			owl:annotatedProperty ?synonym_scope ;
			owl:annotatedTarget ?syn ;
			oboInOwl:hasSynonymType obo:OMO_0003012 .
	}
}