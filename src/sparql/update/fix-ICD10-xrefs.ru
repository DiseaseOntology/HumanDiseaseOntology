# Replace 'ICD10' prefix with 'ICD10CM'
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

DELETE { ?class oboInOwl:hasDbXref ?xref . }
INSERT { ?class oboInOwl:hasDbXref ?new_xref . }
WHERE {
    ?class oboInOwl:hasDbXref ?xref .

	FILTER(CONTAINS(?xref, "ICD10:"))
	BIND (
		REPLACE (?xref, "ICD10:", "ICD10CM:")
		AS ?new_xref
	)
}