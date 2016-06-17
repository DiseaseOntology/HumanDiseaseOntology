these docs are drafty and not very cohesive yet

# Making MonDo (Monarch Disease Ontology)

See the file mondo.obo - we will maintain as obo for the time being as
it makes sense for github. Paths etc may change.

MonDo is a merge of 4 sources:

 * OMIM
 * Orphanet/ORDO
 * DOID
 * MGI DiseaseClusters

No one set on its own is sufficient; we have HPO annotations to OMIM
diseases, but OMIM is a flat list (OMIM Phenotypic Series are highly
incomplete). In addition, we have some HPO annotations to Orphanet
diseases.

The following file (best viewed in Excel) lists for each OMIM ID that
Monarch has annotations for, what the corresponding equivalent or
grouping is in DC, Orphanet, OMIM Phenotypic Series and DOID:

 * [mapping.tsv](mapping.tsv)

The Disease Ontology (DOID) is in itself not complete enough for
complete classification of OMIM. There are many gaps, and in many
cases xrefs in DOID are ambiguous w.r.t whether the meaning is
equivalence or subclass, which presents problems for making a unified
heirarchy

One option is to use Orphanet by itself, or the combination of
Orphanet plus OMIM. However, The ORDO ontology representation of
Orphanet presents a number of challenges, outlined below.

## Hierarchy issues with ORDO

ORDO includes various distinct terms of the form

 * X
 * rare X
 * genetic X
 * rare genetic X

However, these are typically not arranged together as we might expect. See for example:

![eye](images/eye-disease-ordo.png)

The has the hierarchy:

 * Orphanet:101435 ! Rare genetic eye disease
    * Orphanet:140653 ! Neuro-ophthalmological disease
    * Orphanet:183616 ! Genetic neuro-ophthalmological disease

It's not clear why the two terms are siblings rather than the genetic
form being a subclass of the genetics-unspecified form. Furthermore,
the parent implies that both children are genetic, rendering the
distinction between them meaningless.

There are may cases where 'rare' and 'genetic' forms are not
linked. See:

![fpc](images/familial-prostate-cancer-orphanet.png)

This makes it difficult to use Orphanet the way a standard ontology
like GO is used to group data, in which the true path rule is
expected. It also poses complications when making a combined rare and
common disease ontology.

Despite these ontological issues, Orphanet has advantages, especially
in the deeper levels in which diseases are clustered into small groups
according to clinically relevant criteria.

However, various challenges remain, including the fact that we have
1675 OMIM IDs annotated with HPO terms for which there is no Orphanet
grouping.

## MGI DiseaseClusters

The MGI Disease Clusters (DC) ontology groups OMIM IDs into intuitive
categories. For example, all forms of Parkinsons in OMIM are grouped
under Parkinson's disease.

Currently we have 3255 Annotated OMIM IDs that lack a DC equivalent or
grouping.

We are currently extending DC to include more OMIM IDs.

Note that DC does not attempt to group its categories into higher bins
like 'nervous system disease'. It's bins may also be higher level than
Orphanet.

## DOID 

DO (ID space DOID) attempts to cover all areas of disease, from rare
genetic through common and infectious to cancer.

Currently we have 3726 Annotated OMIM IDs that lack a DOID equivalent
or grouping.

# Approach

Our broad approach is to combine the strengths of each scheme,
ensuring consistency and cohesivity and avoiding redundancy. We want
to include Orphanets specific classification of leaf annotated OMIM
IDs (and of the Orphanet leaf nodes we have HPO annotations to). We
want to fill in the gaps with DC (whilst making sure DC integrates
appropriately). Finally we want both the high level groups of DOID,
including groupings that are agnostic to rareness, also making use of
DOID to plug any gaps.

## MonDo Structure

In MonDo, OMIMs are always placed as leaf nodes. They may classify
under some mixture of DC, DOID and Orphanet, and these 3 hierarchies
are themselves intermingled in a way that should be inutitive.

### Examples

 * peru: OMIM
 * hotpink: MGI DCs
 * yellow: Orphanet
 * blue: DO

