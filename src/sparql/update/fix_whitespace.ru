# Remove extra whitespace from ALL strings
#  -> removes 2+ spaces, spaces before commas or periods, and spaces at beginning or end of string
PREFIX xsd:  <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

DELETE { ?s ?p ?o . }
INSERT {
    ?s ?p ?new_o .
}
WHERE {
	?s ?p ?o .
    FILTER( datatype(?o) IN (rdf:langString, xsd:string) )
    BIND(
        REPLACE(
            REPLACE(?o, " (,) *| +", "$1 "),
            " (\\.)| +$|^ +", "$1"
        ) AS ?new_o
    )
}