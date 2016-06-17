:- use_module(bio(ontol_db)). 
:- use_module(bio(ontol_writer)). 
:- use_module(bio(ontol_writer_obo)). 
:- use_module(bio(metadata_nlp)). 
:- use_module(bio(metadata_db)). 
:- use_module(bio(index_util)).
:- use_module(bio(bioprolog_util)).
:- use_module(library(porter_stem)).

% Convenience predicate
entity_xref_from(Grp,D,S) :-
        entity_xref(Grp,D),
        id_idspace(Grp,S).

% Convenience predicate
entity_xref_from_to(Grp,D,S,S2) :-
        entity_xref_idspace(Grp,D,S2),
        id_idspace(Grp,S).

%% d2group(+Disease,?Grp,?Scheme)
%
% Map a disease D (e.g. OMIM) to a disease grouping (e.g. DC ID) based
% on some scheme (e.g. dc)
d2group(D,Grp,dc) :-
        subclass(D,Grp),
        id_idspace(Grp,'DC'),
        Grp \= 'DC:0000138'.
d2group(D,Grp,ordo) :-
        entity_xref_from(Grp,D,'Orphanet').
d2group(D,Grp,ps) :-
        subclass(D,Grp),
        atom_concat('OMIM:PS',_,Grp).
d2group(D,Grp,doid) :-
        entity_xref_from(Grp,D,'DOID').
d2group(D,Grp,efo) :-
        entity_xref_from(Grp,D,'EFO').

d2groups(D,L,GN) :-
        solutions(Grp,d2group(D,Grp,GN),L).


% Disease that has been annotated
d(D) :-
        setof(D,P^d2p(D,P),Ds),
        member(D,Ds).

% Grouping
g(G) :-
        setof(G,D^N^d2group(D,G,N),Gs),
        member(G,Gs).


s(D,G1,G2,G3,G4,G5) :-
        d(D),
        d2groups(D,G1,dc),
        d2groups(D,G2,ordo),
        d2groups(D,G3,ps),
        d2groups(D,G4,doid),
        d2groups(D,G5,efo).

gn(dc).
gn(ordo).
gn(ps).
gn(doid).
gn(efo).

missing(D,GN) :-
        gn(GN),
        d2groups(D,[],GN).

/*
infer_prefix(DC,Prefix) :-
        subclass(D1,DC),
        subclass(D2,DC),
        D1\=D2,
        class_name_stem(D1,D2N),
        class_name_stem(D2,D2N),
        atom_concat(
*/

dcroot('DC:0000138').


%new_omim_cluster(MIM,DC) :-
%        new_omim_cluster(MIM,DC,_).

new_omim_cluster(MIM,DC) :-
        infer_omim_cluster(MIM,DC),
        dcroot(Root),
        subclass(MIM,Root).

conflict_omim_cluster(MIM,DC) :-
        infer_omim_cluster(MIM,DC),
        subclass(MIM,DC2),
        \+ subclassRT(DC2,DC),
        \+ dcroot(DC2).


infer_omim_cluster(MIM,DC) :-
        infer_omim_cluster(MIM,DC,_).
infer_omim_cluster(MIM,DC,Suffix) :-
        class_name_stem(DC,DCN),
        id_idspace(DC,'DC'),
        class_name_stem(MIM,N),
        atom_concat(DCN,Suffix,N),
        Suffix\=''.


class_name_stem(C,N) :-
        class(C,N1),
        porter_stem(N1,N).


omim2ordo_via_doid(Mim,Ordo) :-
        entity_xref_idspace(D,Mim,'OMIM'),
        entity_xref_idspace(D,Ordo,'Orphanet'),
        id_idspace(D,'DOID').

omim2ordo_inc(Mim,Ordo,not_in_ordo) :-
        omim2ordo_via_doid(Mim,Ordo),
        \+ entity_xref(Ordo,Mim).
omim2ordo_inc(Mim,Ordo,not_in_doid) :-
        entity_xref_from_to(Ordo,Mim,'Orphanet','OMIM'),
        % Mim ID should be in doid
        entity_xref_from_to(_,Mim,'DOID','OMIM'),
        \+ omim2ordo_via_doid(Mim,Ordo).

        

        

