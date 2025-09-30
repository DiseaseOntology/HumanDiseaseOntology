# Remove all exact synonyms that are duplicates of the rdfs:label
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?iri oboInOwl:hasExactSynonym ?synonym }
WHERE {
    ?iri rdfs:label ?label ;
        oboInOwl:hasExactSynonym ?synonym .
    FILTER(str(?label) = str(?synonym))
}
