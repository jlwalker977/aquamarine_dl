#!/bin/bash
set -x

# make the folder that these files will go into "sdf3d_output" 
in_folder=$1
if [ ! -d ./output_sdf3d ]; then
    mkdir output_sdf3d
fi

for i in $( ls $in_folder/*.json); do
    echo $i
    python /home/jlwalker/projects/aquamarine_docker/gypsum_dl/run_gypsum_dl.py --json $i
done

exit 0