nonreciprocal(T1,T2,S1,S2) :-
        nonreciprocal1(T1,T2,S1,S2).
nonreciprocal(T1,T2,S1,S2) :-
        nonreciprocal1(T1,T2,S2,S1).

nonreciprocal1(T1,T2,S1,S2) :-
        entity_xref_from_to(T1,T2,S1,S2),
        \+ entity_xref_from_to(T2,T1,S2,S1).

ix :-
        materialize_index(hallmark(+,+)),
        materialize_index(corpus(+)),
        materialize_index(pfreq(+,+)).

corpus(Num) :-
        setof(D,P^hallmark(D,P),Ds),
        length(Ds,Num).


pfreq(P,Freq) :-
        class(P),
        solutions(D,hallmark(D,P),DsWith),
        length(DsWith,NumWith),
        corpus(Num),
        Freq is NumWith / Num.
        
        
/*

  note: actual hallmarks don't work well; e.g. many do not have this described

  hyperparathyroidism
  http://www.monarchinitiative.org/disease/OMIM_145000

  However, hyperparathyroidism *is* described as a hallmark for others
  http://www.monarchinitiative.org/phenotype/HP:0000843

  
  
  */

hallmark(G,D,P) :-
        d2group(D,G,_),
        hallmark(D,P).

hallmark(D,P) :-
        %dpfreq(D,P1,hallmark),
        dpfreq(D,P1,_),
        parentRT(P1,P).





group_phenotype_number(G,P,Num) :-
        g(G),
        setof(D,hallmark(G,D,P),Ds),
        length(Ds,Num).
group_phenotype_number(G,P,Num,Freq,BgFreq,Score) :-
        g(G),
        setof(D,hallmark(G,D,P),DsWithP),
        P \= 'HP:0000001',
        P \= 'HP:0000118',
        length(DsWithP,NumWith),
        g2diseases(G,Ds),
        length(Ds,Num),
        Freq is NumWith/Num,
        pfreq(P,BgFreq),
        BgFreq < 0.02,
        Freq > 0.6,
        Score is (Num * Freq) / BgFreq.

ordo_group_phenotype_number(G,P,Num,F,BF,S) :-
        group_phenotype_number(G,P,Num,F,BF,S),
        \+ \+ subclassT(G,'Orphanet:377794').  % group of disorders

proper_d2group(D,G) :-
        d2group(D,G,_),
        \+ \+ hallmark(D,_).

% must have at least one annot
g2diseases(G,Ds) :-
        setof(D,proper_d2group(D,G),Ds).

        
%% ORDO

is_group_of_disorders(G) :-
        call_unique(subclassT(G,'Orphanet:377794')). % group of disorders


ignore('phenome').
ignore('biological anomaly').
ignore('morphological anomaly').
ignore('clinical syndrome').
ignore('malformation syndrome').
ignore('gene').
ignore('inheritance').
ignore('age of onset').
ignore('clinical subtype').
ignore('etiological subtype').
ignore('histopathological subtype').
ignore('particular clinical situation in a disease or syndrome').

is_ignore(X) :- ignore(X),!.
is_ignore(X) :- class(X,XN),ignore(XN),!.

dmatch(Grp,D,IsStemmed) :-
        entity_pair_label_reciprocal_best_intermatch(Grp,D,IsStemmed),
        D\=is_a,
        Grp\=is_a,
        \+ id_idspace(D,'OMIM').

ordo2do('Orphanet:377788','DOID:4') :- !.  % disease
ordo2do('Orphanet:377794','DOID:4') :- !.  % group -> disease

ordo2do(Grp,D) :-
        setof(D,dmatch(Grp,D,false),Ds),
        !,
        nr_member(D,Ds).
ordo2do(Grp,D) :-
        setof(D,dmatch(Grp,D,true),Ds),
        !,
        nr_member(D,Ds).
ordo2do(Grp,D) :-
        solutions(D,(entity_pair_label_intermatch(Grp,D,_,_,_),\+id_idspace(D,'OMIM')),Ds),
        !,
        nr_member(D,Ds).

nr_member(D,Ds) :-
        member(D,Ds),
        \+ ((member(Z,Ds),
             Z\=D,
             subclassT(Z,Ds))).

