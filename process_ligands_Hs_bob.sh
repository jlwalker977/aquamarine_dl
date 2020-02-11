#!/bin/bash
set -x

# have mgltools installed in bin before this will run, make links

in_folder=$1
out_folder=$2

for i in $(ls $in_folder/*.pdb); do
    file_wpath=${i%.pdb}
    file_name=${file_wpath#$in_folder/}
    j=$out_folder/$file_name.pdbqt
    ~/bin/pythonsh ~/bin/prepare_ligand4.py -l $i -R 0 -A bonds_hydrogens -o $j
done
