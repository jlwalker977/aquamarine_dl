import sys

def create_json(smi_file, sdf_folder):
    """
    Creates .json file for an .smi file.

    :param str smi_file: name of smi file
    :returns: name of json file
    """

    ligand_name = smi_file.strip(".smi")

    json_file = ligand_name + ".json"
    # sdf_file = ligand_name + ".sdf"

    source_line = '    "source" : "' + smi_file + '",\n'
    output_line = '    "output_folder" : "' + sdf_folder + '",\n'
    add_pdb_line = '    "add_pdb_output" : true, \n'
    separate_line = '    "separate_output_files" : true \n'

    with open(json_file, "w") as writefile:
        writefile.write("{\n")
        writefile.write(source_line)
        writefile.write(output_line)
        writefile.write(add_pdb_line)
        writefile.write(separate_line)
        writefile.write("}\n")
    return json_file

#sys.argv grabs the n=1 argument of the command line
create_json(sys.argv[1], sys.argv[2])

