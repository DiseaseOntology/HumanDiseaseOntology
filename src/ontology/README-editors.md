SETTING UP
----------

## Editing environment

1. Install Protege 4.3 or higher
2. Get the Elk plugin
3. Install any required plugins from: http://wiki.geneontology.org/index.php/Ontology_editor_plugins



PRE-EDIT CHECKLIST
------------------

Do you have an ID range in the idranges file (doid-idranges.owl), 
in the HumanDiseaseOntology/src/ontology/ directory)? 
The current (2015) ID ranges include 
 for the University of Maryland Baltimore curation team: 
   DOID:$sequence(7,50000,50999)$  Lynn
   DOID:$sequence(7,60000,60999)$  Elvira
   DOID:$sequence(7,70000,70999)$  in reserve (UMB)
   DOID:$sequence(7,80000,80999)$  Lynn


Ensure that you have Protege configured to generate new URIs in your
own range. Note that if you edit multiple files, you need to check this every time to ensure that the proper settings are in place. DOID URIs should look like this:
http://purl.obolibrary.org/obo/DOID_0000473
Do a test to ensure that the ID generator is working properly.

A word of caution about protege auto-id functionality. 
Protege will allow reuse of a URI in your range according to the numbering scheme. It will keep track of what you did during last session, but *does not check* for use of the URI before assigning it. Therefore, if you added any IDs in your range prior to the switch to OWL, protege will not know not to start from the beginning. 
Some tips to check to see where you are in your range: Go to the view menu, click "render by label (rdf:id)", and then use the search box to search for things starting within your range. 
If you have IDs in your range already, you may wish to set Protege at the next unused ID in your range rather than the beginning of the range. It should then remember it for next time, though you should double check.

Creating new classes in DO.

Plugins: 

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

Setting up: Obtain the Disease Ontology from git (one time only):


GETTING STARTED
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

The most commonly used git commands are:
   add        Add file contents to the index
   bisect     Find by binary search the change that introduced a bug
   branch       List, create, or delete branches
   checkout   Checkout a branch or paths to the working tree
   clone         Clone a repository into a new directory
   commit     Record changes to the repository
   diff            Show changes between commits, commit and working tree, etc
   fetch         Download objects and refs from another repository
   grep         Print lines matching a pattern
   init           Create an empty Git repository or reinitialize an existing one
   log           Show commit logs
   merge     Join two or more development histories together
   mv          Move or rename a file, a directory, or a symlink
   pull         Fetch from and merge with another repository or a local branch
   push       Update remote refs along with associated objects
   rebase    Forward-port local commits to the updated upstream head
   reset       Reset current HEAD to the specified state
   rm          Remove files from the working tree and from the index
   show      Show various types of objects
   status     Show the working tree status
   tag         Create, list, delete or verify a tag object signed with GPG

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
git push   -- to commit the updated or new file to the master archive





## Editing DO in OWL 

Then, open the file doid-edit.owl in Protege

Switch on the Elk reasoner (see how to get plugins above). If you are making changes, be sure to synchronize the reasoner.

Edit the ontology in protege:
 * Find parent term in Protégé by searching (at top of screen)
 * Double check that term is not already there
 * Add subclass
 * Add label (URI should be auto-generated)
 * Under annotations, add definition, click OK
 * Annotation on definition (see below)
 * database_cross_reference
 * GOC:initials
 * Under annotations, add synonyms, if necessary (has_exact_synonym, etc)

Save

**do not edit any other files!!!**

Commit your changes

   git commit -m "COMMIT MESSAGE" doid-edit.owl

If you are fixing as issue in the tracker, always reference this with
a '#'. E.g.

   git commit -m "Fixed definition of hirsutism. Fixes issue #3" doid-edit.owl

Note: if you prefer a GUI contact us for instructions about using Tower.

OBSOLETING
---------------

1. Find the  class you wish to obsolete, and compare it with the class you wish to replace (or consider) it with. You need to check that both the text definition and the logical axioms have the same intent, and that nothing desired is lost in the obsolescence.

2. Copy any subClass axioms that you intend to keep for historical purposes (e.g. those that are not replicated on the target class) into a comment annotation property. If you do this, please ensure to add to any exisiting comments rather than adding a new COMMENT. There can be only one COMMENT in obo format and Jenkins will throw an error. If there are equivalence axioms, you may wish to consult with an expert to make sure the axioms are retained properly in the file.

3. Go to the obsolescenc plugin by going to the edit menu and scroll to the bottom, to "Make Entity Obsolete". This will perform the following for you:
	Relabel the class as "obsolete your old term label here". 
	Add an annotation property, "deprecated", value "true", of type "boolean". 
	Delete subClassOf axioms
You should see the class crossed out after you do this. 

4. Add an annotation property "term replaced by". Navigate to the term by clicking on the "entity IRI" and either browse or control F to find the term that is replacing the one being obsoleted.

6. You may wish to add a comment regarding the reason for obsolescence or so as to include reference to why the term was replaced with whatever is indicated. Again, do not add more than one comment annotation on a class.

SEARCHING BY URI
----------------
To view IDs instead of labels:
View -> Render by name (rdf: id)
search for ID
View -> Render by label
click on parent in description
click back button to get back to your term
(stupid, eh?)

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
  # [open in protege]
  # [edit in Protege]
  # [save in Protege]
  # ...
  # [edit in Protege]
  # [save in Protege]
  git diff doid-edit.owl
  git commit -m "polished up skull" doid-edit.owl
  git pull
  git push

It is always a good idea to git pull immediately after an git
commit. If there are changes, Protege will ask you to reload. You may wish not to trust the reload and simply reopen Protege.

After an git push, Jenkins will check your changes to make sure they
conform to guidelines and do not introduce any inconsistencies - an
email will be sent to the curators list.

You can check on the build here:
  http://build.berkeleybop.org/job/build-doid/
  
Check for errors in the report, send an email to curators if you cannot determine what the error is.

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

Check the jenkins report after your commits. This should alert you to
any of the following:

 * consistency problems with anatomy ontologies
 * consistency problems with other ontologies
 * violation of obo-format (e.g. two labels for a class; two text
   definitions; etc)

CONTINUOUS INTEGRATION
----------------------

See:
http://build.berkeleybop.org/job/build-doid/

This is triggered on commits to doid-edit.owl

RELEASE MANAGEMENT
------------------

The official purls for DO are

 * http://purl.obolibrary.org/obo/doid.owl
 * http://purl.obolibrary.org/obo/doid.obo

These currently redirect to the central OBO library build

Currently (Oct 2014) the central OBO library build is built from the sourceforge version of DO
(http://sourceforge.net/p/diseaseontology/code/HEAD/tree/trunk/HumanDO.obo?format=raw)

This will soon be deprecated, and the central obo build will be made
from the version in this repository.

TODO: decide between either continuous release (build is made from
doid-edit) or whether doid has a release management process (e.g. doid
editor runs "make release")
