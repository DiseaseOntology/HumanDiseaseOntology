# Add "en" language tag to all labels without a language tag
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

DELETE { ?class rdfs:label ?label }
INSERT { ?class rdfs:label ?new_label }
WHERE {
	?class rdfs:label ?label .
	FILTER( CONTAINS( str(?class), "DOID" ) )
	FILTER( lang(?label) = "" )
	BIND( STRLANG(?label, "en") AS ?new_label )
}