import textwrap

def make_config(receptor_name,
                ligand_name,
                xcoord,
                ycoord,
                zcoord,
                output_folder):

    # basic form for vina config files, changeable fields highlighted
    # change exhaustiveness to account for bob's 56 CPUs
    # exh = 24? 100?
    config_form = textwrap.dedent("""\
    receptor = {receptor_name}
    ligand = {ligand_name}

    center_x =  {xcoord}
    center_y =  {ycoord}
    center_z =  {zcoord}

    size_x = 25
    size_y = 25
    size_z = 25

    energy_range = 4

    
    exhaustiveness = 100
    """)
    # these are the arguments we can change
    format_dict = {"receptor_name": receptor_name,
                "ligand_name": ligand_name,
                "xcoord": xcoord,
                "ycoord": ycoord,
                "zcoord": zcoord}

    filled_form = config_form.format(**format_dict)

    # using replace instead of strip, to replace file ext with "nothing"
    # strip(".pdbqt") removes all p,d,b,q,t characters from file names
    # so this is why you use replace instead of strip
    rec_strip = receptor_name.replace(".pdbqt", "")
    lig_strip = ligand_name.replace(".pdbqt", "")

    # rec name is the last arg (- index) of the rec file name
    # only grab the part before ".pdbqt", not the path
    rec_name = rec_strip.split("/")[-1]
    lig_name = lig_strip.split("/")[-1]

    file_name = rec_name + "-" + lig_name + "-vina.txt"

    # if an output folder has a '/' at end, write to it as is
    # if an output folder does not have a '/', add one, then write to it
    if output_folder[-1] == "/":
        output = output_folder + file_name
    else:
        output = output_folder + "/" + file_name

    with open(output, "w") as writefile:
        writefile.write(filled_form)

