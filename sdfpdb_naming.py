import os, sys, pandas as pd, numpy as np, scipy, rdkit, glob

def gypsum_renamer(sdf_folder):

	sdf_folder = sys.argv[1]
	top = os.listdir(sdf_folder)

	for item in top:
    		folder_name = os.path.join(sdf_folder + os.sep + item)
    		for file in glob.glob(folder_name + '/*.sdf'):
        		if file == 'gypsum_dl_params':
            			pass
        		else:
            			newfile = file.split("/")[1]
            			fnew = newfile + "_3d" + ".sdf"
            			base = file.split("/")[1]
            			finfile_sdf = folder_name + "/"  + fnew
            			os.rename(file,finfile_sdf)
    		for file in glob.glob(folder_name + '/*.pdb'):
        	newfile = file.split("/")[1]
        	var = file.split("__")[2]
        	fnew = newfile + "_3d" + "_" + var
        	base = file.split("/")[0]
        	finfile_pdb = "./" + base + "/" + newfile + "/" + fnew
        	os.rename(file,finfile_pdb)
	return finfile_pdb

gypsum_renamer(sys.argv[1])
