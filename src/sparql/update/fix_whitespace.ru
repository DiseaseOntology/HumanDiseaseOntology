# Fix whitespace in all strings (e.g. remove 2+ spaces, spaces before
#   commas or periods, and spaces at beginning or end of string)
# Execute with ROBOT 1.9.4 as
# robot --add-prefixes src/sparql/doid-edit_prefixes.json query -i src/ontology/doid-edit.owl --update ../../DO_dev/sparql/update/DO-remove_extra_space.ru -o tmp.ofn && robot convert -i tmp.ofn -o tmp2.ofn && mv tmp2.ofn src/ontology/doid-edit.owl && rm tmp.ofn

PREFIX xsd:  <http://www.w3.org/2001/XMLSchema#>

DELETE { ?s ?p ?o . }
INSERT {
    ?s ?p ?new_o .
}
WHERE {
	?s ?p ?o .
    FILTER( datatype(?o) = xsd:string )
    BIND( 
        REPLACE(
            REPLACE(?o, " (,) *| +", "$1 "),
            " (\\.)| +$|^ +", "$1"
        ) AS ?new_o
    )
}