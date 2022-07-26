# delete definitions from HP phenotypic abnormality terms

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>

DELETE { ?class obo:IAO_0000115 ?def . }
WHERE {
	?class rdfs:subClassOf* obo:HP_0000118 ;
		obo:IAO_0000115 ?def .
}
