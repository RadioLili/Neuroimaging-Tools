clc, clear;
names = {};
subjects = {};
values = [];
root_dir = uigetdir;
files_list = dir(root_dir);
files = {files_list.name};

% REFERENCE FILE
    file = files{1,4}; 
    To = load(strcat(root_dir,'/',file));
    [x , y] = size(To); s = x * y;

% SIZE VALIDATION     
for i = 5:length(files_list)
    file = files{1,i}; 
    T = load(strcat(root_dir,'/',file));
    [xi , yi] = size(T); si = xi * yi;
    
    if s ~= si
        msgbox('Todas las matrices deben tener las mismas dimensiones.','Error','warn');
        return
    end
    
end

% CREACIÓN ENCABEZADO
%values(1,1) = 0;
names{1,1} = 'SubjectID';
for i = 1 : x-1
    for j = 1 : x-1        
    names{1,end+1} = strcat('c',num2str(To(i+1,1)),'w', num2str(To(1,j+1))); 
    end
end


% MATRIZ FILLING
for k = 4 : length(files)
    subjects{k-3,1} = files{1,k};
    values(k-3,1) = k-3;  
    file_loop = files{1,k}; 
    Tloop = load(strcat(root_dir,'/',file_loop));
    % ELIMINO PRIMERA FILA Y PRIMERA COLUMNA
    Tloop(1,:) = [];
    Tloop(:,1) = [];
    [p , q] = size(Tloop);    
    for i = 1 : x 
        values(k-3,2:p*q+1) = reshape(Tloop,1,p*q);
    end
end

% CREATE A CELL ARRAY
results = array2table(values,'RowNames',subjects,'VariableNames',names);
% GENERACIÒN DE ARCHIVO EXCEL - CSV
writetable(results,'conn_table','WriteRowNames',true);
