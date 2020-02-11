import scoria

def get_center(receptor_name, res_list):
    mol = scoria.Molecule(receptor_name)
    sel = mol.select_atoms({"resseq" : res_list})
    center = mol.get_geometric_center(sel)
    return center