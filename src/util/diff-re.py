import os
import csv
import re
import argparse


def file_delim(file_path):
    """
    Determine the delimiter based on the file extension.

    Parameters:
    file_path (str): The path to the file.

    Returns:
    str: The delimiter to use (either '\t' for TSV or ',' for CSV).
    """
    file_ext = os.path.splitext(file_path)[1].lower()
    delim = "\t" if file_ext == ".tsv" else ","
    return delim


def rename_re_col(col_nm):
    """
    Rename columns from ROBOT export files.

    Parameters:
    col_nm (str): The original column name.

    Returns:
    str: The renamed column name.
    """
    # Special case for definition
    if re.search(r"IAO[:_]0000115", col_nm, re.IGNORECASE):
        return "definition"

    # General renaming rules
    col_nm = col_nm.lower()
    if "anon" in col_nm:
        col_nm = "anon_" + col_nm
    col_nm = col_nm.split(" ")[0]
    if ":" in col_nm and not re.search(r":\d", col_nm):
        col_nm = col_nm.split(":")[1]
    return col_nm


# Function to flexibly read csv or tsv output from robot export
def read_re(file_path, prefix=None, delim="\t", delim2="|", encoding="utf-8"):
    """
    Read a ROBOT export file (TSV/CSV) file.

    Parameters:
    file_path (str): The path to the file.
    prefix (str, optional): A prefix to filter IDs by (default: None).
    delim (str, optional): The delimiter used in the file (default: '\t').
    delim2 (str, optional): The delimiter used within cell values (default: '|').
    encoding (str, optional): The encoding of the file (default: 'utf-8').

    Returns:
    dict: A dictionary with processed data.
    """
    with open(file_path, mode="r", encoding=encoding) as file:
        reader = csv.DictReader(file, delimiter=delim)
        data = {}
        rows = list(reader)
        col_bool = set()

        # Identify boolean cols to fill in missing values with FALSE
        for col in reader.fieldnames:
            all_bool = True
            all_missing = True
            for row in rows:
                if not all_bool:
                    break
                values = row[col].split(delim2)
                for v in values:
                    if v.upper() not in ["TRUE", "FALSE", ""]:
                        all_bool = False
                        break
                    all_missing = all_missing and v == ""
            if all_bool and not all_missing:
                col_bool.add(rename_re_col(col))

        for row in rows:
            id_val = row["ID"]
            processed_row = {
                rename_re_col(k): v.split(delim2) for k, v in row.items() if k != "ID"
            }
            for col in col_bool:
                processed_row[col] = [
                    v.upper() if v.upper() in ["TRUE", "FALSE"] else "FALSE"
                    for v in processed_row[col]
                ]
            # optionally, filter rows with IDs that start with a prefix
            if prefix is None or id_val.startswith(prefix):
                data[id_val] = processed_row

        return data


def compare_re(old_data, new_data, delim1="\n", delim2="|"):
    """
    Compare two sets of ROBOT export data and identify differences.

    Parameters:
    old_data (dict): The old data set.
    new_data (dict): The new data set.
    delim1 (str, optional): The delimiter to use between sets of values (e.g. [last] & [new]) in output (default: '\n').
    delim2 (str, optional): The delimiter to use between values within a set (default: '|').

    Returns:
    list: A list of dictionaries with differences.
    """
    out = []

    all_id = set(old_data.keys()).union(new_data.keys())
    for i in all_id:
        entry = {}
        if i not in old_data:
            entry["entity_diff"] = "added"
            for key, value in new_data[i].items():
                entry[key] = delim2.join(value)
        elif i not in new_data:
            entry["entity_diff"] = "removed"
            for key, value in old_data[i].items():
                entry[key] = delim2.join(value)
        else:
            entry["entity_diff"] = "changed"
            for col in old_data[i].keys():
                old_val = set(old_data[i].get(col, []))
                new_val = set(new_data[i].get(col, []))
                same = old_val & new_val
                old = old_val - new_val
                new = new_val - old_val

                # Drop empty strings from the sets
                same.discard("")
                old.discard("")
                new.discard("")

                result = []
                if same:
                    result.append(f"[same]: {'|'.join(map(str, same))}")
                if old:
                    result.append(f"[old]: {'|'.join(map(str, old))}")
                if new:
                    result.append(f"[new]: {'|'.join(map(str, new))}")
                entry[col] = delim1.join(result)

        # Add ONLY if entry has changes
        if entry["entity_diff"] != "changed" or any(
            "[old]" in str(v) or "[new]" in str(v) for v in entry.values()
        ):
            entry["id"] = i
            out.append(entry)

    if not out:
        entry = {key: None for key in entry}
        out.append(entry)

    return out


def write_re_diff(data, output_path, delim="\t"):
    """
    Write the differences between two ROBOT export files to a TSV or CSV file.

    Parameters:
    data (list): The output from compare_re().
    output_path (str): The path to the output file.
    delim (str, optional): The delimiter to use in the output file (default: '\t').
    """
    col_nm = ["entity_diff", "id"] + [
        col for col in data[0].keys() if col not in ["entity_diff", "id"]
    ]

    if all(val is None for val in data[0].values()):
        diff_n = 0
    else:
        diff_n = len(data)

        # Sort data by the newest label, ignoring prefixes
        def sort_key(entry):
            label = entry.get("label", "")
            return label.rsplit("]: ", 1)[-1]

        output = sorted(data, key=sort_key)

    with open(output_path, mode="w", encoding="utf-8", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=col_nm, delimiter=delim)
        writer.writeheader()
        if diff_n > 0:
            for row in output:
                writer.writerow(row)


def main():
    """
    Main function to compare two ROBOT export TSV/CSV files and output the differences.
    """
    parser = argparse.ArgumentParser(
        description="Show the differences in two ROBOT export tsv/csv files."
    )
    parser.add_argument(
        "-1", metavar="OLD", required=True, help="Path to older export file."
    )
    parser.add_argument(
        "-2", metavar="NEW", required=True, help="Path to newer export file."
    )
    parser.add_argument(
        "-o", metavar="OUTPUT", required=True, help="Path for output file."
    )
    parser.add_argument(
        "-p",
        metavar="PREFIX",
        required=False,
        default=None,
        help="Prefix to filter IDs by (default: None).",
    )
    parser.add_argument(
        "-d",
        metavar="DELIMITER",
        required=False,
        default="\n",
        help=(
            "Delimiter to use between sets of values (e.g. [last] & [new]) "
            "in output (default: '\\n')."
        ),
    )
    parser.add_argument(
        "-s",
        "--split",
        required=False,
        default="|",
        help=(
            "Delimiter for values within a set (default: '|'). "
            "See https://robot.obolibrary.org/export for more info."
        ),
    )
    parser.add_argument(
        "-e",
        metavar="ENCODING",
        required=False,
        default="utf-8",
        help=(
            "Encoding of input files (default: 'utf-8'). "
            "Output will always be 'utf-8'."
            "See https://docs.python.org/3/library/codecs.html#standard-encodings "
            "for more info."
        ),
    )
    args = parser.parse_args()

    old_file = getattr(args, "1")
    new_file = getattr(args, "2")
    output_file = args.o
    prefix = args.p
    delim1 = args.d
    delim2 = args.split
    encoding = args.e

    old_data = read_re(old_file, prefix, file_delim(old_file), delim2, encoding)
    new_data = read_re(new_file, prefix, file_delim(new_file), delim2, encoding)

    diff_data = compare_re(old_data, new_data, delim1, delim2)

    write_re_diff(diff_data, output_file, file_delim(output_file))


if __name__ == "__main__":
    main()
