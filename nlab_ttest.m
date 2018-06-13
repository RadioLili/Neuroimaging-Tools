% nlab_ttest is an script that returns the results of two-sample t-test, or
% mann-whitney test, taking into account if the normal distribution for both 
% groups are met or not. 

% Organize your data:
% 1. First column MUST BE values 0 or 1 (0 for the data of the first group, 
% and 1 for the data of the second group).
% 2. Groups should be equal in number.
% 3. The result h (lilietest [0 = both groups are normally distributed; 1 = at 
% least one group is not normally distributed]).
% 4. Results (h and p-value) about t-test and mann-whitney test are also reported, 
% h is 1 if the test rejects the null hypothesis at the 5% significance level, 
% and 0 otherwise.
% 5. Average/Median, Min, Max and Standard Deviation are also reported. 

clear, clc;

[filename, pathname] = uigetfile({'*.txt; *.xls; *.xlsx; *.csv'}, 'Select the file');
data_t = readtable(fullfile(pathname,filename));
data_t_shorted = sortrows(data_t,1);
data = table2array(data_t_shorted);
results = [0; 0; 0; 0; 0; 0; 0; 0; 0];

[x , y] = size(data);

% DATA SEGMENTED FOR GROUPS GR0 AND GR1
gr0_rows = data(:, 1) < 1;
gr0_data = data(gr0_rows, :);

gr1_rows = data(:, 1) > 0;
gr1_data = data(gr1_rows, :);

for i = 2 : y
    gr0_col = gr0_data(:, i);
    gr1_col = gr1_data(:, i);
    
    % NORMAL DISTRIBUTION TEST
    norm_gr0 = lillietest(gr0_col);
    norm_gr1 = lillietest(gr1_col);
    
    % IF BOTH GROUPS ARE NORMALLY DISTRIBUTED:
    if norm_gr0 == 0 && norm_gr1 == 0
        norm_gr = 0;
        [h, p] = ttest2(gr0_col, gr1_col);
        % MEAN CALCULATION
        gr0_mean = mean(gr0_col);
        gr1_mean = mean(gr1_col);
        % STANDARD DEVIATION CALCULATION
        gr0_std = std(gr0_col);
        gr1_std = std(gr1_col);
    else
        norm_gr = 1;
        [p, h] = ranksum(gr0_col, gr1_col);
        % MEAN CALCULATION
        gr0_mean = median(gr0_col);
        gr1_mean = median(gr1_col);
        % STANDARD DEVIATION CALCULATION
        gr0_std = std(gr0_col);
        gr1_std = std(gr1_col);
    end
    
    % MIN CALCULATION
    gr0_min = min(gr0_col);
    gr1_min = min(gr1_col);
    % MAX CALCULATION
    gr0_max = max(gr0_col);
    gr1_max = max(gr1_col);
    
    % VECTOR CREATION
    results = [results [gr0_mean; gr0_min; gr0_max; gr1_mean; gr1_min; gr1_max; norm_gr; h; p]];
end
 
var_names = data_t.Properties.VariableNames;
var_names_1 = char(var_names(1));
var_names_2 = char(var_names(2));
var_names_3 = char(var_names(3));
names = {'Gr0 Avg/Med'; 'Gr0 Min'; 'Gr0 Max'; 'Gr1 Avg/Med'; 'Gr1 Min'; 'Gr1 Max'; 'h (Lillietest)'; 'h (Ttest)'; 'p-value (Ttest)'};
results(:,1) = [];
results = [names num2cell(results)];

export_results = [var_names;table2cell(data_t_shorted);results];
xlswrite('results.xls',export_results)

