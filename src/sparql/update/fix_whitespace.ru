# Remove extra whitespace from ALL strings
#  -> removes 2+ spaces, spaces before commas or periods, and spaces at beginning or end of string
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