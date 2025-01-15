#!/bin/awk -f
BEGIN {
    FS = "\t";
    # define file for unknown predicates
    pred_unk = pfx "-unknown.tsv";
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
    # save whole header in case of unknown predicates
    input_header = $0;
}

NR > 1 {
    # Determine the output file based on the predicate value
    if ($col["predicate"] == "IAO:0000115") {  # definition-specific
        output_file = pfx "-rt-def.tsv";
    } else if ($col["predicate"] ~ /:/) {      # use LUI for CURIE predicates
        split($col["predicate"], parts, ":");
        output_file = pfx "-rt-" parts[2] ".tsv";
    } else {                                   # error: non-CURIE predicates (signal at END)
        # create "unknown" output file and write full input header & rows to it
        output_file = pred_unk;
        if (!(output_file in file_written)) {
            print input_header > output_file;
            file_written[output_file] = 1;
        }
        print $0 >> output_file;
    }

    # Write data to appropriate file, unless unrecognized (written above)
    if (output_file != pred_unk) {
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
    for (file in file_written) {
        if (file == pred_unk) {
            print "Error: Some predicates were not recognized, see " pred_unk > "/dev/stderr";
            exit 1;
        }
    }
}
