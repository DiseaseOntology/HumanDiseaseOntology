# Remove all text (& axioms) with language tags other than the specified language
# This is a template that requires replacement to specify the language
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?predicate ?drop_lang .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?predicate ;
		owl:annotatedTarget ?drop_lang ;
		?p ?o .
}
WHERE {
	VALUES ?predicate {
		rdfs:label obo:IAO_0000115 rdfs:comment
		oboInOwl:hasExactSynonym oboInOwl:hasRelatedSynonym
		oboInOwl:hasBroadSynonym oboInOwl:hasNarrowSynonym
	}
	?iri ?predicate ?drop_lang .
	OPTIONAL {
		?axiom owl:annotatedSource ?iri ;
			owl:annotatedProperty ?predicate ;
			owl:annotatedTarget ?drop_lang ;
			?p ?o .
	}

	FILTER(lang(?drop_lang) != "!<<lang>>!")
}