Note: the coloration reflects the source of the class. We need to show
the source of the edge. E.g. Even though many DC classes are merged
into DO classes, they make their contribution as trusted
OMIM->Grouping classes

#### Parkinson's Disease

![PD](images/mdo-doid-14330.png)

#### Alzheimers

![Alz](images/mdo-doid-10652.png)

#### Charcot Marie Tooth

![CMT](images/mdo-doid-10595.png)

Note: some classifications are too general, presumably because of non-inclusion of OMIM in Orphanet

#### Prostate Cancer

![PC](images/mdo-doid-10283.png)

Note that there are no Orphanet classes here - this is because the
class for familial PC is ditched in favor of the more generic PC, with
OMIMs directly under this. Compare this with the representation
directly in Orphanet above.

#### TODO

More!

# Methods

## Merging DC into DOID

We first merge DC clusters into DOID based on label matching. This
still leaves nnn DC IDs. Note also we keep the copy of OMIM in DC and
rewire to point to DOID as superclass when we make the replacement.

We refer to the resulting product here as DOID+DC.

## Rewiring ORDO

Repair of Orphanet is key to our strategy. Broadly speaking, we want
to eliminate Orphanet groupings where they either directly correspond
to existing DOID or DC concepts, or where they add no additional
value, or indeed where they differ trivially from other Orphanet
categories. For example, we would remove 'rare tumor' 'rare genetic
tumor' as they add no value to an existing disease classification
'cancer' in DOID. We choose DOID (or DC if no DOID exists) as prime
here, as these are more generally useful and less ontologically
problematic.

Our procedure is to take each class in ORDO, and to first categorize
it based on textual alignment with DOID+DC, where we tokenize labels
and synonyms and compare on sorted tokens. We try first on bare
tokens, and then on stemmed tokens. If a corresponding DOID+DC class
exists, we categorize this ORDO as being replaced by that
disease. Next we perform comparisons based on removing 'rare' and
'genetic', and again categorize as being replaced by if a match is
found. If no match is found in DOID+DC, we then compare between ORDOs,
and if the terms differ only in including 'rare' and 'genetic' we
categorize one as collapsing into another.

We then iterate through all ORDO classes. If it's categorized as being
replaced we skip it, otherwise we write it, rewiring
relationships. All ORDO part_ofs are rewired to SubClassOf. If the
target of the relationship is a replacement class in DOID+DC, we use
that instead.

We then iterate through DOID+DC and write any bridging axioms. If an
ORDO was merged into a DOID+DC we create an xref back to the ORDO.

We iterate through OMIMs writing SubClassOf axioms to any DOID+DC
parents, and any ORDO parents, 

Thew results are called new_ordo.obo

## Reduction and Compression

We then perform a transitive reduction, as the previous process can
leave redundant links.

We then attempt to compress any OMIM classes that appear identical to
their parents. These can arise because Orphanet is not specific as to
whether their xrefs are SubClassOf or EquivalentTo, so in the previous
step we assume SubClassOf for safety.

If an OMIM is the only child of its parent and the label matches, we
merge the parent into the OMIM (ie the OMIM ID is primary).

# Results

See images above

# TODO

What should we do about e.g. primary myoclonus? Should we create
diseases based on phenotype?

Need to axiomatize many classes.

# Conclusions

# OLD DOCS

Matching DO to OMIM via external sources

Note on viewing in GH: use scroll bar to see all cols

## Methods

Two methods are applied:

 * label/synonym matching (applying stemming and some pre-processing)
    * cols 1-4 terms A and B
    * col 5 if stemming was used to make the match
 * Jaccard similarity based on OMIM diseases grouped in common
    * cols 1-2 terms A and B

## OMIM Phenotypic Series

The purpose of this analysis is to determine how OMIM PS numbers align to DO

## OMIM Clusters

The purpose of this analysis is to determine how the MGI disease
clusters (id space 'DC') align to DOID, in order to determine which
new classes need to be added to DO.

 * [align-doid-to-omc.tsv](align-doid-to-omc.tsv) -- matching based on labels
 * [sim-omc.tsv](sim-omc.tsv) -- jaccard similarity of OMIMs in common

## OMIM Cluster + PS overlap

TODO
