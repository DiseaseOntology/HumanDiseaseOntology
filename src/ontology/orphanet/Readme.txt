 To generate Orphanet bridge files do the following:
 
 1. run: make orphanet_ontology
 This will download and unzip the hard-coded Orphanet ontology version 
 into the orphanet/orphanet-orig.owl file. There is a 1.3 version but at 
 this time the download link appears to be broken.
 
 2. Open the -orig.owl ontology file in Protege and delete the "gene" class and its 
 subtree, and save as orphanet-disease.owl in the same folder.

 3. run: make orphanet_bridges
 There will be orphanet_* bridge files in the bridge folder. Currently, only 
 an OMIM bridge for Orphanet diseases is generated but others will be added.