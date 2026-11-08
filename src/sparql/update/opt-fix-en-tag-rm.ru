# Remove 'en' (and regional variants) from all text
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?iri ?property ?text_en .
	?blank owl:annotatedTarget ?text_en .
}
INSERT {
	?iri ?property ?text .
	?blank owl:annotatedTarget ?text .
}
WHERE {
	?iri ?property ?text_en .

	# ensure annotated annotations are preserved
	OPTIONAL {
		?blank owl:annotatedSource ?iri ;
			owl:annotatedProperty ?property ;
			owl:annotatedTarget ?text_en .
	}

	FILTER(langMatches(lang(?text_en), "en"))
	BIND(str(?text_en) AS ?text)
}