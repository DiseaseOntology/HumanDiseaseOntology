# Remove all lang tags from non-lang strings (xrefs, etc.)
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?iri ?property ?object_lang }
INSERT { ?iri ?property ?object }
WHERE {
	?iri ?property ?object_lang .
	FILTER(langMatches(lang(?object_lang), "*"))

	# ignore non-DOID classes
	FILTER(contains(str(?iri), "DOID"))

	# ignore properties that can have a language tag
	MINUS {
		VALUES ?lang_property {
			rdfs:label
			obo:IAO_0000115
			oboInOwl:hasExactSynonym
			oboInOwl:hasBroadSynonym
			oboInOwl:hasNarrowSynonym
			oboInOwl:hasRelatedSynonym
			rdfs:comment
		}
		?iri ?lang_property ?object_lang .
	}

	BIND(str(?object_lang) AS ?object)
}

