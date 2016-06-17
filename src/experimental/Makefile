all: mondo.obo mondo_score2.tsv mondo_score1.tsv mondo_score2.tsv mondo_unclassified.tsv

all_rest: missing-omc.obo missing-omimps.obo sim-omc.tsv


## --
## DO
## --
disease_nosyn.obo: ../ontology/doid.obo
	grep -v ^synonym $< > $@

## --
## MGI clusters
## --

# this is now maintained directly in contrib
#../contrib/omimclusters.obo:
#	wget ftp://ftp.informatics.jax.org/pub/curatorwork/OMIM.clusters -O $@

# local copy of MGI's file
# todo: add def back later, but watch for multiple def tags
omimclusters.obo: ../contrib/omimclusters.obo ../ontology/imports/omim_import.obo
	obo-merge-tags.pl  -t synonym -t name $^ > $@.tmp && obo2obo $@.tmp -o $@

# subset that includes only the clusters/groupings
omc.obo: omimclusters.obo
	obo-grep.pl -r 'id: DC' $< > $@.tmp && mv $@.tmp $@

omimclusters_plus_bridge.obo: omimclusters.obo ../contrib/omimclusters_bridge_to_doid.obo 
	obo-merge-tags.pl -t is_a -t equivalent_to $^ > $@

# DO-mapped clusters
# Some DCs will be replaced by DOIDs
omc-mapped-to-do.obo: omimclusters_plus_bridge.obo xrefs-doid-to-omc.obo
	obo-map-ids.pl --use-xref-inverse xrefs-doid-to-omc.obo  xrefs-doid-to-omc-edited.obo $< > $@

omim-genes.obo: omimclusters.obo
	blip ontol-query -consult munger.pro -i $< -i ordo.obo -query "omim_gene(ID)" -to obo > $@

# omimclusters with DO dupes carved out (and genes removed too)
omc-minimal.obo: omc-mapped-to-do.obo
	obo-subtract.pl $< ../ontology/doid.obo omim-genes.obo  > $@.tmp && obo-grep.pl --neg -r is_obsolete $@.tmp > $@

## --
## OMIM Phenotypic Series
## --

omim-leaf.obo: ../ontology/imports/omim_import.obo
	obo-grep.pl --neg -r 'id: OMIM:PS' $< > $@.tmp && grep -v ^owl-ax $@.tmp | grep -v ^is_a > $@

omimps.obo: ../ontology/imports/omim_import.obo
	obo-grep.pl -r 'id: OMIM:PS' $< > $@.tmp && grep -v ^owl-ax $@.tmp > $@

omimps-min.obo: ../ontology/imports/omim_import.obo
	grep -v ^def: $< | obo-grep.pl -r 'OMIM:PS' - > $@.tmp && grep -v ^owl-ax $@.tmp > $@

## --
## Textual alignment based on labels/syns
## --

DOID = ../ontology/doid.obo
align-doid-to-omim.tsv: omim-leaf.obo
	blip-findall -i ignore.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-decipher.tsv: ../contrib/decipherclusters.obo
	blip-findall -i super_ignore.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-mesh.tsv: mesh.obo
	blip-findall -i super_ignore.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-omc.tsv: omc.obo
	blip-findall -i super_ignore.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-omimps.tsv: omimps.obo
	blip-findall -i ignore.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-ordo.tsv: ordo.obo $(DOID)
	blip-findall -i ignore.pro -i ignore_rare_genetic.pro -u metadata_nlp -i $< -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

align-doid-to-ordo-nosyn.tsv: ordo_nosyn.obo disease_nosyn.obo
	blip-findall -i ignore.pro -u metadata_nlp -i $< -i disease_nosyn.obo -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,false),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@


align-doid-to-hp.tsv: $(DOID)
	blip-findall -i ignore.pro -u metadata_nlp -r HP -r disease -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@




## --
## Extract xrefs
## --

xrefs-%.obo: align-%.tsv
	cut -f1-4 $< | sort -u | grep ^DOID | tbl2obolinks.pl --rel xref > $@.tmp && mv $@.tmp $@

ixrefs-%.obo: align-%.tsv
	cut -f1-4 $< | sort -u | grep -v ^DOID | tbl2obolinks.pl --rel xref > $@.tmp && mv $@.tmp $@

isa-%.obo: align-%.tsv
	cut -f1-4 $< | sort -u | grep -v ^DOID | tbl2obolinks.pl --rel is_a > $@.tmp && mv $@.tmp $@

