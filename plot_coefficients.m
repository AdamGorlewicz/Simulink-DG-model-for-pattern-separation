function [] = plot_coefficients(coefficients)
figure('Name','Output correlation coefficients','NumberTitle','off');
[x,y] = size(coefficients);
boxplot(coefficients, 'Color', 'k');
hold on
scatter(ones(1,y),coefficients, 'MarkerFaceColor', [0 0.4470 0.7410], "MarkerEdgeColor", [0 0.4470 0.7410]);
xlabel(' ');
ylabel('Correlation coefficient'); 
set(gca,'XTick',[])
end

