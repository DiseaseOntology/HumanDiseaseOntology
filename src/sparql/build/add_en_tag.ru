# Add English language tag to all literals that don't have a language tag
# NOTE: OBO ontologies are expected to use English as primary language
#	(http://obofoundry.org/principles/fp-006-textual-definitions.html)
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

# For DOID class annotations
DELETE {
	?iri ?pred ?no_lang .
	?axiom owl:annotatedTarget ?no_lang .}
INSERT {
	?iri ?pred ?en .
	?axiom owl:annotatedTarget ?en .
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
		oboInOwl:hasOBONamespace "disease_ontology" ;
		?pred ?no_lang .
	OPTIONAL {
		?axiom owl:annotatedSource ?iri ;
			owl:annotatedProperty ?pred ;
			owl:annotatedTarget ?no_lang ;
			?p ?o .
	}
	FILTER(lang(?no_lang) = "")
	BIND(STRLANG(?no_lang, "en") AS ?en)
} ;

# For DO ontology annotations
DELETE {
	?ontology ?ont_pred ?ont_no_lang .
}
INSERT {
	?ontology ?ont_pred ?ont_en .
}
WHERE {
	?ontology a owl:Ontology .
	OPTIONAL {
		VALUES ?ont_pred {
			dc:description
			rdfs:comment
		}
		?ontology ?ont_pred ?ont_no_lang .
		FILTER(lang(?ont_no_lang) = "")
		BIND(STRLANG(?ont_no_lang, "en") AS ?ont_en)
	}
}