## --
## MESH missing from DO
## --
mesh.obo: ../ontology/imports/ctd_import.obo
	perl -npe 's@\s+EXACT\s+@ RELATED @ if m@^synonym@' $< > $@

# @Deprecated
m.pro: ../contrib/MesH.contrib/mesh_list.txt
	perl -npe 's/:.*//;s/^/MESH:/' $< | tbl2p -p m > m.pro

mesh-missing-from-doid.tsv:
	blip-findall -i mesh.obo -r disease -i xrefs-doid-to-mesh.obo -i m.pro "m(X),\+entity_xref(D,X)" -select X -use_tabs  -label > $@

mesh-missing-nearest-parent-doid.tsv: xrefs-doid-to-mesh.obo
	blip-findall -i mesh.obo -r disease -i $< -i m.pro "m(X),\+entity_xref(D,X),subclassT(X,X1),entity_xref(D,X1),\\+((subclassT(X,X2),subclassT(X2,X1),entity_xref(_,X2)))" -select X-D -no_pred -use_tabs  -label > $@



## --
## Xrefs to logic axioms
## --

ordo-subclassof-doid.obo: isa-doid-to-ordo.obo ixrefs-doid-to-ordo-nosyn.obo
	obo-subtract.pl $^ > $@

doid-equiv-ordo.owl: xrefs-doid-to-ordo-nosyn.obo
	owltools $< --translate-xrefs-to-equivs -n -p Orphanet --set-ontology-id $(OBO)/doid/bridge/$@ -o $@

orphanet_bridge.owl: doid-equiv-ordo.owl ordo-subclassof-doid.obo
	owltools $^ --merge-support-ontologies --set-ontology-id $(OBO)/doid/bridge/$@  -o $@.tmp && fix-ordo-uris.pl $@.tmp >$@


#orphanet_bridge.owl: doid-equiv-ordo.owl isa-doid-to-ordo.obo 
#	owltools $^ --merge-support-ontologies --reasoner elk --remove-redundant-inferred-super-classes --set-ontology-id $(OBO)/doid/bridge/$@  -o $@.tmp && fix-ordo-uris.pl $@.tmp >$@

## --
## All those that lack an xref pointing at them are considered missing
## --

missing-%.obo: %.obo ixrefs-doid-to-%.obo sim-ixrefs-%.obo
	obo-subtract.pl $^ | obo-grep.pl --neg -r is_obsolete - > $@

## --
## Jaccard similarity based analysis
## --

sim-omc.tsv: ../contrib/omimclusters.obo
	blip-findall -debug index -consult jaccard.pro -i $< -r disease -goal ix sim_dc_bm/5 -label -no_pred > $@.tmp && mysort -k1,3 -n $@.tmp > $@

omcrest.obo:  ../contrib/omimclusters.obo ixrefs-doid-to-omc.obo 
	obo-subtract.pl $^ > $@

sim-omcrest.tsv: omcrest.obo
	blip-findall -debug index -consult jaccard.pro -i $< -r disease -goal ix sim_dc_bm/5 -label -no_pred > $@.tmp && mysort -k1,3 -n $@.tmp > $@

#sim-omc.pro: sim-omc.tsv
#	tbl2p -p s $< > $@
#sim-ixrefs-omc.obo: sim-omc.tsv
#	perl -n tsv2obo.pl sim-omc.tsv | tbl2obolinks.pl -k --rel xref > $@.tmp && mv $@.tmp $@

sim-ixrefs-omc.obo: sim-omc.tsv
	tbl2obolinks.pl -k --rel xref $< > $@.tmp && mv $@.tmp $@
sim-xrefs-omc.obo: sim-omc.tsv
	tbl2obolinks.pl --swap -k --rel xref $< > $@.tmp && mv $@.tmp $@

all-xrefs-omc.obo: sim-xrefs-omc.obo xrefs-doid-to-omc.obo
	obo-simple-merge.pl $^ > $@


## --
## Orphanet
## --

ordo.obo: ../ontology/orphanet/orphanet-obostyle.obo
	cp $< $@
#	owltools $< -o -f obo $@.tmp && fix-ordo.pl $@.tmp > $@

ordo_nosyn.obo: ordo.obo
	grep -v ^synonym $< > $@

ordogrp.obo: ordo.obo
	blip ontol-query -i $< -query "subclassRT(ID,'Orphanet:377794')"  -to obo > $@.tmp && mv $@.tmp $@

ordorest.obo:  ordo.obo ixrefs-doid-to-ordo.obo 
	obo-subtract.pl $^ > $@

## --
## Annotations
## --


