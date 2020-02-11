import sys

def create_json(smi_file, output_folder):
    """
    Creates .json file for an .smi file.

    :param str smi_file: name of smi file
    :returns: name of json file
    """

    ligand_name = smi_file.strip(".smi")
    #lig = ligand_name.strip("./output_smi/")
    #print(lig)

    json_file = ligand_name + ".json"
    #sdf_file = basename(smi_file) + ".sdf"

    source_line = '	"source" : "' + smi_file + '" ,\n'
    output_line = '	"output_folder" : "' + output_folder + '",\n'
    sep_line = '	"separate_output_files" : true,\n'
    pdb_line = '	"add_pdb_output" : true,\n'
    proc_line = '	"num_processors": -1,\n'
    mpi_line = '	"job_manager": "multiprocessing"'

    with open(json_file, "w") as writefile:
        writefile.write("{\n")
        writefile.write(source_line)
        writefile.write(output_line)
        writefile.write(sep_line)
        writefile.write(pdb_line)
        writefile.write(proc_line)
        writefile.write(mpi_line)
        writefile.write("}\n")

    return json_file

#sys.argv grabs the n=1 argument of the command line
create_json(sys.argv[1], sys.argv[2])