% check any with HPOA annotations that ARE groups
ordo_category(X,check,hpoa) :-
        is_group_of_disorders(X),
        \+ \+ dpfreq(X,_,_),
        !.

% preserve if has HPO annotations and not a group
ordo_category(X,preserve,hpoa) :-
        \+ is_group_of_disorders(X),
        \+ \+ dpfreq(X,_,_),
        !.

% try and map as many Groups to DOID or DC as possible
ordo_category(X,map_to_disease,Ds) :-
        is_group_of_disorders(X),
        setof(D,ordo2do(X,D),Ds),
        !.

% DUMB CODE
%  does exactly the same as the above;
%  sometimes clinical subtypes (e.g. Acquired angioedema type 1, Orphanet:100056)
%  are subclasses of disease-level (e.g. Orphanet:91385 ! Acquired angioedema) which map to a single OMIM
%  e.g. OMIM:300909 ! Angioedema Induced by Ace Inhibitors, Susceptibility to;
%  here the OMIM is truly a subclass
ordo_category(X,map_to_disease,Ds) :-
        \+ is_group_of_disorders(X),
        setof(D,ordo2do(X,D),Ds),
        !.


% Map OMIM leaf nodes
ordo_category(X,map_to_omim,[M]) :-
        \+ is_group_of_disorders(X),
        setof(M,entity_xref_idspace(X,M,'OMIM'),[M]),
        !.


% dodgy
ordo_category(X,multi_map_to_omim,Ms) :-
        \+ is_group_of_disorders(X),
        setof(M,entity_xref_idspace(X,M,'OMIM'),Ms),
        !.

% ordo is weird...
ordo_category(X,map_ordo,[M]) :-
        is_group_of_disorders(X),
        d_toks(X,Toks),
        select(genetic,Toks,Rest),
        class(M),
        id_idspace(M,'Orphanet'),
        d_toks(M,Rest),
        !.
% this one never used?
ordo_category(X,map_ordo2,[M]) :-
        is_group_of_disorders(X),
        d_toks(X,Toks),
        select(rare,Toks,Rest),
        class(M),
        id_idspace(M,'Orphanet'),
        d_toks(M,Rest),
        !.
% rare X -> genetic X (arbitrary)
ordo_category(X,map_ordo3,[M]) :-
        is_group_of_disorders(X),
        d_toks(X,Toks),
        select(rare,Toks,Rest),
        class(M),
        id_idspace(M,'Orphanet'),
        d_toks(M,Toks2),
        select(genetic,Toks2,Rest),
        !.

ordo_category(X,ignore,null) :- is_ignore(X),!.
ordo_category(_,unknown,null) :- !.

d_toks(X,Toks) :-
        class(X,N),
        concat_atom(L,' ',N),
        maplist(downcase_atom,L,L2),
        sort(L2,Toks).


% TODO: genes follow this path too
%is_phenome(C) :-
%        parentRT(C,'Orphanet:C001').
is_phenome(C) :-
        subclassRT(C,'Orphanet:C001'),
        !.
is_phenome(C) :-
        parentRT(C,part_of,'Orphanet:C001'),
        !.

orphaleaf_orpharoot(D,AN) :-
        id_idspace(D,'Orphanet'),
        c_orpharoot(D,A),
        class(A,AN1),
        concat_atom(L,' ',AN1),
        concat_atom(L,'_',AN).

c_orpharoot(D,A) :-
        subclassT(D,A),
        orpharoot(A),
        !.

orpharoot(A) :- subclass(A,'Orphanet:C001'), !.
orpharoot(A) :- \+ subclass(A,_),A\='Orphanet:C001', !.

write_header :-
        format('ontology: upheno/doid/mondo~n'),
        solutions(X,(class(D),
                     id_idspace(D,'Orphanet'),
                     orphaleaf_orpharoot(D,X)),
                  Xs),
        forall(member(X,Xs),
               format('subsetdef: ~w "~w"~n',[X,X])),
        nl.

all_ordo_category(X,C,W) :-
        class(X),
        id_idspace(X,'Orphanet'),
        is_phenome(X),
        ordo_category(X,C,W).

