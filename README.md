# tools
Tools for organizing, processing, and visualizing neuroimaging data.
mat2tab is a simple MATLAB-based script that allows to extract one single table with the results of the connectivity matrix of n subjects (or n groups of subjects) obtained with Brainsuite for further statistical analysis.

Once you have completed the Brainsuite process (http://brainsuite.org/processing/), and then the connectivity calculation (http://brainsuite.org/tutorials/dtiexercise/), you are able to export the connectivity matrix for all cortical or brain areas. 

Steps.
1. Organize a folder with all the connectivity files inside, and rename each file with a code or a name (this will be use as reference for each matrix as subject ID).
2. Run the script, it will ask for a folder, select the folder created before.
3. You will get a file with all the connectivity values for all subjects. The names of the columns have a format such as 'c120w164', with means connectivity between 120 and 164 areas. Information of labels is in the brainsuite_labeldescription file.
4. If you are going to analyze groups, it is recommended to use filenames such as CON1, CON2, CON3, for control group for instance, and PAT1, PAT2, PAT3 for patologic group.
5. I wrote this script because I need it, and I share it here, because somebody else may need it. Any questions, don't hesitate to write me.
6. I'm working with a MAC computer, if you are a windows or linux user, please edit the code (line 38), and change the number 4 for number 3, this is for delete the '.' '..' 'ds.store' files from dir variable, sorry.
