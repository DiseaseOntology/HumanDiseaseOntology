# Fix incorrect synonym type annotation property

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?axiom ?property obo:OMO_0003012 }
INSERT { ?axiom oboInOwl:hasSynonymType obo:OMO_0003012 }
WHERE {
	VALUES ?syn_scope {
		oboInOwl:hasExactSynonym
		oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym
		oboInOwl:hasRelatedSynonym
	}
	?iri ?syn_scope ?acronym .
	
	?axiom a owl:Axiom ;
    	owl:annotatedSource ?iri ;
        owl:annotatedProperty ?syn_scope ;
        owl:annotatedTarget ?acronym ;
        ?property obo:OMO_0003012 .
	FILTER(?property != oboInOwl:hasSynonymType)
}