keep(X) :- ordo_category(X,preserve,_),!.
keep(X) :- ordo_category(X,multi_map_to_omim,_),!.
keep(X) :- ordo_category(X,map_to_omim,_),!.    % see notes above; 

write_all_mdo :-
        write_header,
        write_all_ordo,
        write_all_non_ordo.
write_all_ordo :-
        class(X),
        id_idspace(X,'Orphanet'),        
        is_phenome(X),
        write_ordo(X),
        fail.
write_all_ordo.
write_all_non_ordo :-
        all_ordo_category(X,C,Ds),
        member(D,Ds),
        write_non_ordo(D,C,X),
        fail.
write_all_non_ordo :-
        class(M),
        id_idspace(M,'OMIM'),
        write_omim(M),
        fail.
write_all_non_ordo.        

% e.g. write DOID stanzas with ORDO as xref
write_non_ordo(X,map_to_disease,Y) :-
        class2n(Y,YN),
        class2n(X,XN),
        format('! ORDO term disappears, using DOID+DC as replacement~n'),
        format('[Term]~n'),
        format('id: ~w ! ~w~n',[X,XN]),
        format('xref: ~w ! ~w~n',[Y,YN]),
        nl.

/*
        % rewire OMIMs
        forall(entity_xref_idspace(Y,M,'OMIM'),
               (
                class2n(M,MN),
                format('! Rewiring an OMIM~n'),
                format('[Term]~n'),
                format('id: ~w ! ~w~n',[M,MN]),
                format('is_a: ~w ! ~w~n',[X,XN]),
                nl)).
*/

% for each OMIM ID, write a bridge axiom
% connecting to its parent, where the parent is
% solely determined by xrefs; these may come
% from DOID or from ORDO
write_omim(M) :-
        forall(entity_xref_idspace(D,M,'OMIM'),
               write_omim(M,D)).

write_omim(M,D) :-
        id_idspace(D,'Orphanet'),
        ordo_category(D,map_to_disease,DGs),
        !,
        forall(member(DG,DGs),
               (   
                   class2n(M,MN),
                   class2n(DG,DGN),
                   format('! Rewiring an OMIM from ~w~n',[D]),
                   format('[Term]~n'),
                   format('id: ~w ! ~w~n',[M,MN]),
                   format('is_a: ~w ! ~w~n',[DG,DGN]),
                   nl
               )).
write_omim(M,D) :-
        \+ is_a_gene(D),
        !,
        class2n(M,MN),
        class2n(D,DN),
        format('! Making OMIM isa from xref~n',[D]),
        format('[Term]~n'),
        format('id: ~w ! ~w~n',[M,MN]),
        format('is_a: DOID:630 ! genetic disease~n'),
        format('is_a: ~w ! ~w~n',[D,DN]),
        nl.


is_a_gene(G) :- subclassRT(G,'Orphanet:C010'), !.
        
foo('0').

omim_gene(M) :-
        class(M),
        entity_xref(D,M),
        is_a_gene(D).


        

              /*
write_non_ordo(X,map_to_omim,Y) :-
        class2n(Y,YN),
        class2n(X,XN),
        format('! map to omim~n'),
        format('[Term]~n'),
        format('id: ~w ! ~w~n',[X,XN]),
        (   \+parent(_,Y)
        ->  format('xref: ~w ! ~w~n',[Y,YN])
        ;   format('is_a: ~w ! ~w~n',[Y,YN])),
        nl.

write_non_ordo(X,multi_map_to_omim,Y) :-
        class2n(Y,YN),
        class2n(X,XN),
        format('! multi-map to omim~n'),
        format('[Term]~n'),
        format('id: ~w ! ~w~n',[X,XN]),
        format('is_a: ~w ! ~w~n',[Y,YN]),
        nl.
*/


keep(preserve).
keep(multi_map_to_omim).
keep(map_to_omim).
keep(unknown).

write_ordo(X) :-
        subclassRT(X,'ObsoleteClass'),
        !,
        class2n(X,XN),
        format('[Term]~n'),
        format('id: ~w~n',[X]),
        format('name: obsolete ~w~n',[XN]),
        format('is_obsolete: true~n'),
        nl.

