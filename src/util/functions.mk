# Extracts versionIRI from pre-opened OWL files (works for local & remote files)
# NOTES:
# 1. Reads stdin ONLY to versionIRI -> req'd to avoid long read time of
#	large files (e.g. chebi).
# 2. The last `sed` replaces a custom XML entity (used in foodon) with the OBO
#	URI it represents (i.e. '&obo;' -> 'http://purl.obolibrary.org/obo/'),
#	see https://www.w3schools.com/xml/xml_dtd_entities.asp for bkgd info.
define extract_versionIRI
	sed -n '/owl:versionIRI/p;/owl:versionIRI/q' | \
	sed -E 's/.*"([^"]+)".*/\1/' | \
	sed 's|&obo;|http://purl.obolibrary.org/obo/|'
endef
