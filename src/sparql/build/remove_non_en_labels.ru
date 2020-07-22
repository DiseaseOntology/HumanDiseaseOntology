PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

DELETE { ?s rdfs:label ?label2 }
WHERE  { ?s rdfs:label ?label1 ;
            rdfs:label ?label2 . 
         FILTER (STR(?label1) != STR(?label2))
         FILTER (LANG(?label2) != "en")
       }