write_ordo(X) :-
        ordo_category(X,Cat,With),
        keep(Cat),
        class2n(X,XN),
        !,
        format('! ~w -> ~w~n',[Cat,With]),
        format('[Term]~n'),
        format('id: ~w~n',[X]),
        format('name: ~w~n',[XN]),
        forall(orphaleaf_orpharoot(X,Y),
               format('subset: ~w~n',[Y])),
        forall(def(X,Y),
               format('def: "~w" [~w]~n',[Y,X])),
        forall(entity_synonym_scope(X,Syn,Scope),
               format('synonym: "~w" ~w []~n',[Syn,Scope])),
        forall(entity_xref(X,Y),
               format('xref: ~w~n',[Y])),
        forall(parent(X,R,Y),
               write_parent(R,Y)),
        nl.

write_parent(subclass,Y) :- write_parent(Y).
write_parent(part_of,Y) :- write_parent(Y).
write_parent(R,Y) :- format('! Ignoring ~w ~w~n',[R,Y]).

write_parent(Y) :- is_ignore(Y),!.
write_parent(Y) :-
        ordo_category(Y,Cat,_),
        keep(Cat),
        class2n(Y,YN),
        !,
        format('is_a: ~w ! ~w~n',[Y,YN]).
write_parent(Y) :-
        ordo_category(Y,map_to_disease,Ds),
        !,
        forall(member(D,Ds),
               (   class2n(D,DN),
                   format('is_a: ~w ! ~w~n',[D,DN]))).
write_parent(Y) :-
        ordo_category(Y,C,Ds),
        (   C=map_ordo
        ;   C=map_ordo2
        ;   C=map_ordo3),
        !,
        member(D,Ds),
        forall(member(D,Ds),
               write_parent(D)).
write_parent(Y) :-
        format('! UH OH: ~w~n',[Y]),
        !.


class2n(C,N) :-
        class(C,N),
        !.
class2n(C,C).


        
/*        
write_ordo(X) :-
        ordo_category(X,map_to_omim,_),
        !.
write_ordo(X) :-
        format('! Leaving as-is~n'),
        write_class(obo,X),
        !.
*/
       

/*
ordo_parent(X,R,Z) :-
        parent(X,R,Y),
        ordo_category(Y,map_to_disease,Z).
ordo_parent(_,R,Y) :-
        ordo_category(Y,map_to_disease,Z).
*/

subclass_in(M,P,S) :-
        subclass(M,P),
        P\='DOID:4',
        P\='DOID:630',
        id_idspace(P,S).

foo('0').

not_group_of_disorders(D) :-
        \+ entity_partition(D,group_of_disorders),
        !.

not_has_disease_children(P) :-
        \+ has_disease_children(P),
        !.
has_disease_children(P) :-
        subclass(Z,P),
        \+ id_idspace(Z,'OMIM'),
        \+ is_sub_disease_type(Z),
        !.



% Equivalencies between OMIMs and parent diseases
write_equiv_for_omim(M):-
        id_idspace(M,'OMIM'),
        
        % P must be only parent of M in S
        setof(P1,subclass_in(M,P1,_S),[P]),

        % ...and M must be only child of P
        setof(Z,(subclass(Z,P),id_idspace(Z,'OMIM')),[M]),

        % never merge into a grouping
        not_group_of_disorders(P),
        
        % never merge into a class that has non-subtype children
        not_has_disease_children(P),
        
        %\+ restriction(_,_,P),  % never merge into group-of-disorders
        % labels must match
        \+ \+ ((entity_pair_label_intermatch(M,P,_,_,_))),
        class2n(M,MN),
        class2n(P,PN),
        format('[Term]~n'),
        format('id: ~w ! ~w~n',[M,MN]),
        format('equivalent_to: ~w ! ~w~n',[P,PN]),
        nl.
write_equiv_omims :-
        class(M),
        write_equiv_for_omim(M),
        fail.
write_equiv_omims.

is_sub_disease_type(X) :- entity_partition(X,etiological_subtype).
is_sub_disease_type(X) :- entity_partition(X,clinical_subtype).
is_sub_disease_type(X) :- entity_partition(X,histopathological_subtype).

