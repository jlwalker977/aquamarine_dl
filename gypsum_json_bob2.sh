#!/bin/bash

in_folder=$1
out_folder=$2

for i in $(ls $in_folder/*.smi); do
    file_wpath=${i%.smi}
    file_name=${file_wpath#$in_folder/}
    j=$out_folder
    python /home/kcc35/DataB/jlwalker/projects/aquamarine_docker/make_json_bob2.py $i $j 
done
