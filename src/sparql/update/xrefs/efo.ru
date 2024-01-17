# Remove mappings to obsolete EFO terms (usually replaced with Mondo terms)
# 	Uses Ontobee SPARQL endpoint
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?class oboInOwl:hasDbXref ?efo_id . }
WHERE {
	SERVICE <http://sparql.hegroup.org/sparql/> {
		GRAPH <http://www.ebi.ac.uk/efo/> {
			?efo a owl:Class ;
				owl:deprecated ?any .
			BIND( CONCAT( "EFO:", STRAFTER( str(?efo), "EFO_" ) ) AS ?efo_id )
		}
	}

	?class a owl:Class ;
		oboInOwl:hasDbXref ?efo_id .
	FILTER NOT EXISTS { ?class owl:deprecated ?any . }
}
