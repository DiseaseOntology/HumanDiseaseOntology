# Remove all text (& axioms) with language tags other than the specified language
# annotated to classes and ontology.
##### This is a template. Replace variable: @lang (quoted lang tag) #####
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

DELETE {
	?iri ?pred ?lang_rm .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?pred ;
		owl:annotatedTarget ?lang_rm ;
		?p ?o .
	?ontology ?ont_pred ?ont_rm ;
		dc:language ?dclang_rm .
}
WHERE {
	VALUES ?pred {
		rdfs:label
		obo:IAO_0000115
		oboInOwl:hasExactSynonym
		oboInOwl:hasRelatedSynonym
		oboInOwl:hasBroadSynonym
		oboInOwl:hasNarrowSynonym
		rdfs:comment
	}

	?iri a owl:Class ;
		?pred ?lang_rm .

	OPTIONAL {
		?axiom owl:annotatedSource ?iri ;
			owl:annotatedProperty ?pred ;
			owl:annotatedTarget ?lang_rm ;
			?p ?o .
	}

	FILTER(!langMatches(lang(?lang_rm), @lang))

	?ontology a owl:Ontology .
	OPTIONAL {
		VALUES ?ont_pred {
			dc:description
			rdfs:comment
		}
		?ontology ?ont_pred ?ont_rm .
		FILTER(!langMatches(lang(?ont_rm), @lang))
	}

	OPTIONAL {
		?ontology dc:language ?dclang_rm .
		FILTER(str(?dclang_rm) != @lang)
	}
}
