
# This Makefile is for use by the doid Release Manager.
#
# requirements: 
#   - OWLTools (http://code.google.com/p/owltools/)
#   - Oort (http://code.google.com/p/owltools/wiki/OortIntro)
#   - owljs (advanced operations only)
#   - apache-jena arq (for generating reports)
#
# To make a release, type 'make release' in this directory
#
# Questions to: Chris Mungall cjmungall AT lbl DOT gov

OBO = http://purl.obolibrary.org/obo
OIO = http://www.geneontology.org/formats/oboInOwl\#
EFO = http://www.ebi.ac.uk/efo

initial-build: doid.obo
build: doid.obo minidiff
release: doid.obo diff

all: doid.obo doidx.obo
release: all all_imports all_bridges

# all release files are derived from the editors version.
# we use the default Oort setup
doid.obo: doid-edit.owl ext.owl
	ontology-release-runner --catalog-xml catalog-v001.xml $< --skip-format owx --allow-overwrite --asserted --simple && ../experimental/fix-doid.pl doid-simple.obo > doid.obo
doid.owl: doid.obo
doidx.obo: doid.owl
	owltools --use-catalog $< --merge-imports-closure -o -f obo $@

# axiom from imported ontology (ext) merged in
doid-merged.owl: doid.owl
	owltools --use-catalog $< --merge-imports-closure -o $@
doid-merged.obo: doid-merged.owl
	owltools $< -o -f obo $@

doid-plus-%.obo: doid-plus-%.owl
	owltools --use-catalog $< --merge-imports-closure -o -f obo --no-check $@

# TEMPORARY!!! Sync with SVN. Once github is primary, this will be removed
doid-edit.owl:
	owltools $(HOME)/repos/diseaseontology/HumanDO.obo --add-imports-declarations $(OBO)/doid/ext.owl -o -f ofn $@.tmp && perl -npe 's@"ORDO:@"Orphanet:@' $@.tmp > $@
update-svn:
	svn update $(HOME)/repos/diseaseontology/HumanDO.obo

# ----------------------------------------
# Imports
# ----------------------------------------
# Get all NCBITaxon_* IDs used in doid-edit.owl and ext.owl
imports/ncbitaxon_list.txt: doid-edit.owl ext.owl
	grep -ho 'NCBITaxon.[0-9][0-9]*' $^ | sed 's/:/_/' | sort -u > $@

# Update OntoFox import using cURL to fetch the data.
# See http://ontofox.hegroup.org/tutorial/index.php#service
# Also trim final comment.
imports/%.owl: imports/%.txt
	curl -s -F file=@$< http://ontofox.hegroup.org/service.php \
	| sed '/^<\/rdf:RDF>/q' \
	> $@

.PHONY: ontofox_imports
ontofox_imports: imports/bto_import.owl imports/envo_import.owl imports/chebi_import.owl imports/ncbitaxon_import.owl

all_imports: imports/omim_import.owl imports/ncit_import.owl

KEEPRELS = BFO:0000050 BFO:0000051 RO:0002202 immediate_transformation_of

mirror/%.owl:
	owltools $(OBO)/$*.owl --remove-annotation-assertions -l --make-subset-by-properties -f $(KEEPRELS) --set-ontology-id $(OBO)/$*.owl -o $@
.PRECIOUS: mirror/%.owl

mirror/cl.owl:
	owltools $(OBO)/cl/cl-basic.owl --remove-annotation-assertions -l --make-subset-by-properties -f $(KEEPRELS) --set-ontology-id $(OBO)/cl.owl -o $@
.PRECIOUS: mirror/%.owl

#imports/%_import.owl: seed.owl mirror/%.owl
#	owltools --use-catalog --map-ontology-iri $(OBO)/doid/imports/$*_import.owl mirror/$*.owl $<   --extract-module -s $(OBO)/$*.owl -c --extract-mingraph  --set-ontology-id $(OBO)/doid/imports/$@ -o $@

mirror/Thesaurus.owl:
	cd mirror && wget -N http://ncicb.nci.nih.gov/xml/owl/EVS/$@
.PRECIOUS: mirror/Thesaurus.owl

mirror/CTD_diseases.obo:
	cd mirror && wget http://ctdbase.org/reports/CTD_diseases.obo.gz && gzip -d CTD_diseases.obo.gz

mirror/ctd.owl: mirror/CTD_diseases.obo
	owltools $< -o $@

imports/%_import.owl: seed.owl mirror/%.owl
	owltools --use-catalog $< mirror/$*.owl --merge-support-ontologies  --extract-module -s $(OBO)/$*.owl -c --extract-mingraph  --set-ontology-id $(OBO)/doid/$@ -o $@

