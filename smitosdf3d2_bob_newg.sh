#!/bin/bash
set -x

# make the folder that these files will go into "sdf3d_output" 
in_folder=$1
if [ ! -d ./output_sdf3d ]; then
    mkdir output_sdf3d
fi

# take the file_name from the json file and make it into a .sdf file?
#for i in $(ls $in_folder/*.json); do
#   file_wpath=${i%.json}
#    file_name=${file_wpath#$in_folder/}
#done

#source activate rdkit

for i in $( ls $in_folder/*.json); do
    echo $i
    python /home/jlwalker/projects/aquamarine_docker/gypsum_dl/run_gypsum_dl.py --json $i
done

exit 0
