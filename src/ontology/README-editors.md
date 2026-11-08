# INSTRUCTIONS FOR EDITORS

- [Overview](#overview)
	- [Files to Edit](#files-to-edit)
	- [ID range](#id-range)
- [Getting Started](#getting-started)
	- [Software Setup](#software-setup)
	- [Creating a local DO git repository](#creating-a-local-do-git-repository)
- [Using Protege](#using-protege)
	- [Starting Protege](#starting-protege)
	- [Reasoning](#reasoning)
	- [A few words of caution about Protégé](#a-few-words-of-caution-about-protégé)
- [Basic Curation Workflow](#basic-curation-workflow)
- [Make Commands](#make-commands)


## OVERVIEW

This file is designed to help new curators of the Human Disease Ontology get started and as a basic reference.


### Files to Edit

1. **src/ontology/doid-edit.owl**: This is the ONLY file in which DO disease terms should be edited.
2. **src/ontology/imports/*_terms.txt**: The set of `*_terms.txt` files control what terms are imported and are named by the ontology terms are imported from. These are the ONLY files that should be edited to change imported terms, with the exception of `omim_susc_import.owl`.
3. **src/ontology/imports/omim_susc_import.owl** contains OMIM susceptibilities maintained by the DO team and should be edited directly using Protege or ROBOT.


### ID range

Each curator's ID range is documented in the idranges file (src/ontology/doid-idranges.owl) and are also listed below. This range defines the DOIDs you are authorized to add. Please ask a maintainer to assign you an ID range if you are a curator and do not already have one assigned.

> [!IMPORTANT]
> ALWAYS check that diseases you add have DOIDs within your assigned range and are unique (do not overlap existing diseases or other diseases being added).

The current ID ranges for the University of Maryland School of Medicine curation team include:

	DOID:$sequence(7,50000,50999)$  Lynn
	DOID:$sequence(7,61000,61999)$  Luke
	DOID:$sequence(7,70000,70999)$  Allen
	DOID:$sequence(7,80000,85999)$  Lynn

Additional curation ID ranges assigned include:

	DOID:0100000 (in reserve)
	DOID:0110000 Sue (MGD)

_(Last updated 2026-07-30)_


## GETTING STARTED

### Software Setup

For software installation instructions, refer to [Install_DO_curation](https://docs.google.com/document/d/1vmrc-acwffQom9QrpOTm3ywvPyyBnMpNcBPKolwJT0o/) google doc.

For Protégé set up, refer to [Note-Protege_setup](https://docs.google.com/document/d/1q21gvQ5iDLzzINv52GJDW857z0AsqRHwMC08eBGqm-s/) google doc.


### Creating a local DO git repository

1. Open a directory on your local machine into which you would like to add the directory for the `HumanDiseaseOntology` repository.
2. Run the command `git clone https://github.com/DiseaseOntology/HumanDiseaseOntology.git`
3. Open the new `HumanDiseaseOntology` directory to access the files in the repo.

- To view the status of your git repository use `git status`
- To bring in new udpates to your local copy use `git pull origin` (optionally specifying the branch, e.g. `git pull origin main`)

`git help -a` lists all available subcommands and `git help -g` some
concept guides. Use `git help <command>` or `git help <concept>`
to read about a specific subcommand or concept.


## USING PROTEGE

### Starting Protege

First, open Protege. Then, open the doid-edit.owl file from your local HumanDiseaseOntology repository. Alternatively, you may be able to double-click the doid-edit.owl file (however, you will have to do this twice; the first time it opens Protégé and the second opens the actual file).

### Reasoning

Like most OBO ontologies, DO uses the Elk reasoner (https://github.com/liveontologies/elk-reasoner). Be sure this is selected in the Reasoner menu before starting the reasoner. If you are making changes, be sure to synchronize the reasoner afterward to update reasoning.

### A few words of caution about Protégé

Protégé 5.6 and higher are configured to automatically provide the correct IDs for any ontology, _IF_ they are properly defined in an accompanying `*-idranges.owl` file. This can set both the base IRI (e.g. `http://purl.obolibrary.org/obo/DOID_`) and the numbering scheme/range. If your computer user name matches one in the `*-idranges.owl` file, it will be used automatically. If not, you'll be given the option to choose an `*-idranges.owl` defined range. **DO curators should have a defined range and should not have to select one. _If your range is not automatically selected, please inform the repository manager._**

Protégé attempts to track previously added IDs and _should_ use the next available ID in your range. However, it can make mistakes (e.g. you add a term and then delete it during a session). _YOU MUST_ be aware and check if ever in doubt. Some tips to check to see where you are in your range: click the search symbol (top right) and then search for IDs within your range.

If you are editing multiple ontologies, each _should_ configure properly on load. However, this can fail, particularly if more than one is open at the same time. _YOU MUST_ check when adding a term to be sure it is using the proper base IRI and number in your range.


## BASIC CURATION WORKFLOW

1. Before opening or editing a file, update local files from the GitHub remote repo by running `git pull origin main`, while on the `main` branch.
2. Open Protege, make edits manually, and then save them -- OR -- Create a [robot template](https://robot.obolibrary.org/template) and add the edits using ROBOT the command line (WARNING: Be sure to save the doid-edit.owl file in OWL Functional Syntax by including `--format ofn`).
3. Run `make test` to check for mistakes/errors, fix any issues, and save the file again.
3. Commit the changes to your local repository either by:
    1. Add the file(s) to git staging with `git add <filenames>` and initiate a commit  with `git commit` -- OR --
	2. Committing individual files directly with `git commit <filenames>`.
	- You may optionally use `-m` to provide the required git commit message directly on the command line (e.g. `git commit -m "Update heart disease"`); otherwise, an editor will open for you to write a commit message and the commit will created after you save and quit.
	- A shortcut that adds all changed files _already tracked by git_ to staging is `git add -u <optional-path>` (if a path is not given, everything in and below the current working directory is assumed).
4. Ensure your local repository copy is in sync with the GitHub repo by again running `git pull` (merge if necessary).
5. Sync your changes to the GitHub repository with `git push origin main`.

> [!NOTE]
> ### GIT COMMIT MESSAGES
> The first line of each git commit message should briefly describe the changes being committed to files ([Guide to good commit messages](https://cbea.ms/git-commit/)).
>
> If you are working on an issue from the GitHub issue tracker, you should create a multiline commit message with the standard message on the first line, followed by a blank line, followed by a line containing the issue number. If this commit completes/fixes the issue, you can close the issue automatically by writing 'Closes <issue number>` (see https://github.blog/news-insights/product-news/closing-issues-via-commit-messages/).
>
> Example:
> Add peri-implant diseases
>
> Closes #1603


## MAKE COMMANDS

Refer to [README-make.md](./README-make.md) for a list of `make` commands for testing, maintenance, managing imports, creating releases, and more.
