# Remove all text (& axioms) with language tags other than the specified language
##### This is a template. Replace variable: @lang (quoted lang tag) #####
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?pred ?lang_rm .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?pred ;
		owl:annotatedTarget ?lang_rm ;
		?p ?o .
}
WHERE {
	VALUES ?pred {
		rdfs:label
		obo:IAO_0000115
		oboInOwl:hasExactSynonym
		oboInOwl:hasRelatedSynonym
		oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym
		rdfs:comment
	}

	?iri a owl:Class ;
		?pred ?lang_rm .

	OPTIONAL {
		?axiom owl:annotatedSource ?iri ;
			owl:annotatedProperty ?pred ;
			owl:annotatedTarget ?lang_rm ;
			?p ?o .
	}
	FILTER(lang(?lang_rm) != @lang)
}
