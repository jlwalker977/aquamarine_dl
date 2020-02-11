#!/bin/bash
set -x

# establishing path from root folder to script location 
SRC_PATH=/home/jlwalker/projects/aquamarine_docker
DATA_DIR=$1

if [ ! -d ./output_smi ]; then
    mkdir output_smi
fi

# converts sdf2d to smile strings w obgen + makes new output_smi folder and moves smi files there
bash $SRC_PATH/sdftosmi_bob.sh $DATA_DIR 

if [ ! -d ./output_sdf3d ]; then
    mkdir output_sdf3d


# makes json file for each smi file
bash $SRC_PATH/gypsum_json_maker.sh output_smi output_sdf3d

# runs gypsum using json files + makes sdf3d_output folder and moves sdf files there 
bash $SRC_PATH/smitosdf3d2_bob.sh output_smi

if [ ! -d ./output_pdb ]; then
    mkdir output_pdb
fi

cp output_sdf3d/*/*.sdf output_pdb

# converts sdf to multiple pdb files for each pose of the molecule, uses obabel
#bash $SRC_PATH/sdftopdb1-m_bob.sh output_sdf3d output_pdb

#rm ./output_pdb/*1.pdb 

if [ ! -d ./output_pdbqt ]; then
    mkdir output_pdbqt
fi

# converts pdb to pdbqt and adds hydrogens, using MGLtools script
bash $SRC_PATH/process_ligands_Hs_bob.sh output_pdb output_pdbqt


echo "hooray your ligands are ready"

exit 0
