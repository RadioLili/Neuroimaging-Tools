# tools
Tools for organizing, processing, and visualizing neuroimaging data.
I have created these scripts because they had allowed to make easier my job (and my life), that's why I share them. Any comment, it's welcome. 

# MAT2TAB
mat2tab is a simple MATLAB-based script that allows to extract one single table with the results of the connectivity matrix of n subjects (or n groups of subjects) obtained with Brainsuite for further statistical analysis.
Once you have completed the Brainsuite process (http://brainsuite.org/processing/), and then the connectivity calculation (http://brainsuite.org/tutorials/dtiexercise/), you are able to export the connectivity matrix for all cortical or brain areas. 

Steps.
1. Organize a folder with all the connectivity files inside, and rename each file with a code or a name (this will be use as reference for each matrix as subject ID).
2. Run the script, it will ask for a folder, select the folder created before.
3. You will get a file with all the connectivity values for all subjects. The names of the columns have a format such as 'c120w164', with means connectivity between 120 and 164 areas. Information of labels is in the brainsuite_labeldescription file.
4. If you are going to analyze groups, it is recommended to use filenames such as CON1, CON2, CON3, for control group for instance, and PAT1, PAT2, PAT3 for pathological group.
5. for Windows users, please use the _win_ file.

# NLAB_TTEST
nlab_test is a simple MATLAB-based script that allows to perform (1) t-test or (2) mann-whitney test, between two groups with n variables. The input file MUST include a first column with 0 or 1 in order to classify the groups, for instance, healthy group = 1, pathologic group = 0. All columns are expected to have headers. All variables are expected to be numeric. See example in the dataset_example_ttest file. 

Results include average (or median), min, max, standard deviation for each group. h (lilietest) may be 0 if both groups are normally distributed, or 1 if at least one of the groups is not normally distributed. h (t-test or mann-whitney test) may be 0 if the hypothesis null is accepted, or 1 if it is rejected at the 5% significance level. p-value for t-test, or mann-whitney test, is also included. A spreadsheet file is generated including the input data.

# FS_RUN
fs_run is a very simple bash-based script. It allows to perform the FreeSurfer pipeline process (conversion, recon-all all, and qdec) for n files. Organize a root folder with all the nifti (.nii.gz) files within it. The name of the files are used for identify the subjects, thus, it is recommended to use filenames such as CON1.nii.gz, CON2.nii.gz, and so on for control subjects, and PAT1.nii.gz, PAT2.nii.gz ... for pathological subjects. 

In the terminal, you must ensure to be in the root folder (cd ./root_folder). Then, run the script.
FreeSurfer (https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall) need to be installed before using the script.