imports/orphanet_import.owl: orphanet/ordo-slim.owl
	owltools $< --remove-axiom-annotations --set-ontology-id $(OBO)/doid/$@  -o $@
##	owltools $< --remove-axiom-annotations --remove-annotation-assertions -l -s -d --set-ontology-id $(OBO)/doid/$@  -o $@
##	owltools $< --remove-axiom-annotations --remove-annotation-assertions -l -s -d --reasoner-query -l disease --make-ontology-from-results $(OBO)/doid/$@  -o $@
###imports/orphanet_import.owl: seed.owl orphanet/ordo-slim.owl
###	owltools --use-catalog $< orphanet/orphanet-orig.owl --merge-support-ontologies --extract-module -s http://www.orpha.net/ontology/orphanet.owl -c --extract-mingraph --set-ontology-id $(OBO)/doid/imports/orphanet_import.owl -o $@

# NCIT import is mirror of ALL of DISEASE SUBSET of NCI
imports/ncit_import.owl: mirror/Thesaurus.owl
	owltools $<  --run-reasoner -r elk --assert-implied --reasoner-query -d -l 'Disease or Disorder' --make-ontology-from-results $(OBO)/doid/imports/ncit_import.owl -o $@

# CTD import is mirror of ALL of CTD
imports/ctd_import.owl: mirror/ctd.owl
	owltools $<  --set-ontology-id $(OBO)/doid/$@ -o $@

# Pull from Monarch disco2ttl build
imports/omim_import.owl: mirror/omim.ttl
	owltools $< --set-ontology-id $(OBO)/doid/$@ -o $@
#imports/omim_import.owl:
#	owltools $(OBO)/upheno/data/disorders.owl --set-ontology-id $(OBO)/doid/$@ -o $@

# refesh every time DO changes (too high?)
##mirror/omim.ttl: doid-edit.owl
mirror/omim.ttl: 
	wget http://nif-crawler.neuinfo.org/monarch/ttl/omim.ttl -O $@
.PRECIOUS: mirror/omim.ttl

#seed.owl: doid-edit.owl
#	cp $< $@
seed.owl: doid-edit.owl
	owltools --use-catalog $< disease-miner/all-do-bridge.obo --merge-support-ontologies  --remove-imports-declarations -o $@


imports/%.obo: imports/%.owl
	owltools $< -o -f obo $@.tmp && grep -v ^owl-axioms $@.tmp > $@

# ----------------------------------------
# Bridge
# ----------------------------------------
# Pipeline:
#  * We first create files of the form xxx_bridge_init.owl, directly from xrefs. xrefs become EquivClass axioms
#  * We then run decluster on these axioms (xxx_bridge_init.owl --> xxx_bridge.owl)
#     * xrefs remain as equivalent, unless not 1:1, in which case SubClassOf is used
BRIDGEONTS = ncit omim mesh ctd_omim_mesh
BRIDGE_OWL = $(patsubst %, bridge/%_bridge.owl, $(BRIDGEONTS))

#all_bridges: bridge/ncit_bridge.owl bridge/omim_bridge.owl bridge/mesh_bridge.owl
all_bridges: $(BRIDGE_OWL)
all_bridges_obo: $(patsubst %, bridge/%_bridge.obo, $(BRIDGEONTS))
all_bridges_html: $(patsubst %, bridge/%_report.html, $(BRIDGEONTS))

# DO maintains links to NCIt via xrefs of the form NCI:...
bridge/ncit_bridge_init.owl: doid-edit.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p NCI -m NCI 'http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#' --set-ontology-id $(OBO)/doid/$@ --add-imports-declarations $(OBO)/doid.owl $(OBO)/doid/imports/ncit_import.owl -o $@

# DO maintains links to UMLS via xrefs of the form UMLS_CUI:...
bridge/umls_bridge_init.owl: doid-edit.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p UMLS_CUI -m UMLS_CUI 'http://linkedlifedata.com/resource/umls/id/' --set-ontology-id $(OBO)/doid/$@ -o $@

# use DO-curated links to OMIM
bridge/omim_bridge_init.owl: doid-edit.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p OMIM --set-ontology-id $(OBO)/doid/$@ --add-imports-declarations $(OBO)/doid.owl $(OBO)/doid/imports/omim_import.owl -o $@

# use Orphanet xrefs
bridge/omim2ordo_bridge_init.owl: orphanet/ordo-phenome.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p OMIM --set-ontology-id $(OBO)/doid/$@ --add-imports-declarations $(OBO)/imports/orphanet_import.owl $(OBO)/doid/imports/omim_import.owl -o $@

