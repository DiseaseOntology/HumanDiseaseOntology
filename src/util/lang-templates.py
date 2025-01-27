import csv
import os
import re
import sys

def strip_quotes(s):
    return s.strip('"').strip("'")

def process_tsv(input_file, output_prefix):
    with open(input_file, newline='', encoding='utf-8') as tsvfile:
        reader = csv.DictReader(tsvfile, delimiter='\t')
        headers = reader.fieldnames

        required_columns = ["source_id", "predicate", "translation_text", "translation_lang", "synonym_type"]
        for col in required_columns:
            if col not in headers:
                print(f"Error: Missing required column {col}", file=sys.stderr)
                sys.exit(1)

        input_header = "\t".join(headers)
        non_rt_file = {}
        annot_file = f"{output_prefix}-annot.txt"
        non_rt_file[annot_file] = True
        with open(annot_file, 'w', encoding='utf-8') as f:
            pass  # Create empty file

        for row in reader:
            source_id = row["source_id"]
            predicate = row["predicate"]
            translation_text = strip_quotes(row["translation_text"])
            translation_lang = strip_quotes(row["translation_lang"])

            if re.search(r'(doid$|\.owl$|\.obo$|\.json$)', source_id):
                output_file = annot_file
                if output_file not in non_rt_file:
                    with open(output_file, 'w', encoding='utf-8') as f:
                        f.write(input_header + "\n")
                    non_rt_file[output_file] = True

                with open(output_file, 'a', encoding='utf-8') as f:
                    f.write(f"--language-annotation\n{predicate}\n{translation_text}\n{translation_lang}\n")
            elif predicate == "IAO:0000115":
                output_file = f"{output_prefix}-rt-def.tsv"
                with open(output_file, 'a', encoding='utf-8') as f:
                    writer = csv.writer(f, delimiter='\t')
                    writer.writerow([source_id, translation_text, translation_lang, row["synonym_type"]])
            elif re.search(r':', predicate):
                parts = predicate.split(":")
                output_file = f"{output_prefix}-rt-{parts[1]}.tsv"
                with open(output_file, 'a', encoding='utf-8') as f:
                    writer = csv.writer(f, delimiter='\t')
                    writer.writerow([source_id, translation_text, translation_lang, row["synonym_type"]])
            else:
                output_file = f"{output_prefix}-unknown.tsv"
                if output_file not in non_rt_file:
                    with open(output_file, 'w', encoding='utf-8') as f:
                        f.write(input_header + "\n")
                    non_rt_file[output_file] = True

                with open(output_file, 'a', encoding='utf-8') as f:
                    writer = csv.writer(f, delimiter='\t')
                    writer.writerow([source_id, predicate, translation_text, translation_lang, row["synonym_type"]])

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_tsv_file> <output_prefix>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_prefix = sys.argv[2]
    process_tsv(input_file, output_prefix)