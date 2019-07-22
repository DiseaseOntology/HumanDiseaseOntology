SETTING UP
----------

## Editing environment

1. Install Protege 4.3 or higher
2. Get the Elk plugin
3. Install any required plugins from: http://wiki.geneontology.org/index.php/Ontology_editor_plugins

**DO Files**  

1. production file, actively edited: doid-edit.owl
2. production GitHub file: produced after editing: doid.owl and doid.obo
3. production SVN file: HumanDO.obo [this file is a copy of the current doid.obo file]


**ID range**: documented in the idranges file (doid-idranges.owl), 
in the HumanDiseaseOntology/src/ontology/ directory)

The current (2015) ID ranges include 
 for the University of Maryland Baltimore curation team: 
 
 	DOID:$sequence(7,50000,50999)$  Lynn 
 	DOID:$sequence(7,60000,60999)$  James
 	DOID:$sequence(7,70000,70999)$  Melody
 	DOID:$sequence(7,80000,80999)$  Lynn
 	
 	DOID:0100000 (in reserve)
 	DOID:0110000 Sue (MGD)


GETTING STARTED -- Setting up a DO Git remote repository
---------------

Create a local DO git repository: 

1. create a local directory: HumanDiseaseOntology_git
2. [in that directory]: run the command: create git directory
     by the command: git init 
3. clone the HumanDiseaseOntology git repository: 
    by the command: git clone https://github.com/DiseaseOntology/HumanDiseaseOntology.git

4. to view the status of your git repository: 
   git status
5. to bring in new udpates to your git repository: 
   git pull https://github.com/DiseaseOntology/HumanDiseaseOntology.git


'git help -a' and 'git help -g' lists available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.

# Git command steps: 
Before working on DO file:
git pull    -- get updates from master archive

if adding a new file:

	git add FILENAME
	git commit -m "MY_TEXT" FILENAME      -- this a local commit

Before committing the updated or new file to the Master archive:

	git pull    -- get updates from master archive
	git push origin master   -- to commit the updated or new file to the master archive


Commit your changes

   git commit -m "COMMIT MESSAGE" doid-edit.owl

If you are fixing as issue in the tracker, always reference this with
a '#'. E.g.

   git commit -m "Fixed definition of hirsutism. Fixes issue #3" doid-edit.owl


PROTEGE
------------------------

Install Protege 4.3 (or higher version, if not in beta) and OBO-Edit Tools for Ontology Development 
Download and install the latest version of Protege and OBO-Edit (2.3.1) for ontology development.
http://protege.stanford.edu/products.php#desktop-protege
https://sourceforge.net/projects/geneontology/files/OBO-Edit 2.3.1


**Protege Configuration**

Ensure that you have Protege configured to generate new URIs in your
own range. Note that if you edit multiple files, you need to check this every time to ensure that the proper settings are in place. DOID URIs should look like this:
http://purl.obolibrary.org/obo/DOID_0000473
Do a test to ensure that the ID generator is working properly.

A word of caution about protege auto-id functionality. 
Protege will allow reuse of a URI in your range according to the numbering scheme. It will keep track of what you did during last session, but *does not check* for use of the URI before assigning it. Therefore, if you added any IDs in your range prior to the switch to OWL, protege will not know not to start from the beginning. 
Some tips to check to see where you are in your range: Go to the view menu, click "render by name (rdf:id)", and then use the search box to search for things starting within your range. 
If you have IDs in your range already, you may wish to set Protege at the next unused ID in your range rather than the beginning of the range. It should then remember it for next time, though you should double check.

Setting up ID ranges in Protege: http://obofoundry.github.io/docs/SettingUpProtege.html

You now want to set up Protege so that future entities you create are, by default, following the ID policy (and also auto incrementing their ID). To do so, go to "Protege > Preferences > New entities" 

**Plugins**: 

Obsolescence Plugin: 
Get Jim's awesome obsolescence plugin here:
https://github.com/balhoff/obo-actions/downloads

To add plugins to Protege, 
navigate to the application, open the application contents, 
navigate to contents/Resources/Java/plugins 
and put the jar file in there. 
Your plugin should be installed next time you start protege.

Elk Plugin: 
Get Elk here:
http://code.google.com/p/elk-reasoner/downloads/list
perform same operation as above to install.
## Editing DO in OWL 

**Starting Protege**
	1. Open Protege
	2. Open the doid-edit.owl file from your local HumanDiseaseOntology repository
	3. If prompted, updated imports [from your local repository files]

Then, open the file doid-edit.owl in Protege

Switch on the Elk reasoner (see how to get plugins above). If you are making changes, be sure to synchronize the reasoner.




OBSOLETING
---------------

1. Find the  class you wish to obsolete, and compare it with the class you wish to replace (or consider) it with. You need to check that both the text definition and the logical axioms have the same intent, and that nothing desired is lost in the obsolescence.

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

**Important: make sure you save in functional syntax, using the same
  prefixes as in the source file. This SHOULD be automatic (but Protege sometimes gets it wrong - one reason to do the diff).
  
**Important: there is currently a bug in Protege that is being investigated (well, there are many, but this one concerns editing ext). If protege asks you to name your merged file when you save and gives you no other option, DON'T DO IT. Quit Protege and start over. You will lose your work - another reason to save and commit in small increments. 

Example session from view of command line:

  git pull
  [open Protege, edit, save] 

  git diff doid-edit.owl
  git commit -m "polished up skull" doid-edit.owl
  git pull
  git push

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
