function [] = plot_dataset(dataSet)

% Syntax:
% plot_dataset(dataSet);
figure('Name','Dataset','NumberTitle','off');
spy(dataSet,7);
set(gca, 'PlotBoxAspectRatio', [1 1 1]);
title('');
xlabel('Time [ms]');
ylabel('Output subsets');
yticks([2 10 20 30 40 50]);
yticklabels({'Input Set', '#1', '#2', '#3', '#4', '#5'});
end

