# Replace newlines (/n, /r, or /r/n) in text with spaces

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?pred ?text .
	?axiom owl:annotatedTarget ?text .
}
INSERT {
	?iri ?pred ?text_new .
	?axiom owl:annotatedTarget ?text_new .
}
WHERE {
	VALUES ?pred {
		rdfs:label
		obo:IAO_0000115
		oboInOwl:hasExactSynonym
		oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym
		oboInOwl:hasRelatedSynonym
		rdfs:comment
	}
	?iri ?pred ?text .

	OPTIONAL {
		?axiom a owl:Axiom ;
			owl:annotatedSource ?iri ;
			owl:annotatedProperty ?pred ;
			owl:annotatedTarget ?text .
	}

	FILTER(REGEX(?text, "[\\r\\n]"))
	BIND((REPLACE(?text, "[\\r\\n]+", " ")) AS ?text_new)

	FILTER NOT EXISTS { ?iri owl:deprecated true }
}
