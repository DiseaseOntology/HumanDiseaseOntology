# Reformat definition gene symbols as "the <symbol> gene"
# NOTE: excludes definitions with locus, allele and region in them to prevent adding redundant "gene" to them
PREFIX obo: <http://purl.obolibrary.org/obo/>

DELETE {
    ?class obo:IAO_0000115 ?def .
    ?ax ?pred ?def .
    ?def ?pred2 ?ax2 .
}
INSERT {
    ?class obo:IAO_0000115 ?new_def .
    ?ax ?pred ?new_def .
    ?new_def ?pred2 ?ax2 .
}
WHERE {
	?class obo:IAO_0000115 ?def .
    OPTIONAL { ?ax ?pred ?def . }
    OPTIONAL { ?def ?pred2 ?ax2 . }

	FILTER(CONTAINS(?def, "chromosome") && !REGEX(?def, "gene|allele|locus|region"))
	BIND (
		REPLACE (?def, " (the )?([A-Z0-9\\-]{4,})([ ,.])", " the $2 gene$3")
		AS ?new_def
	)
}