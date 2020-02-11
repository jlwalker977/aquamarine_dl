import scoria_rec_geoctr_bob
import vina_config_form_bob
import argparse

# this lets us plug in specific values for each of the necessary fields
parser = argparse.ArgumentParser(description='get fields for vina config file')
parser.add_argument('--receptor', '-r', required=True)
parser.add_argument('--ligand', '-l', required=True)
# output_folder will be created if not present
parser.add_argument('--output_folder', '-o', default="./vina_config/")
parser.add_argument('--resnum', '-n', nargs = '*', required=True)
args = parser.parse_args()

receptor_name = args.receptor
ligand_name = args.ligand
out_folder = args.output_folder

res_list = args.resnum

center = scoria_rec_geoctr_bob.get_center(receptor_name, res_list)

xcoord = center[0]
ycoord = center[1]
zcoord = center[2]

vina_config_form_bob.make_config(receptor_name,
                             ligand_name,
                             xcoord,
                             ycoord,
                             zcoord,
                             out_folder)
