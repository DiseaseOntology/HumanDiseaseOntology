SETTING UP
----------

### Editing environment

For software installation instructions, refer to [Install_DO_curation](https://docs.google.com/document/d/1vmrc-acwffQom9QrpOTm3ywvPyyBnMpNcBPKolwJT0o/) google doc.

For Protégé set up, refer to [Note-Protege_setup](https://docs.google.com/document/d/1q21gvQ5iDLzzINv52GJDW857z0AsqRHwMC08eBGqm-s/) google doc.

### Files to Edit

1. **src/ontology/doid-edit.owl**: This is the ONLY file in which DO disease terms should be edited.
2. **src/ontology/imports/*_terms.txt**: The set of `*_terms.txt` files control what terms are imported and are named by the ontology terms are imported from. These are the ONLY files that should be edited to change imported terms.


### ID range
Each curator's ID range is documented in the idranges file (src/ontology/doid-idranges.owl) and are also listed below.

The current ID ranges for the University of Maryland School of Medicine curation team include: 
 
 	DOID:$sequence(7,50000,50999)$  Lynn 
	DOID:$sequence(7,61000,61999)$  Luke
 	DOID:$sequence(7,70000,70999)$  Allen
 	DOID:$sequence(7,80000,85999)$  Lynn

Additional curation ID ranges assigned include:

 	DOID:0100000 (in reserve)
 	DOID:0110000 Sue (MGD)

_(Last updated 2026-07-30)_


GETTING STARTED -- Setting up a DO Git remote repository
---------------

### Create a local DO git repository 

1. Open the directory on your local machine where you would like to place the
`HumanDiseaseOntology` repository
2. In that directory, run the command: `git clone https://github.com/DiseaseOntology/HumanDiseaseOntology.git`

- To view the status of your git repository use `git status`
- To bring in new udpates to your local copy use `git pull origin` (optionally specifying the branch)

'git help -a' and 'git help -g' lists available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.

### Git command steps

Before working on DO file, run `git pull origin main`, while on the `main` branch locally to get updates from main branch of the repository on GitHub.

If adding a new file:

	`git add FILENAME`
	`git commit -m "MY_TEXT" FILENAME`      -- this a local commit

Before committing the updated or new file to the Master archive:

	`git pull`    -- get updates from master archive
	`git push origin main`   -- to commit the updated or new file to the main branch


Commit your changes

   `git commit -m "COMMIT MESSAGE" doid-edit.owl`

If you are fixing as issue in the tracker, always reference this with
a '#', e.g.

   git commit -m "Fixed definition of hirsutism. Fixes issue #3" doid-edit.owl


PROTEGE
------------------------

### Starting Protege

First, open Protege. Then, open the doid-edit.owl file from your local HumanDiseaseOntology repository. Alternatively, you may be able to double-click
the doid-edit.owl file (however, you will have to do this twice; the first time it opens Protégé and the second opens the actual file).

### Reasoning

Like most OBO ontologies, DO uses the Elk reasoner (https://github.com/liveontologies/elk-reasoner). Be sure this is selected in the Reasoner menu before starting the reasoner. If you are making changes, be sure to synchronize the reasoner afterward to update reasoning.

### A few words of caution about Protégé

Protégé 5.6 and higher are configured to automatically provide the correct IDs for any ontology, _IF_ they are properly defined in an accompanying `*-idranges.owl` file. This can set both the base IRI (e.g. `http://purl.obolibrary.org/obo/DOID_`) and the numbering scheme/range. If your user name matches one in the `*-idranges.owl` file, it will be used automatically. If not, you'll be given the option to choose an `*-idranges.owl` defined range. **DO curators should have a defined range and should not have to select one. _If your range is not automatically selected, please inform the repository manager._**

Protégé _should_ use the next available ID in your range and attempts to track previously added IDs. However, it can make mistakes (e.g. you add a term and then delete it during a session). _YOU MUST_ be aware and check if ever in doubt. Some tips to check to see where you are in your range: click the search symbol (top right) and then search for IDs within your range. 

If you are editing multiple ontologies, each _should_ configure properly on load. However, this can fail, particularly if more than one is open at the same time. _YOU MUST_ check when adding a term to be sure it is using the proper base IRI and number in your range.


-----------------

_The information below this line has not been updated in some time. Consider it with caution._

OBSOLETING
---------------

1. Find the class you wish to obsolete, and compare it with the class you wish to replace (or consider) it with. You need to check that both the text definition and the logical axioms have the same intent, and that nothing desired is lost in the obsolescence.

2. Copy any subClass axioms that you intend to keep for historical purposes (e.g. those that are not replicated on the target class) into a comment annotation property. If you do this, please ensure to add to any exisiting comments rather than adding a new COMMENT. There can be only one COMMENT in obo format. If there are equivalence axioms, you may wish to consult with an expert to make sure the axioms are retained properly in the file.

3. Go to the obsolescenc plugin by going to the edit menu and scroll to the bottom, to "Make Entity Obsolete". This will perform the following for you:
	Relabel the class as "obsolete your old term label here". 
	Add an annotation property, "deprecated", value "true", of type "boolean". 
	Delete subClassOf axioms
You should see the class crossed out after you do this. 

4. Add an annotation property "term replaced by". Navigate to the term by clicking on the "entity IRI" and either browse or control F to find the term that is replacing the one being obsoleted.

6. You may wish to add a comment regarding the reason for obsolescence or so as to include reference to why the term was replaced with whatever is indicated. Again, do not add more than one comment annotation on a class.


SAVING and COMMITTING
---------------

Save and commit regularly. Always describe the changes you have made
at a high level in the git commit messages. It is a good idea to type
"git diff" before committing (although the output can be hard to
decipher, it can sometimes show you egregious errors, sometimes Protege's fault).

**Important**: make sure you save in functional syntax, using the same
  prefixes as in the source file. This SHOULD be automatic (but Protege sometimes gets it wrong - one reason to do the diff).
  
**Important**: there is currently a bug in Protege that is being investigated (well, there are many, but this one concerns editing ext). If protege asks you to name your merged file when you save and gives you no other option, DON'T DO IT. Quit Protege and start over. You will lose your work - another reason to save and commit in small increments. 

Before adding your files to commit, make sure to test that you have not introduced any errors:
```
make report
```

Example session from view of command line:
```
git pull
  [open Protege, edit, save] 

make report
git diff doid-edit.owl
git commit -m "polished up skull" doid-edit.owl
git pull
git push
```

It is always a good idea to git pull immediately after an git
commit. If there are changes, Protege will ask you to reload. You may wish not to trust the reload and simply reopen Protege.




MIREOTING
---------
Sometimes you may wish to reference a class from another ontology in the context of editing DOID, and the term may not yet be mireoted. You can currently pull in a new term from GO, Uberon, Chebi, CL, PATO or PR. 

1. Identify the class to be included, and copy the URI (for example, look in Ontobee or open file in separate Protege instance and do control U to copy the URI). Note the superclass(es) of the class.

2. Whilst editing DOID, change the "Active Ontology" file in the top header to the import file that will house the new class, for example, uberon_import.owl

3. Add a new class under the appropriate superclass in the import file, change the URI by doing control U and pasting the URI as per above. Make sure to add the label as an annotation so that you can find the class later.

4. Save the file (note that you should save in RDF/XML with the "use XML entities" NOT checked in the Preferences/Save tab.

5. Do a Diff to make sure you are saving in the proper file format.

*6. Advanced editors with Owltools - run "make imports", for example, make imports/uberon_import.owl  in the CL ontology directory. This will pull in the closure and add the metadata.

CHECKLIST
---------

Always synchronize the reasoner before committing. Did your changes
introduce unsatisfiable classes? If so, investigate them.

For any classes you have created, are they in your ID range? Did you
add text definitions, adding provenance information? Is the reasoner finding unintended inferred equivalent classes? Subclasses? 

-----------
DO RELEASES
-----------
detailed notes: https://docs.google.com/document/d/1vDebWw9ykX4YtfrLY78v7PBOfmdTF_3Gf-tXWYslTb4/edit?usp=sharing

(1) DO's production file: doid-edit.owl
	this is the file where the DO team adds terms, edits the DO content
	
(2) DO release process:  [working in the DiseaseOntology/HumanDiseaseOntology/src/ontology  directory
	(2.1): Make the DO release (suite of doid files)
	 the "Make" file (in the src/ontology directory) 
	 
	 > git pull doid-edit.owl
	 > make release
	 	-- Input: doid-edit.owl
		-- Output: 	doid-metadata.txt
 				doid-non-classified-metadata.txt
				doid-non-classified.obo
				doid-non-classified.owl
				doid-potential-redundant-module.owl
				doid.simple-metadata.txt
				doid-simple.obo
				doid-simple.owl
				doid.obo
				doid.owl
				
				
				
	(2.2) 	QC: check date, presense of owl axioms in header
		 once complete: check releases directory to ensure that files were created
                 edit doid.obo and doid.owl files (as text files)
        -- check the release date at the top of the file 
	-- remove the 'import' line of text at the top of the file
	-- save the text file (in your local directory) 
	
	Editing releaes files:
	-- edit the doid-simple.obo and doid-simple.owl 
        -- edit doid-nonclassified.obo and .owl 
            --> this is equivalent to HumanDO.obo and HumanDO.owl
             -- once edited, save doid-nonclassified.obo as HumanDO.obo
				
	(2.3) Create additional files for collaborators
		MGI/RGD doid-merged.obo  

     FINISH: 
	> git add .
	> git commit -m 'DO release' .
	> git push 

        -- cp HumanDO.obo and commit to DO's SVN directory
        svn://svn.code.sf.net/p/diseaseontology/code/trunk/


RELEASE MANAGEMENT
------------------

The official purls for DO are

 * http://purl.obolibrary.org/obo/doid.owl
 * http://purl.obolibrary.org/obo/doid.obo

These redirect to the DO's GitHub repository /src/ontology   directory

Currently, the central OBO library build is built from DO GitHub repository