## --
## New cluster suggestions
## --

suggest-omimcluster.tsv: omimclusters.obo
	blip-findall  -i $< -consult munger.pro new_omim_cluster/2 -label -use_tabs -no_pred > $@.tmp && sort -u $@.tmp > $@

## --
## Summary Report
## --
mapping.tsv:
	blip-findall -i d2p.pro -consult summary.pro -i omimclusters.obo -i ordo.obo -r disease -i omimps-min.obo s/6 -label -no_pred | grep ^OMIM > $@
mapping2.tsv:
	blip-findall -i d2p.pro -consult summary.pro -i omimclusters.obo -i ordo.obo -i efo.obo -r disease s/6 -label -no_pred | grep ^OMIM > $@

ordo-missing.tsv: ordo.obo
	blip-findall -i d2p.pro -i $< "d2p(D,_),id_idspace(D,'Orphanet'),\+class(D)" -select D | sort -u > $@

all-rpt: mapping-grep-DC-noORDO.txt mapping-grep-noDC-ORDO.txt mapping-grep-noDC-noORDO.txt
all2-rpt: mapping2-grep-DC-noORDO.txt mapping2-grep-noDC-ORDO.txt

clean-rpt: 
	rm mapping*-grep-*.txt

%-grep-DC-noORDO.txt: %.tsv
	grep DC $< | grep -v Orphanet > $@ && wc $@
%-grep-noDC-ORDO.txt: %.tsv
	grep -v DC $< | grep Orphanet > $@ && wc $@
%-grep-noDC-noORDO.txt: %.tsv
	grep -v DC $< | grep -v Orphanet > $@ && wc $@


# find discriminatory phenotypes
omc-differentia.txt:
	blip-findall  -r hpoa -consult munger -r HP -i omimclusters.obo -goal ix group_phenotype_number/6 -label -no_pred > $@
ordo-differentia.txt:
	blip-findall  -r hpoa -consult munger -r HP -i ordo.obo -goal ix ordo_group_phenotype_number/6 -label -no_pred > $@

### REWRITE ORDO

G = write_all_mdo
IG = -i super_ignore.pro

# For reporting/debugging purposes:
# Assign each ORDO class to a category
# The same methods are used for new_ordo
ordo_category.tsv: ordo.obo ../ontology/doid.obo
	blip-findall -u metadata_nlp -debug index $(IG) -goal index_entity_pair_label_match   -r disease -i omcrest.obo -i $< -consult munger.pro -r hpoa all_ordo_category/3 -label -no_pred > $@

# Rewrite of ORDO, removing classes and rewiring classes, swapping in DOID or DC where available.
# Note: as a result of the rewiring, there may be redundancies in the hierarchy
new_ordo.obo: ordo.obo omc-minimal.obo ../ontology/doid.obo
	blip-findall -u metadata_nlp -debug index $(IG) -goal index_entity_pair_label_match  -r disease -i omc-minimal.obo -i $< -consult munger.pro -r hpoa $(G) -label > $@.tmp && grep -v $(G) $@.tmp > $@

# merge in the set of DCs we are using. 
# Also: Remove redundancy from the hierarchy
new_ordo_merged.obo: new_ordo.obo omc-minimal.obo
	blip-ddb -debug xontol -i $< -i omc-minimal.obo -r disease  -u ontol_management -goal remove_simple_redundant_facts io-convert -to obo -o $@

# 
new_ordo_equivs.obo: new_ordo_merged.obo
	blip -i super_ignore.pro  -u metadata_nlp -i $< -consult munger.pro -goal index_entity_pair_label_match,write_equiv_omims,halt > $@ 


# complete merged ontology, prior to including mesh
mondo_no_mesh.obo: new_ordo_merged.obo new_ordo_equivs.obo
	owltools $^ --merge-support-ontologies -o -f obo $@

# squish in MESH
mondo_squished.obo: mondo_no_mesh.obo mesh_rest.obo
	owltools $^ --merge-support-ontologies --reasoner elk --merge-equivalence-sets -s OMIM 10 -s DOID 9 -s Orphanet 8 -s MESH 7 -l DOID 10 -l Orphanet 5 -l MESH 3 -l OMIM 1 --set-ontology-id $(OBO)/mondo.owl -o -f obo --no-check $@.tmp && ./fix-final.pl $@.tmp > $@

new_ordo_subs.tsv: mondo_squished.obo
	blip-findall -consult munger.pro -debug index -i super_ignore.pro -u metadata_nlp -i $< -index "entity_nlabel_scope_stemmed(+,+,0,0)" "inferred_subclass(X,Y,'DC','DOID',LX,LY),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,LX,LY)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

