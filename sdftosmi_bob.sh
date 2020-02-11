#!/bin/bash
set -x

in_folder=$1
if [ ! -d ./output_smi ]; then
    mkdir output_smi
fi

for i in $(ls $in_folder/*.sdf); do
    file_wpath=${i%.sdf}
    file_name=${file_wpath#$in_folder/}
    echo $i 
    echo $file_name

    obabel -isdf $i -ocan > ./output_smi/$file_name.smi
done

 