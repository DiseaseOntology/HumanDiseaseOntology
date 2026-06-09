# Update sitemap XML file from the release diff TSV report.
import argparse
import xml.etree.ElementTree as ET
import csv

parser = argparse.ArgumentParser(
    description="Update sitemap XML file from the release diff TSV report."
)
parser.add_argument(
    "--date",
    required=True,
    help="Date to use for the last modified field (format: YYYY-MM-DD).",
)
parser.add_argument(
    "--diff",
    required=True,
    help="Path to the release diff TSV file.",
)
parser.add_argument(
    "--sitemap",
    required=True,
    help="Path for output sitemap file.",
)
args = parser.parse_args()

sitemap_file = args.sitemap
diff_file = args.diff
lastmod_date = args.date

# (1) read the diff file and identify entities that need to be updated
diff_data = {}
with open(diff_file, "r") as f:
    reader = csv.DictReader(f, delimiter="\t")
    for row in reader:
        id = "https://disease-ontology.org/?id=" + row["id"]
        # determine the type of modification needed (add, remove, update)
        if row["entity_diff"] == "added":
            modify = "add"
        else:
            if "[new]: FALSE".lower() in row["deprecated"].lower():
                modify = "add"
            elif "[new]: TRUE".lower() in row["deprecated"].lower():
                modify = "remove"
            else:
                modify = "update"
        diff_data[id] = modify

# (2) parse the sitemap XML and update it based on 'modify' values
ns_uri = "http://www.sitemaps.org/schemas/sitemap/0.9"
ET.register_namespace("", ns_uri)
ns = {"sm": ns_uri}
url_tag = f"{{{ns_uri}}}url"
loc_tag = f"{{{ns_uri}}}loc"
lastmod_tag = f"{{{ns_uri}}}lastmod"

xml_parser = ET.XMLParser(target=ET.TreeBuilder(insert_comments=True))
tree = ET.parse(sitemap_file, parser=xml_parser)
root = tree.getroot()

for id, modify in diff_data.items():
    url_element = None
    for url in root.findall("sm:url", ns):
        loc_element = url.find("sm:loc", ns)
        if loc_element is not None and loc_element.text == id:
            url_element = url
            break

    if url_element is not None:
        if modify == "remove":
            root.remove(url_element)
        elif modify == "update":
            lastmod_element = url_element.find("sm:lastmod", ns)
            if lastmod_element is not None:
                lastmod_element.text = lastmod_date
            else:
                ET.SubElement(url_element, lastmod_tag).text = lastmod_date
    elif modify != "remove":
        new_url = ET.SubElement(root, url_tag)
        ET.SubElement(new_url, loc_tag).text = id
        ET.SubElement(new_url, lastmod_tag).text = lastmod_date

# (3) write the updated sitemap XML back to the file
ET.indent(root, space="  ")
tree.write(sitemap_file, encoding="utf-8", xml_declaration=True)
