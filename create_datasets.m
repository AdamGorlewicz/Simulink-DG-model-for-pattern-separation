function [output_datasets,output_correlation_matrices, output_correlation_coefficients] = create_datasets(simulation_result, inputsets, inputtrials, iterations, no_inputsets)

datasets = {};
output_correlation_matrices = {};
output_coefficients = [];
binning = 2000; %for consistency with Madjar use 200(10 ms)

% cell1 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell1_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{1} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{1})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{1} = Rotp;
end

% cell2 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell2_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{2} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{2})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{2} = Rotp;
end

% cell3 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell3_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{3} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{3})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{3} = Rotp;
end

% cell4 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell4_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{4} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{4})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{4} = Rotp;
end

% cell5 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell5_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{5} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{5})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{5} = Rotp;
end

% cell6 dataset
for no_input = 1:no_inputsets
for repeat = 1:iterations
for trace = 1:inputtrials 
subsets = simulation_result{no_input,repeat}(1,trace).granulecell6_rasterplot;
dataset{trace}(repeat,:) = subsets;
end
end
output_datasets{no_input}{6} = cat(1,inputsets{no_input},cell2mat(dataset'));
crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{6})');
output_correlation_matrices{no_input} = crossCor;
[Rotp]= Routput(inputtrials, iterations, crossCor);
output_correlation_coefficients{no_input}{6} = Rotp;
end

% cell7 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell7_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{7} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{7})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{7} = Rotp;
end

% cell8 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell8_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{8} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{8})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{8} = Rotp;
end

% cell9 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell9_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{9} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{9})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{9} = Rotp;
end

% cell10 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell10_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{10} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{10})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{10} = Rotp;
end

% cell11 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell11_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{11} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{11})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{11} = Rotp;
end

% cell12 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell12_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{12} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{12})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{12} = Rotp;
end

% cell13 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell13_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{13} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{13})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{13} = Rotp;
end

% cell14 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell14_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{14} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{14})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{14} = Rotp;
end

% cell15 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell15_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{15} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{15})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{15} = Rotp;
end

% cell16 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell16_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{16} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{16})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{16} = Rotp;
end

% cell17 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell17_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{17} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{17})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{17} = Rotp;
end

% cell18 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell18_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{18} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{18})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{18} = Rotp;
end

% cell19 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell19_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{19} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{19})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{19} = Rotp;
end

% cell20 dataset
for no_input = 1:no_inputsets
    for repeat = 1:iterations
        for trace = 1:inputtrials 
            subsets = simulation_result{no_input,repeat}(1,trace).granulecell20_rasterplot;
            dataset{trace}(repeat,:) = subsets;
        end
    end
    output_datasets{no_input}{20} = cat(1,inputsets{no_input},cell2mat(dataset'));
    crossCor = corrcoef(data_binning(binning,output_datasets{no_input}{20})');
    output_correlation_matrices{no_input} = crossCor;
    [Rotp]= Routput(inputtrials, iterations, crossCor);
    output_correlation_coefficients{no_input}{20} = Rotp;
end

for no_input = 1:no_inputsets
output_correlation_coefficients{1, no_input} = cell2mat(output_correlation_coefficients{1, no_input});
end