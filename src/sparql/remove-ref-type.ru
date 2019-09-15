PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

DELETE { ?ax dc:type ?refType }
WHERE {
	?s obo:IAO_0000115 ?definition .
	?ax owl:annotatedSource ?s ;
	    owl:annotatedProperty obo:IAO_0000115 ;
	    owl:annotatedTarget ?definition ;
	    dc:type ?refType .
}