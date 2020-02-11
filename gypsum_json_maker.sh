#!/bin/bash

set -x

in_folder=$1
out_folder=$2

for i in $(ls $in_folder/*.smi); do
	file_wpath=${i%.smi}
	file_name=${file_wpath#$in_folder/}
	j=$out_folder/$file_name/
	python /home/jlwalker/projects/aquamarine_docker/new_json_maker.py $i $j
done
