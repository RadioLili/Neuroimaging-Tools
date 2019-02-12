#!/bin/bash

# fs_run.sh Created by Juan Felipe Orejuela on 26/02/15.
# This script does not need any input argument.
# It just need to be run within the root folder. All files should be nifti, and should be within the root folder too. The scripts read them and make all freesurfer staff. At the end, it should generate results.

fs_run()
{

    find ./ -name "*.nii.gz" -print0 | while read -d $'\0' -r file ; do

    input=`echo $file | cut -d/ -f 3`

    output=`echo $input | cut -d. -f 1`

    recon-all -i $input -s $output
    recon-all -autorecon-all -s $output
    recon-all -s $output -qcache
    exit
    done

}
# Fin - Conversión de DICOM a NIFTI

fecha_inicio=$(date +%d-%m-%y)
hora_inicio=$(date +%H:%M)

fs_run

fecha_final=$(date +%d-%m-%y)
hora_final=$(date +%H:%M)
echo "The process started at $fecha_inicio $hora_inicio and ended at $fecha_final $hora_final"
echo "¡Great!, this is over. Go for more coffee."
