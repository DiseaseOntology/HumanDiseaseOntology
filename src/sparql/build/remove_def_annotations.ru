# delete owl:Axiom statements annotating definition triples

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>

DELETE { ?ax ?pred ?subj . }
WHERE {
	?ax owl:annotatedProperty obo:IAO_0000115 ;
		?pred ?subj .
}
