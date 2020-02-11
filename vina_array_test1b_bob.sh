#!/bin/bash
set -x

#define source path to recligprep folder where all the scripts live
SRC_PATH=/home/jlwalker/larp1/src/recligprep_bob

rec_folder=${1%/}
lig_folder=${2%/}
output_vina_config=${3%/}
vina_output=${4%/}

#need to define "-o" and "-n" somehow, that's where its getting stuck
for i in $(ls $rec_folder/*.pdbqt); do
    for j in $(ls $lig_folder/*.pdbqt); do
#entered in the values want to use here. -o is fine, can be kept at this value
#-n is specific to larp1, unsure how to get that part moved over 
        python $SRC_PATH/geoctr_vina_wrap_bob.py -r $i -l $j -o ./vina_config/ -n 883 886 922
    done
done

echo "Done making vina config files!"

#need to make a log-file-construct = log-rec-lig-vina.txt
#need to make an output-file-construct = rec-lig-vina-out.pdbqt
#gives error: Parse error on line 1 in file "./lig/output_pdbqt/6thioG3_out.pdbqt": Unexpected multi-MODEL input. Use "vina_split" first?

#for k in $(ls $output_vina_config/*.txt); do
    #vina --config $k 
    #vina --config $k --log $i-$j-log_out.txt --out $i-$j_out.pdbqt 
#done

#echo "Done running vina!"

#*****THIS IS PYTHON! NEEDS TO BE UNIX!******
# using replace instead of strip, to replace file ext with "nothing"
# strip(".pdbqt") removes all p,d,b,q,t characters from file names
# so this is why you use replace instead of strip
#rec_strip = receptor_name.replace(".pdbqt", "")
#lig_strip = ligand_name.replace(".pdbqt", "")

# rec name is the last arg (- index) of the rec file name
# only grab the part before ".pdbqt", not the path
#rec_name = rec_strip.split("/")[-1]
#lig_name = lig_strip.split("/")[-1]

#file_name = rec_name + "-" + lig_name + "-vina.txt"
#output_name = rec_name + "-" + lig_name + "_out.txt"
#log_name = rec_name + "-" + lig_name + "log_out.txt"

#this part works fine!

#make vina_output folders for each receptor, for organization
#altho, once the vina_output.pdbqt files have appropriate names,
#this will become unnecessary

#*****FROM PROCESS_LIGANDS_HS.SH*****
#in_folder=$1
#out_folder=$2

#for i in $(ls $in_folder/*.pdb); do
    #file_wpath=${i%.pdb}
    #file_name=${file_wpath#$in_folder/}
    #j=$out_folder/$file_name.pdbqt
    #~/larp1/bin/pythonsh ~/larp1/bin/prepare_ligand4.py -l $i -R 0 -A bonds_hydrogens -o $j
#done

for p in $(ls $output_vina_config/*.txt); do
    file_wpath=${p%.txt}
    file_name=${file_wpath#$output_vina_config/}
    q=$vina_output/$file_name-out.pdbqt
    r=$vina_output/$file_name-log.txt

    vina --config $p --out $q --log $r  
done

echo "Done running Vina!"

#for m in $(ls $lig_folder/*-out.pdbqt); do
#    mv $m ./vina_output/
#done

#while 
echo "Done moving files to vina_output folder!"

exit 0
