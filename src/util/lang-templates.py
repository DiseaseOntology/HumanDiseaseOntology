import csv
import re
import sys
from collections import defaultdict


def strip_quotes(s):
    return s.strip('"').strip("'")


def process_tsv(input_file, output_file, delimiter="|"):
    data = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))

    with open(input_file, newline="", encoding="utf-8") as tsvfile:
        reader = csv.DictReader(tsvfile, delimiter="\t")
        headers = reader.fieldnames

        required_columns = [
            "source_id",
            "predicate",
            "translation_text",
            "translation_lang",
            "synonym_type",
        ]
        for col in required_columns:
            if col not in headers:
                print(f"Error: Missing required column {col}", file=sys.stderr)
                sys.exit(1)

        for row in reader:
            source_id = row["source_id"]
            predicate = row["predicate"]
            translation_text = strip_quotes(row["translation_text"])
            translation_lang = strip_quotes(row["translation_lang"])

            if re.search(r"(doid$|\.owl$|\.obo$|\.json$)", source_id):
                continue  # Skip ontology annotations for this script

            data[source_id][predicate][translation_lang].append(translation_text)

    predicates_langs = sorted(
        set(
            (pred, lang)
            for preds in data.values()
            for pred, langs in preds.items()
            for lang in langs
        )
    )

    with open(output_file, "w", newline="", encoding="utf-8") as csvfile:
        writer = csv.writer(csvfile, delimiter="\t")

        # Write the first header row
        header1 = ["ID"] + [
            re.sub(r"IAO[_:]0000115", "definition", pred.split(":")[1])
            for pred, lang in predicates_langs
        ]
        writer.writerow(header1)

        # Write the second header row
        header2 = ["ID"] + [
            f"AL {pred}@{lang} SPLIT={delimiter}" for pred, lang in predicates_langs
        ]
        writer.writerow(header2)

        # Write the data rows
        for source_id, preds in data.items():
            row = [source_id] + [
                delimiter.join(preds[pred][lang]) if lang in preds[pred] else ""
                for pred, lang in predicates_langs
            ]
            writer.writerow(row)


if __name__ == "__main__":
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        print(
            "Usage: python process_translations.py <input_tsv_file> <output_tsv_file> [delimiter]"
        )
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    delimiter = sys.argv[3] if len(sys.argv) == 4 else "|"
    process_tsv(input_file, output_file, delimiter)
