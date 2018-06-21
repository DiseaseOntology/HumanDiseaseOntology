import pronto
import os

def loadDOFile(filename):
	"""
	Loads a Disease Ontology file from the src directory. Only the filename is needed, not the directory

	:param filename: Filename to load (e.g. doid.obo)
	:type filename: str
	:return: Loaded ontology object
	:rtype: pronto.Ontology
	"""

	scriptDir = os.path.dirname(__file__)
	absFilename = os.path.join(os.path.dirname(scriptDir),'src','ontology', filename)
	return pronto.Ontology(absFilename)

def checkSingleParent(ont):
	"""
	Checks that all non-obsolete items in an ontology have exactly one parent

	:param ont: The ontology to test
	:type ont: pronto.Ontology
	"""

	notObsolete = [ term for term in ont if not ('is_obsolete' in term.other and 'true' in term.other['is_obsolete']) ]
	notObsoleteAndNotRoot = [ term for term in notObsolete if term.id != 'DOID:4' ]

	notsingleparent = sorted([ (term.id,term.name) for term in notObsoleteAndNotRoot if len(term.parents) != 1 ])
	notsingleparentTrimmed = notsingleparent[:min(5,len(notsingleparent))]

	assert len(notsingleparent) == 0, "%d of %d item(s) were found to have non-singular parents. The first few are %s" % (len(notsingleparent),len(notObsoleteAndNotRoot),str(notsingleparentTrimmed))

def checkNoOrphans(ont):
	"""
	Checks that all non-obsolete items in an ontology have at least one parents and hence that there are no orphan terms

	:param ont: The ontology to test
	:type ont: pronto.Ontology
	"""

	notObsolete = [ term for term in ont if not ('is_obsolete' in term.other and 'true' in term.other['is_obsolete']) ]
	notObsoleteAndNotRoot = [ term for term in notObsolete if term.id != 'DOID:4' ]

	orphans = sorted([ (term.id,term.name) for term in notObsoleteAndNotRoot if len(term.parents) == 0 ])
	orphansTrimmed = orphans[:min(5,len(orphans))]

	assert len(orphans) == 0, "%d of %d item(s) were found to have no parents. The first few are %s" % (len(orphans),len(notObsoleteAndNotRoot),str(orphansTrimmed))

def checkConnectivity(ont):
	"""
	Checks that all non-obsolete items in the ontology are children of the Disease (DOID:4) term and hence the ontology is fully connected

	:param ont: The ontology to test
	:type ont: pronto.Ontology
	"""

	root = ont.get('DOID:4') # Get the Disease root
	allRootChildren = list(root.rchildren())

	notObsolete = [ term for term in ont if not ('is_obsolete' in term.other and 'true' in term.other['is_obsolete']) ]
	notObsoleteAndNotRoot = [ term for term in notObsolete if term.id != 'DOID:4' ]

	unattached = sorted([ (item.id,item.name) for item in notObsoleteAndNotRoot if not item in allRootChildren ])
	unattachedTrimmed = unattached[:min(5,len(unattached))]

	assert len(unattached) == 0, "%d of %d item(s) were found to be unattached to the main section of the ontology rooted at Disease (DOID:4). The first few are %s" % (len(unattached),len(notObsoleteAndNotRoot),str(unattachedTrimmed))

def parentChainContainsCycle(term):
	"""
	Check if the chain of parents from an item contains a cycle by navigating along the sequence of parents

	:param term: The ontology term to check
	:type term: pronto.Term
	:return: Whether the parent chain contains a cycle
	:rtype: bool
	"""

	seen = set()
	toProcessed = [term]
	while len(toProcessed) > 0:
		processing = toProcessed.pop(0)
		if processing in seen:
			return True
		seen.add(processing)

		toProcessed += list(processing.parents)
	return False

def checkNoCycles(ont):
	"""
	Checks that no cycles exist in the parent chains for any non-obsolete item. This is used to make sure that the structure is a tree.

	:param ont: The ontology to test
	:type ont: pronto.Ontology
	"""

	notObsolete = [ term for term in ont if not ('is_obsolete' in term.other and 'true' in term.other['is_obsolete']) ]
	itemsWithinCycles = sorted([ (item.id,item.name) for item in notObsolete if parentChainContainsCycle(item) ])
	itemsWithinCyclesTrimmed = itemsWithinCycles[:min(5,len(itemsWithinCycles))]
	
	assert len(itemsWithinCycles) == 0, "%d of %d item(s) were found to contain a parent chain cycle where the chain of parent terms would come back to itself. The first few are %s" % (len(itemsWithinCycles),len(list(ont)),str(itemsWithinCyclesTrimmed))


def test_doid_noorphans():
	checkNoOrphans(loadDOFile('doid.obo'))

def test_doidnonclassified_singleparents():
	checkSingleParent(loadDOFile('doid-non-classified.obo'))

def test_doid_allconnected():
	checkConnectivity(loadDOFile('doid.obo'))

def test_doidnonclassified_allconnected():
	checkConnectivity(loadDOFile('doid-non-classified.obo'))

def test_doidnonclassified_nocycles():
	checkNoCycles(loadDOFile('doid-non-classified.obo'))

