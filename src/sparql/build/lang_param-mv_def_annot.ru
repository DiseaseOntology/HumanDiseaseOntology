# Transfer definition annotations from English to specified language (if it exists)
##### This is a template. Replace variable: @lang (quoted lang tag) #####
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE {
	?def_axiom owl:annotatedTarget ?def_en .
}
INSERT {
	?def_axiom owl:annotatedTarget ?def_lang .
}
WHERE {
	# identify terms with both English & lang definitions (to transfer axioms)
	?iri obo:IAO_0000115 ?def_en , ?def_lang .

	FILTER(langMatches(lang(?def_en), "en") || lang(?def_en) = "")
	FILTER(lang(?def_lang) = @lang)

	?def_axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty obo:IAO_0000115 ;
		owl:annotatedTarget ?def_en .
}
