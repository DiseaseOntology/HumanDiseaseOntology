# TEMPORARY ADJ: Remove all text (& axioms) with language tags other than the
# specified language with the EXCEPTION of English when a given text element
# does NOT exist in the specified language; ensure all English placeholders have
# been tagged explicitly with "en" for clarity.

##### This is a template. Replace variable: @lang (quoted lang tag) #####
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>


# MAIN CLASS REMOVAL QUERY
DELETE {
	?iri ?pred ?lang_rm .
	?axiom owl:annotatedSource ?iri ;
		owl:annotatedProperty ?pred ;
		owl:annotatedTarget ?lang_rm ;
		?p ?o .
}
WHERE {
	# remove all non-@lang and non-English text from classes
	{
		# class annotations
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
		FILTER(
			!langMatches(lang(?lang_rm), @lang) &&
			!lang(?lang_rm) IN ("", "en")
		)
	}
	UNION
	# remove all English non-required text from classes
	{
		VALUES ?pred {
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
		FILTER(lang(?lang_rm) = "" || langMatches(lang(?lang_rm), "en"))
	}
	UNION
	# remove English required text from classes, IFF @lang text exists
	{
		VALUES ?pred {
			rdfs:label
			obo:IAO_0000115
		}

		?iri a owl:Class ;
			?pred ?lang_rm, ?lang_retain .

		OPTIONAL {
			?axiom owl:annotatedSource ?iri ;
				owl:annotatedProperty ?pred ;
				owl:annotatedTarget ?lang_rm ;
				?p ?o .
		}

		FILTER(lang(?lang_rm) = "" || langMatches(lang(?lang_rm), "en"))
		FILTER(langMatches(lang(?lang_retain), @lang))
	}
} ;

# ENGLISH TAGGING QUERY
DELETE {
	?iri ?pred ?lang_placeholder .
	?axiom owl:annotatedTarget ?lang_placeholder .
}
INSERT {
	?iri ?pred ?lang_en .
	?axiom owl:annotatedTarget ?lang_en .
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
		?pred ?lang_placeholder .

	OPTIONAL {
		?axiom owl:annotatedSource ?iri ;
			owl:annotatedProperty ?pred ;
			owl:annotatedTarget ?lang_placeholder .
	}

	FILTER(lang(?lang_placeholder) = "")
	BIND(STRLANG(?lang_placeholder, "en") AS ?lang_en)
};

# ONTOLOGY ANNOTATION REMOVAL QUERY
# remove everything non-@lang from ontology annotations
# retain only language tags found on classes in ontology
DELETE {
	?ontology ?ont_pred ?ont_rm ;
		dc:language ?dclang_rm .
}
INSERT {
	?ontology dc:language ?dclang .
}
WHERE {
	# ontology annotations
	VALUES ?ont_pred {
		dc:description
		rdfs:comment
	}

	?ontology a owl:Ontology .

	OPTIONAL {
		?ontology ?ont_pred ?ont_rm .
		FILTER(!langMatches(lang(?ont_rm), @lang))
	}

	# handle dc:language separately
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
		?pred ?text .

	BIND(REPLACE(lang(?text), "^$", "en") AS ?lang)

	OPTIONAL {
		?ontology dc:language ?dclang, ?dclang_rm .
		FILTER(?dclang = ?lang)
	}
}