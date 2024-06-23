import os
import sys
import xml.etree.ElementTree as ET

def create_xml_file(path):
    root = ET.Element("root")
    tree = ET.ElementTree(root)
    xml_path = os.path.join(path, "inserted_file.xml")
    tree.write(xml_path)

def insert_xml_in_subfolders(base_folder):
    for root, dirs, files in os.walk(base_folder):
        for dir in dirs:
            dir_path = os.path.join(root, dir)
            if any(file.endswith(".sql") for file in os.listdir(dir_path)):
                create_xml_file(dir_path)
                print(f"XML file created in {dir_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python insert_xml.py <folder_path>")
        sys.exit(1)
    
    folder_path = sys.argv[1]
    insert_xml_in_subfolders(folder_path)

