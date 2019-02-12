#!/bin/bash

# nii_con.sh Created by Juan Felipe Orejuela on 26/02/15.
# This script was created to convert a large amount of dicom files within dicom folders into nifti files in a nifti folder.
# The script does not need any input argument, it just need to be ran within the root folder.
# Dicom folders should be also into the root folder like a PACS folder.
# Yay.

conv()
{
mkdir nifti

for dir in */; do
    mkdir temp

    find $dir -type f -name "*.dcm" -exec cp {} temp/ \;

    find temp -name "*.dcm" -print0 | while read -d $'\0' -r file ; do
    /Users/juanfelipeorejuela/bin/dcm2nii -d y -e y -i y -g y -r y $file
    exit
    done

    find temp -type f -name "*.nii.gz" -exec mv {} nifti/ \;
    find temp -type f -name "*.bvec" -exec mv {} nifti/ \;
    find temp -type f -name "*.bval" -exec mv {} nifti/ \;
    rm -R temp
done


}
# Fin - Conversión de DICOM a NIFTI

fecha_inicio=$(date +%d-%m-%y)
hora_inicio=$(date +%H:%M)

conv

fecha_final=$(date +%d-%m-%y)
hora_final=$(date +%H:%M)
echo "The process started at $fecha_inicio $hora_inicio and ended at $fecha_final $hora_final"
echo "¡Great!, this is over. Go for more coffee."