# DO maintains links to Mesh via xrefs of the form MSH:{D,C}nnnnn
bridge/mesh_bridge_init.owl: doid-edit.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p MSH -m MSH $(OBO)/MESH_ --set-ontology-id $(OBO)/doid/$@ --add-imports-declarations $(OBO)/doid.owl $(OBO)/doid/imports/ctd_import.owl -o $@

# MESH<->OMIM, derived from CTD
#  note this is just the translation of the xrefs, e.g. MESH_nnnn EquivTo OMIM_nnnn
#  in some cases CTD will place OMIM as subclasses of MESH classes - these will not be included here
#  (see 
bridge/ctd_omim_mesh_bridge_init.owl: imports/ctd_import.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -a -n -p OMIM -m OMIM $(OBO)/OMIM_ --set-ontology-id $(OBO)/doid/$@ -o $@
##	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p MESH -m MSH $(OBO)/MESH_ --set-ontology-id $(OBO)/doid/$@ --add-imports-declarations $(OBO)/doid.owl $(OBO)/doid/imports/ctd_import.owl -o $@

bridge/mega_bridge_init.owl: $(BRIDGE_OWL)
	owltools --use-catalog $^ --merge-support-ontologies --set-ontology-id $(OBO)/doid/$@ -o $@

kegg2omim.txt:
	wget http://rest.genome.jp/link/disease/omim -O $@.tmp && cut -f1,2 $@.tmp | perl -npe 's/omim:/OMIM:/' > $@

## TODO: Orphanet
orphanet_bridges: bridge/orphanet_disease_omim_bridge.owl

orphanet_ontology: orphanet/orphanet-orig.owl

# The Orphanet "orphanet-disease.owl" file is manually created by opening the
# "orphanet-orig.owl" in Protege, deleting the gene subtree, and then saving
# as "orphanet-disease.owl"
bridge/orphanet_disease_omim_bridge_init.owl: orphanet/orphanet-orig.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p OMIM \
	--set-ontology-id $(OBO)/doid/$@ -o $@

# UPDATE THIS REGULARLY
orphanet/orphanet-orig.owl:
	wget -nd -P orphanet http://www.orphadata.org/data/ORDO/ordo_orphanet.owl.zip
	unzip  orphanet/ordo_orphanet.owl.zip -d orphanet && rm orphanet/ordo_orphanet*.zip
	mv orphanet/orphadata*.owl orphanet/orphanet-orig-1.owl
	orphanet/fix-ordo.pl orphanet/orphanet-orig-1.owl > orphanet/orphanet-orig.owl && rm orphanet/orphanet-orig-1.owl
	rm orphanet/ontology_version_* >/dev/null 2>&1 || true
	touch orphanet/ontology_verion_2

# use OBO tags/vocabulary; keep hierarchy in place
orphanet/orphanet-obostyle.obo: orphanet/orphanet-orig.owl orphanet/part_of.obo
	owltools $^ --merge-support-ontologies --rename-entity $(EFO)/definition $(OBO)/IAO_0000115 --rename-entity $(EFO)/alternative_term $(OIO)hasExactSynonym  --add-obo-shorthand-to-properties -o -f obo $@

# preserve only 'disease' and 'group of disorders' hierarchies, plus links between them
orphanet/ordo-phenome.owl: orphanet/orphanet-obostyle.obo
	owltools $< --make-subset-by-properties -f  BFO:0000050 --reasoner-query -l phenome --make-ontology-from-results $(OBO)/orphanet.owl  -o $@

orphanet/omim-equiv-ordo.owl: orphanet/ordo-phenome.owl
	owltools --use-catalog $< --translate-xrefs-to-equivs -n -p OMIM --set-ontology-id $(OBO)/doid/$@ -o $@

hpoa.ttl:
	wget http://nif-crawler.neuinfo.org/monarch/ttl/hpoa.ttl -O $@

## slim is only used terms
orphanet/ordo-subset-po.owl: orphanet/omim-equiv-ordo.owl
	owltools --use-catalog $< orphanet/ordo-phenome.owl  --extract-module -s $(OBO)/orphanet.owl -c  --set-ontology-id $(OBO)/doid/$@ -o $@

# translate all relationships (part_of) to subclass
orphanet/ordo-slim.owl: orphanet/ordo-subset-po.owl
	owljs-dlmatch -o $@ -r 'function(m){return owl.subClassOf(m.x, m.y)}' 'q.subClassOfMatch("?x",q.objectSomeValuesFromMatch("?r","?y"))'  $< 

bridge/orphanet_bridge.owl: ../experimental/orphanet_bridge.owl
	cp $< $@

# translate _init.owl use decluster step
bridge/%_bridge.owl: bridge/%_bridge_init.owl
	owljs-decluster -m bridge/$*_report.md.tmp -o $@.tmp $<  >& $@.log && owltools --use-catalog $@.tmp --set-ontology-id $(OBO)/doid/$@ -o $@ && mv bridge/$*_report.md.tmp bridge/$*_report.md