/*
% DEPREC:
% push OMIMs up a level        
merge_equiv_omims :-
        class(M),
        id_idspace(M,'OMIM'),
        setof(P,subclass(M,P),[P]),    % P must be only parent of M...
        setof(Z,subclass(Z,P),[M]),    % ...and M must be only child of P
        \+ is_group_of_disorders(P),
        %\+ restriction(_,_,P),  % never merge into group-of-disorders
        % labels must match
        \+ \+ entity_pair_label_intermatch(M,P,_,_,_),
        debug(merge,'Merging ~w -> ~w',[P,M]),
        %merge_class(P,M,[use_xrefs(true),add_provenance(true)]),
        merge_into(P,M,[use_xrefs(true),add_provenance(true)]),
        fail.
merge_equiv_omims.


% e.g. DOID/ORDO->OMIM
% we assume OMIM is only child of DOID;
% remove all trace of DOID ID, but keep its superclass
merge_into(D,M,Opts) :-
        merge_class_axiom(subclass(D,P),subclass(M,P),Opts),
        merge_class_axiom(entity_synonym_scope(D,X,Sc),entity_synonym_scope(M,X,Sc),Opts),
        (   \+ def(M,_)
	->  merge_class_axiom(def(D,X),def(M,X),Opts),
	    merge_class_axiom(def_xref(D,X),def_xref(M,X),Opts)
        ;   true), % keep existing def
        retractall(class(D)).
*/

valid_entity_xref(C,X) :-
        entity_xref(C,X),
        \+ entity_obsolete(C,_).

write_all_mesh :-
        write_mesh(_),
        fail.
write_all_mesh.

%mesh_map(MeshId,NewId) :-
%        entity_xref_from_to(D,MeshId,'DOID','MESH').


write_mesh(D) :-
        class(D),
        id_idspace(D,'MESH'),
        write_mesh1(D).

% CASE 1: no xref
% write a MESH stanza and wire it up to the nearest equivalent disease
write_mesh1(D) :-
        \+ valid_entity_xref(_,D),
        class(D,DN),
        format('[Term]~n'),
        format('id: ~w~n',[D]),
        format('name: ~w~n',[DN]),
        % rewire to DOID if there is an equivalent;
        % note: may then be necessary to rewire again if DOID is replaced 
        forall(subclass(D,P),
               (   entity_xref_from_to(PX,P,'DOID','MESH')
               ->  class2n(PX,PN),
                   format('is_a: ~w ! ~w~n',[PX,PN])
               ;   class2n(P,PN),
                   format('is_a: ~w ! ~w~n',[P,PN]))),
        nl.




% CASE 2: exactly 1 xref
% Equivalence
write_mesh1(D) :-
        setof(G,entity_xref_nr(G,D),[G]),
        class2n(D,DN),
        class2n(G,GN),
        format('[Term]~n'),
        format('id: ~w~n',[D]),
        format('name: ~w~n',[DN]),
        format('equivalent_to: ~w ! ~w~n',[G,GN]),
        nl.

% CASE 3: > 1 xref
% Write a MESH stanza and make 
write_mesh1(D) :-
        setof(G,entity_xref_nr(G,D),Gs),
        Gs=[_,_|_],
        class2n(D,DN),
        format('[Term]~n'),
        format('id: ~w~n',[D]),
        format('name: ~w~n',[DN]),
        forall(member(G,Gs),
               (   class2n(G,GN),
                   format('is_a: ~w ! ~w~n',[G,GN]))),
        nl.

        
%% entity_xref_nr(?D,+X)
%
% checks valid form only
entity_xref_nr(D,X) :-
        valid_entity_xref(D,X),
        \+ ((entity_xref(D2,X),
             subclassT(D2,D))).

% E.g. DC (Child) to a DOID (Parent)
inferred_subclass(C,P,From,To,LC,LP) :-
        class(P),
        id_idspace(P,To),
        entity_nlabel_scope_stemmed(P,LP,_,_),
        atom_length(LP,Len),
        Len > 7,
        P\='DOID:225', % syndrome
        P\='DOID:4',   % disease
        P\='DOID:630', % genetic disease
        class(C),
        id_idspace(C,From),
        \+ ((subclass(C,Z),
             Z \= 'DOID:4')),
        From\=To,
        entity_nlabel_scope_stemmed(C,LC,_,_),
        sub_atom(LC,_,_,_,LP).


        
        
