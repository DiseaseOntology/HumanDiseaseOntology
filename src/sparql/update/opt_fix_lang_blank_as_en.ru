# Add 'en' to labels/defs/comments/synonyms with no lang tag
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?property ?object .
	?blank owl:annotatedTarget ?object .
}
INSERT {
	?iri ?property ?object_en .
	?blank owl:annotatedTarget ?object_en .
}
WHERE {
	VALUES ?property {
		rdfs:label rdfs:comment obo:IAO_0000115
		oboInOwl:hasExactSynonym oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym oboInOwl:hasRelatedSynonym
	}

	?iri ?property ?object  .

	# ensure annotated annotations are preserved
	OPTIONAL {
		?blank owl:annotatedSource ?iri ;
			owl:annotatedProperty ?property ;
			owl:annotatedTarget ?object ;
			?p ?o .
	}

	FILTER(contains(str(?iri), "DOID"))
	FILTER(lang(?object) = "")
	BIND(strLang(?object, "en") AS ?object_en)
}