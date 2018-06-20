import argparse
import pronto
import os

def getRoot(item):
	while item.parents:
		assert len(item.parents) == 1
		item = item.parents[0]
	return item

def checkConnectivity(ont):
	print("Checking connectivity")

	root = getRoot(list(ont)[0])
	allitems = list(ont)
	allfromroot = [root] + list(root.rchildren())

	unattached = sorted([ (item.id,item.name) for item in allitems if not item in allfromroot ])
	unattachedTrimmed = unattached[:min(5,len(unattached))]

	assert len(unattached) == 0, "%d of %d item(s) were found to be unattached to the (likely) main section of the ontology. The first few are %s" % (len(unattached),len(allitems),str(unattachedTrimmed))

def loadDOFile(filename):
	scriptDir = os.path.dirname(__file__)
	absFilename = os.path.join(os.path.dirname(scriptDir),'src','ontology', filename)
	return pronto.Ontology(absFilename)

def test_connectivity_doid():
	checkConnectivity(loadDOFile('doid.obo'))

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Tests structure of ontology')
	parser.add_argument('--oboFile',required=True,type=str,help='OBO file for the ontology')
	args = parser.parse_args()

	ont = pronto.Ontology(args.oboFile)

	checkConnectivity(ont)

