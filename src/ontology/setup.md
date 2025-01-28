# Software Setup for Editors

The instructions in this document are designed for installing software for editing the Human Disease Ontology with Mac OS.

The following software is required:

- [Git](#git)
- [Protégé](#protégé)
- [Java](#java)
- [ROBOT](#robot)
- [fastobo-validator](#fastobo-validator)

There is an additional section for [optional setup/configuration](#optional-setupconfiguration).

# Git

Git is required to save updates to working files of the Human Disease Ontology and to send (aka push) those files to the public repository at https://github.com/DiseaseOntology/HumanDiseaseOntology/. Install Git from https://git-scm.com/downloads.


# Protégé

1. Download Protégé (Desktop version) from https://github.com/protegeproject/protege-distribution/releases.

> [!NOTE]
> The Protégé website at https://Protégé.stanford.edu/software.php#desktop-Protégé, does not have the most recent version.

2. _\[OPTIONAL\]_ Confirm the file's contents using the provided key, if available.

3. Extract Protégé from the download and move it to your Applications folder.

\* If you get a warning that Protégé cannot be opened due to security concerns, right-click on it and select Open. This should bring up a dialog allowing you to give Protégé permission to open.


# Java

The documentation for **ROBOT** (\> 1.8.3) states that it requires **Java 11** or greater. It is strongly recommended that Java 11 be used and _NOT_ a later version. Java 11 is the version ROBOT is tested to work with and we tested a later version (Java 17) and had issues with it.

> [!NOTE]
> The recommended version of _Java for users_ (referred to by Oracle as the Java Runtime Environment, JRE) is Java 8. This is too low, so it's necessary to download _Java designed for developers_, known as the Java Development Kit (JDK).


## Install JDK (for Mac)

### Version 11 (PREFERRED)
Most tested for use with ROBOT/Protégé

1. Navigate to the Java archive at https://www.oracle.com/java/technologies/downloads/archive/.

2. Choose Java SE 11 (direct link: https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)

3. Download the appropriate installer for your computer

    - Requires an Oracle account

    - For Macs, the DMG installer is easiest

4. Run the installer → done


### Latest Version (NOT RECOMMENDED)
This may or may not work correctly with ROBOT & Protégé.

Do **NOT** install the latest version for use with ROBOT. When Java 17 was the latest, we tested it and it did NOT work correctly. Please stick with the version of Java recommended by ROBOT (Java 11, as of 2025-Jan)

1. Navigate to https://www.oracle.com/java/technologies/downloads/.

2. Download the appropriate file for your system

3. *\[OPTIONAL\]* Verify the download's integrity/SHA hash

    - Calculate the downloaded JDK SHA hash in Terminal with:

        - `sha -a 256 <save_location>`

    - Make sure the hash matches the the one listed on the Java download page

4. Install JDK, following prompts on installer.

5. Confirm the version update in Terminal with:

    - `java -version`


### To uninstall a Java version (Mac; only if needed)

1. Open the Terminal

2. Run: `cd /Library/Java/JavaVirtualMachines`

3. Identify the Java directory with the version you want to uninstall

    - They are generally labeled `jdk-<version>.jdk`, e.g. `jdk-11.jdk` (for Java 11)

4. Run: `sudo rm -rf <java dir>`

\* **Do not delete** Java from /usr/bin/ directory on a Mac (that's the system version)


# ROBOT

ROBOT is required when editing the Human Disease Ontology. It powers validation tests and the creation of release products. However, it is NOT necessary to manually install ROBOT for this functionality. The ROBOT software that powers testing and releases is automatically downloaded to a `build` directory in each local copy of the repository when a make command that requires ROBOT is executed (e.g. `make test` or `make release`). The version of ROBOT is set by the `ROBOT_VRS` variable in the Makefile (top-level directory) and ensures that all editors are using the same software. If the version changes, the ROBOT software will automatically download the correct version when the first make command using it is executed and announce the change.

Manual install is _only_ needed if you wish ROBOT to be accessible from the commandline. To manually install ROBOT, follow the instructions at http://robot.obolibrary.org/. The preferred install location is `/usr/local/bin/`.

In _all cases_, a system-wide installation of [Java](#java) is required.


## System-wide ROBOT install confirmation

Confirm that the system-wide ROBOT has been downloaded correctly and *is in your PATH* by running `robot --version`; it should tell you the ROBOT version. If that doesn't work, try running which robot; this should return the path to the robot shell script. If nothing is returned, check your path with `echo $PATH` and be sure it includes the install location
(preferably `/usr/local/bin/`). If it does not add, it to your path and retry these steps.


# fastobo-validator

fastobo-validator is a tool for validating .obo files. The version of fastobo-validator to be used in the HumanDiseaseOntology repository is defined by the `FASTOBO_VRS` variable in the Makefile.

- On Macs _with Intel chips_, fastobo-validator will install automatically when needed for any make command.

- For ARM64 chips, fastobo-validator must be built from source using the programming language Rust.

    - Rust is easiest to install via the command line utility homebrew.

        - If homebrew is not installed refer to https://brew.sh/ for installation instructions.

        - After homebrew install, install Rust with `brew install rust`.

    - Once Rust is successfully installed, fastobo-validator should install automatically when needed for any make command.

If desired, fastobo-validator can be downloaded manually from https://github.com/fastobo/fastobo-validator/releases.


# Optional Setup/Configuration

## Setup Git to Use Robot Diff (from Damien Goutte-Gattat)

Briefly, how to configure git to use robot diff on OWL files:

1. Create a wrapper script around `robot diff` using the following code. That script will be called by `git diff` and needs to accept pre-defined arguments:

```
#!/bin/bash

# Arguments given to us by Git

path=$1         # the path to the file being diff\'ed

oldfile=$2		# a path to a file containing the \"old\" contents of
the file (the one we are diff\'ing against)

oldhash=$3		# the SHA1 hash of the old file

oldmode=$4		# the Unix mode of the old file

newfile=$5		# a path to a file containing the \"new\" contents of
the file

newhash=$6		# the SHA1 hash of the new file

newmode=$7		# the Unix mode of the new file

# Calling ROBOT

# This is assuming a ODK-style repository with a catalog file
(needed by ROBOT to resolve imports)

# located in `src/ontology/catalog-v001.xml`

robot diff \
    --catalog src/ontology/catalog-v001.xml \
    --labels true \
    --left-catalog src/ontology/catalog-v001.xml \
    --left $oldfile \
    --right $newfile \
    --format plain
```

Make sure the script is executable and reachable from the PATH. Below,
I'll assume the script is called `rdiff.sh`.

2. Create a "diff driver"

    - In either `~/.gitconfig` (if you want to use ROBOT diff in all your repositories) or in the `.git/config` file of selected repositories, add the following:

```
[diff "robotdiff"]

command = rdiff.sh
```

3. Configure git to use the robotdiff driver on OWL files

    - In either `~/.gitattributes` (to configure for all your repositories) or in the `.git/info/attributes` file of selected repositories, set the diff attribute to robotdiff for all filetypes for which you want to use ROBOT. For example, to use ROBOT diff on .owl and .obo files:

```
*.owl diff=robotdiff

*.obo diff=robotdiff
```

That's it. git will now use `rdiff.sh` (and therefore `robot diff`) every time it needs to show a diff on a .owl or .obo file.

Beware that robot diff is (unsurprisingly) noticeably slower than a good old plain text diff, and this may be very annoying on large ontologies. To *force git to use a plain text diff sometimes*, you can always use `git diff --no-ext-diff` to temporarily bypass the custom driver completely.