bridge/%_bridge.obo: bridge/%_bridge.owl
	owltools --use-catalog $< --remove-imports-declarations -o -f obo $@ 

bridge/%_report.md: bridge/%_bridge.owl

bridge/%_report.html: bridge/%_report.md
	pandoc $< -o $@

bridge/%_merged.obo: bridge/%_bridge.owl
	owltools --use-catalog $< --merge-imports-closure -o -f obo $@
bridge/%_merged.owl: bridge/%_bridge.owl
	owltools --use-catalog $< --merge-imports-closure -o $@

bridge/all.obo: bridge/all.owl
	owltools --use-catalog $< --merge-imports-closure -o -f obo --no-check $@



## TODO - convert to java/js
#bridge/omim-doid-equiv.tbl: imports/omim_import.obo
#	blip-findall -i $< -i doid.obo "one_to_one_xref(D,X,'OMIM')" -no_pred -select X-D -label -use_tabs > $@.tmp && mv $@.tmp $@
#bridge/omim-doid-subclass.tbl:  imports/omim_import.obo
#	blip-findall -i $< -i doid.obo "one_to_many_xref(D,X,'OMIM')" -no_pred -select X-D -label -use_tabs > $@
#bridge/omim-doid-rev-subclass.tbl: imports/omim_import.obo
#	blip-findall -i $< -i doid.obo "many_to_one_xref(D,X,'OMIM')" -no_pred -select X-D -label -use_tabs > $@
#bridge/omim-doid-m2m.tbl: imports/omim_import.obo
#	blip-findall -i $< -i doid.obo "many_to_many_xref(D,X,'OMIM')" -no_pred -select X-D -label > $@

# ----------------------------------------
# Class-merges
# ----------------------------------------
%-ecmerged.owl: %.owl doid.owl
	owltools --use-catalog $< --merge-imports-closure --reasoner elk --merge-equivalence-sets -s OMIM 10 -s Orphanet 9 -s DOID 8 -s MESH 3 -l DOID 10 -l Orphanet 5 -l OMIM 1 -o $@ >& $@.log
.PRECIOUS: %-ecmerged.owl

%-ecmerged.obo: %-ecmerged.owl
	owltools $< -o -f obo $@

# ----------------------------------------
# Subsets
# ----------------------------------------
doid-mingraph.obo: doid.owl
	owltools --use-catalog $< --extract-mingraph -o -f obo $@ && ./util/remove-obo-axioms-tag.pl $@

# ----------------------------------------
# Reports
# ----------------------------------------
all_reports: reports/doid-basicReport.csv reports/doid-subClasses.csv reports/doid-xrefs.csv reports/omim-equivalentClasses.csv reports/omim-subClassesExt.csv reports/omim-unmapped.csv reports/umls-equivalentClasses.csv

reports/doid-%.csv: doid-merged.owl sparql/%.sparql
	arq --data $< --query sparql/$*.sparql --results csv > $@.tmp && ./util/curiefy-purls.pl $@.tmp > $@ && rm $@.tmp

reports/omim-%.csv: bridge/omim_merged.owl sparql/%.sparql
	arq --data $< --query sparql/$*.sparql --results csv > $@.tmp && ./util/curiefy-purls.pl $@.tmp > $@ && rm $@.tmp

reports/umls-%.csv: bridge/umls_merged.owl sparql/%.sparql
	arq --data $< --query sparql/$*.sparql --results csv > $@.tmp && ./util/curiefy-purls.pl $@.tmp > $@ && rm $@.tmp

# ----------------------------------------
# Reasoning
# ----------------------------------------
%.inferences: %.owl
	owltools --use-catalog $< --run-reasoner -r elk > $@.tmp && grep ^INF $@.tmp > $@

# ----------------------------------------
# Diffs
# ----------------------------------------

# 
diff: doid.obo
	cd diffs && touch doid-diff && rm doid-*diff* && make

# Minidiff: intra-release differences
minidiff: doid.obo
	cd diffs  && touch doid-diff && rm doid-*diff* && make TGTS='html txt' SRC=../doid.obo && mail -s doid-diffs RELEASE-MANAGER@FOO.BAR < doid-combined-diff.txt

# ----------------------------------------
# Sync with old DO (TEMPORARY)
# ----------------------------------------

LEGACY=../../../diseaseontology/HumanDO.obo 
test.ofn: $(LEGACY)
	owltools $<  --make-subset-by-properties // --set-ontology-id $(OBO)/doid.owl -o -f ofn $@

test2.ofn: test.ofn
	grep -v 'oboInOwl\#id' $< > $@