new_ordo_sim.tsv: mondo_squished.obo
	blip-findall -debug index -consult jaccard.pro -i $<  -goal ix sim_dc_bm/5 -label -no_pred > $@.tmp && mysort -k1,3 -n $@.tmp > $@


mesh_rest.obo: xrefs-mesh.obo mondo_no_mesh.obo
	blip-findall -consult munger.pro -i $< -i mondo_no_mesh.obo -i mesh.obo -r disease "write_mesh(M),fail" > $@
###	blip-findall -i m.pro -consult munger.pro -i $< -i mesh.obo -r disease "write_mesh(M),fail" > $@

mondo.obo: mondo_squished.obo ../contrib/decipherclusters.obo
	obo-cat.pl -i $^ >  $@

mondo-simple.obo: mondo.obo
	owltools $< --reasoner elk --merge-equivalence-sets -s OMIM 10 -s DOID 9 -s Orphanet 8 -s MESH 7 -l DOID 10 -l Orphanet 5 -l MESH 3 -l OMIM 1 --set-ontology-id $(OBO)/mondo.owl -o -f obo --no-check  $@

mondo.owl: mondo.obo
	owltools $< -o $@.tmp && ./fix-ordo-uris.pl $@.tmp > $@

%-danglers.txt: %.obo
	obo2obo $< -o $@.roundtrip >& $@.tmp && grep 'No parent' $@.tmp > $@

mondo_rpt.tsv: mondo.obo
	blip-findall  -i $< -i d2p.pro -consult summary.pro disease_lineage/3 -label -no_pred  > $@.tmp && mv $@.tmp $@


mondo_score2.tsv: mondo.obo
	blip-findall  -i $< -i d2p.pro -consult summary.pro mondo_score/1 -label -no_pred  > $@.tmp && mv $@.tmp $@

mondo_score1.tsv: mondo_rpt.tsv
	./calc-mondo-score.pl $< > $@

mondo_unclassified.tsv: mondo_rpt.tsv
	egrep '\t(2|1|0)\t' $< > $@

mondo_generic_omims.tsv: mondo.obo
	blip-findall -i $< "subclass(Child,X),id_idspace(X,'OMIM')" -select X-Child -label > $@.tmp && mv $@.tmp $@

images/mdo-doid-%.png: mondo.obo
	blip ontol-subset -i $< -query "subclassT(ID,'DOID:$*')" -u ontol_config_do -to png -cr part_of > $@
images/mdo-omim-%.png: mondo.obo
	blip ontol-subset -i $< -query "subclassT(ID,'OMIM:$*')" -u ontol_config_do -to png -cr part_of > $@

genereviews.ttl:
	wget http://nif-crawler.neuinfo.org/monarch/ttl/genereviews.ttl -O $@

align-mondo-to-mesh.tsv: mesh.obo mondo_no_mesh.obo
	blip-findall -i super_ignore.pro -u metadata_nlp -i $< -i mondo_no_mesh.obo -goal index_entity_pair_label_match "entity_pair_label_reciprocal_best_intermatch(X,Y,S),class(X),class(Y),\\+disjoint_from(X,Y),\\+disjoint_from(Y,X)" -select "m(X,Y,S)" -use_tabs -label -no_pred > $@.tmp && sort -u $@.tmp > $@

xrefs-mesh.obo: align-mondo-to-mesh.tsv
	cut -f1-4 $< | sort -u | grep -v ^MESH | tbl2obolinks.pl --rel xref > $@.tmp && mv $@.tmp $@


## OBOL

DOIDX = ../ontology/doidx.obo

doid-xp-anatomy-basic.obo: $(DOIDX)
	obol qobol -i $< -r pext -tag disease -scope all -tag basic -undefined_only true -export obo -idspace DOID > $@.tmp && cat $@.tmp obolrels.obo > $@
doid-xp-anatomy.obo: $(DOIDX)
	obol qobol -i $< -r pext -tag disease -scope all -undefined_only true -export obo -idspace DOID > $@.tmp && cat $@.tmp obolrels.obo > $@

doid-xp-go.obo: $(DOIDX)
	obol qobol -i $< -r go -tag disease -tag go -scope all -undefined_only true -export obo -idspace DOID > $@.tmp && mv $@.tmp $@

doid-xp-%.owl: doid-xp-%.obo
	owltools $< -o -f ofn $@
%.axioms: %.owl
	grep ^EquivalentClasses $< > $@
