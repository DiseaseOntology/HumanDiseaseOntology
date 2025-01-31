#!/bin/awk -f
# Function to strip quotes from a string
function strip_quotes(str) {
    gsub(/^["']|["']$/, "", str);
    return str;
}

BEGIN {
    FS = "\t";
}

# Read the header row to determine column positions
NR == 1 {
    for (i=1; i<=NF; i++) {
        col[$i] = i;
    }
    # confirm required cols present (error on first missing)
    required_columns = "source_id predicate translation_text translation_lang synonym_type";
    split(required_columns, req_cols, " ");
    for (j in req_cols) {
        if (!(req_cols[j] in col)) {
            print "Error: Missing required column " req_cols[j] > "/dev/stderr";
            exit 1;
        }
    }
    # save whole header in case of unknown predicates ERROR
    input_header = $0;

    # Always create a new file for ontology annotations
    annot_file = pfx "-annot.txt"
    printf "" > annot_file;
    non_rt_file[annot_file] = 1;
}

NR > 1 {
    # Process ontology annotations for robot annotate, not robot template
    if ($col["source_id"] ~ /(doid$|\.owl$|\.obo$|\.json$)/) {
        output_file = annot_file;
        text = strip_quotes($col["translation_text"]);
        lang = strip_quotes($col["translation_lang"]);
        print "--language-annotation\n" $col["predicate"] "\n" text "\n" lang >> output_file;

    # Determine the output file based on the predicate value
    } else if ($col["predicate"] == "IAO:0000115") {    # definition-specific filename
        output_file = pfx "-rt-def.tsv";
    } else if ($col["predicate"] ~ /:/) {               # other CURIE predicates, LUI -> filename
        split($col["predicate"], parts, ":");
        output_file = pfx "-rt-" parts[2] ".tsv";
    } else {                                            # ERROR: non-CURIE predicates (signal at END to get list)
        # create "unknown" output file and write full input header & rows to it
        pred_unk = output_file = pfx "-unknown.tsv";;
        if (!(output_file in non_rt_file)) {
            print input_header > output_file;
            non_rt_file[output_file] = 1;
        }
        print $0 >> output_file;
    }

    # Write data to appropriate robot template
    if (!(output_file in non_rt_file)) {
        # Create expected output files with robot template header & template rows
        if (!(output_file in file_written)) {
            print "source_id\ttranslation_text\tsynonym_type" > output_file;
            predicate_template = "AL " $col["predicate"] "@" $col["translation_lang"] " SPLIT=|";
            print "ID\t" predicate_template "\t>AI oboInOwl:hasSynonymType" >> output_file;
            file_written[output_file] = 1;
        }
        print $col["source_id"] "\t" $col["translation_text"] "\t" $col["synonym_type"] >> output_file;
    }
}

END {
    if (pred_unk in non_rt_file) {
        print "Error: Some predicates were not recognized, see " pred_unk > "/dev/stderr";
        exit 1;
    }
}
