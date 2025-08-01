#!/usr/bin/env python3
import sys
import csv
import os

# Helper to strip quotes from a string
def strip_quotes(s):
    if s is None:
        return ''
    return s.strip('"').strip("'")

def main():
    if len(sys.argv) < 3:
        print("Usage: lang-rt.py <input.tsv> <pfx>", file=sys.stderr)
        sys.exit(1)
    input_tsv = sys.argv[1]
    pfx = sys.argv[2]

    required_columns = [
        "source_id", "predicate", "translation_text", "translation_lang", "synonym_type"
    ]
    file_written = {}
    non_rt_file = {}
    output_files = {}
    pred_unk = None
    input_header = None

    # Open all output files in write mode (overwrite)
    open_files = {}

    with open(input_tsv, encoding="utf-8", newline='') as f:
        reader = csv.reader(f, delimiter='\t', quotechar='"')
        header = next(reader)
        col = {name: idx for idx, name in enumerate(header)}
        input_header = '\t'.join(header)
        # Check required columns
        for req in required_columns:
            if req not in col:
                print(f"Error: Missing required column {req}", file=sys.stderr)
                sys.exit(1)
        # Always create annotation file
        annot_file = f"{pfx}-annot.txt"
        open_files[annot_file] = open(annot_file, 'w', encoding='utf-8')
        non_rt_file[annot_file] = True

        for row in reader:
            # Skip empty lines
            if not any(row):
                continue
            # Ontology annotation rows
            if row[col["source_id"]].endswith("doid") or any(row[col["source_id"]].endswith(ext) for ext in [".owl", ".obo", ".json"]):
                text = strip_quotes(row[col["translation_text"]])
                lang = strip_quotes(row[col["translation_lang"]])
                open_files[annot_file].write(f"--language-annotation\n{row[col['predicate']]}\n{text}\n{lang}\n")
                continue
            # Determine output file
            predicate = row[col["predicate"]]
            translation_lang = row[col["translation_lang"]]
            if "label" in predicate:
                output_file = f"{pfx}-rt-label.tsv"
            elif predicate == "IAO:0000115":
                output_file = f"{pfx}-rt-def.tsv"
            elif ":" in predicate:
                output_file = f"{pfx}-rt-{predicate.split(':')[1]}.tsv"
            else:
                output_file = f"{pfx}-unknown.tsv"
                pred_unk = output_file
                if output_file not in non_rt_file:
                    open_files[output_file] = open(output_file, 'w', encoding='utf-8')
                    open_files[output_file].write(input_header + '\n')
                    non_rt_file[output_file] = True
                open_files[output_file].write('\t'.join(row) + '\n')
                continue
            # Write header if not already written
            if output_file not in file_written:
                open_files[output_file] = open(output_file, 'w', encoding='utf-8')
                open_files[output_file].write("source_id\ttranslation_text\tsynonym_type\n")
                predicate_template = f"AL {predicate}@{translation_lang} SPLIT=|"
                open_files[output_file].write(f"ID\t{predicate_template}\t>AI oboInOwl:hasSynonymType\n")
                file_written[output_file] = True
            # Write data row
            source_id = row[col["source_id"]]
            translation_text = row[col["translation_text"]]
            synonym_type = row[col["synonym_type"]]
            open_files[output_file].write(f"{source_id}\t{translation_text}\t{synonym_type}\n")

    # Close all files
    for f in open_files.values():
        f.close()
    # Error if unknown predicates were found
    if pred_unk:
        print(f"Error: Some predicates were not recognized, see {pred_unk}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
