#!/bin/bash
set -x

in_folder=$1
out_folder=$2

for i in $(ls $in_folder/*.sdf); do
    file_wpath=${i%.sdf}
    file_name=${file_wpath#$in_folder/}
    j=$out_folder/$file_name.pdb
    obabel -isdf $i -opdb -O $j -m
done

# here's the script for doing it individually
# obabel -isdf file_name.sdf -opdb -m 
# the "-m" separated them into multiple files

# in_folder=$1
# for i in $(ls $in_folder/*.sdf); do
#     obabel -isdf $i -opdb -m
# done 