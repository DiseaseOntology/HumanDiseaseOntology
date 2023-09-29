# automatically add/remove terms with NCI xrefs to NCIthesaurus slim

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX DOID: <http://purl.obolibrary.org/obo/DOID_>
PREFIX doid: <http://purl.obolibrary.org/obo/doid#>

DELETE { ?class oboInOwl:inSubset doid:NCIthesaurus . }
WHERE {
    VALUES ?mapping_predicate {
        oboInOwl:hasDbXref skos:exactMatch skos:closeMatch
        skos:broadMatch skos:narrowMatch
    }

    ?class rdfs:subClassOf* DOID:4 ;
        oboInOwl:inSubset doid:NCIthesaurus .
    FILTER NOT EXISTS { 
        ?class_rm ?mapping_predicate ?NCI .
        FILTER( CONTAINS( str(?NCI), "NCI:" ) )
    }
} ;

INSERT { ?class oboInOwl:inSubset doid:NCIthesaurus . }
WHERE {
    VALUES ?mapping_predicate {
        oboInOwl:hasDbXref skos:exactMatch skos:closeMatch
        skos:broadMatch skos:narrowMatch
    }

    ?class rdfs:subClassOf* DOID:4 ;
        ?mapping_predicate ?NCI .
    FILTER( CONTAINS( str(?NCI), "NCI:" ) )
}