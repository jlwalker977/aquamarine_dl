#!/bin/bash
set -x

for i in $(ls ./*.pdb); do
    ~/larp1/bin/pythonsh ~/larp1/bin/prepare_receptor4.py -r $i -A bonds_hydrogens
done

if [ ! -d ./output_pdbqt ]; then
    mkdir output_pdbqt
fi

mv *.pdbqt ./output_pdbqt

exit 0
