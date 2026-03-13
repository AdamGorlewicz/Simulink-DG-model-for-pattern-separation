function [] = cross_correlation_matrix(crossCor, inputtrials, iterations)

% This function computes cross correlation matrix and coefficient index of binned data

% bins = matrix of binned spiketrains

% Syntax:
% cross_correlation_matrix(inputtrials, iterations, crossCor)
[Rotp]= Routput(inputtrials, iterations, crossCor);
R = Rotp;

figure('Name','Correlation Coeficients','NumberTitle','off');
hold off
h=heatmap(crossCor,'Colormap', hot, 'CellLabelColor','none','ColorScaling','scaled','ColorLimits',[0 1]);
xlabel('Output Subsets');
ylabel('Output Subsets');
title(['Routput = ' num2str(R)]);
h.XDisplayLabels = ["" "Inputs" "" "" "" "" "" "" "" "" "" "#1" "" "" "" "" "" "" "" "" "" "#2" "" "" "" "" "" "" "" "" "" "#3" "" "" "" "" "" "" "" "" "" "#4" "" "" "" "" "" "" "" "" "" "#5" "" "" ""];
h.YDisplayLabels = ["" "Inputs" "" "" "" "" "" "" "" "" "" "#1" "" "" "" "" "" "" "" "" "" "#2" "" "" "" "" "" "" "" "" "" "#3" "" "" "" "" "" "" "" "" "" "#4" "" "" "" "" "" "" "" "" "" "#5" "" "" ""];
end