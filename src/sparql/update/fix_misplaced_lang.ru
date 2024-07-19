# Remove 'en' lang tag from non-lang strings
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?iri ?property ?object_lang }
INSERT { ?iri ?property ?object }
WHERE {
	?iri ?property ?object_lang .
	FILTER(contains(str(?iri), "DOID"))
	FILTER(datatype(?object_lang) IN (xsd:string, rdf:langString) && lang(?object_lang) != "")

	# ignore properties that can have a language tag
	MINUS {
		VALUES ?lang_property {
			rdfs:label obo:IAO_0000115 rdfs:comment
			oboInOwl:hasExactSynonym oboInOwl:hasBroadSynonym
			oboInOwl:hasNarrowSynonym oboInOwl:hasRelatedSynonym
		}
		?iri ?lang_property ?object_lang .
	}

	BIND(str(?object_lang) AS ?object)
}

