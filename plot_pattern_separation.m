no_of_inputsets = 5;
figure('Name','Convergence/separation','NumberTitle','off');
for i=1:no_of_inputsets
scatter(repelem(input_correlation_coefficients{1,i},20),output_correlation_coefficients{1,i}, 'MarkerFaceColor', [0 0.4470 0.7410], "MarkerEdgeColor", [0 0.4470 0.7410])
hold on
plot(mean(repelem(input_correlation_coefficients{1,i},20)),mean(output_correlation_coefficients{1,i}), 'o', 'MarkerFaceColor', [0 0 0], "MarkerEdgeColor", [0 0 0])
end
x = [0 1];
y = [0 1];
line(x,y,'Color','k','LineStyle','--')
xlim([0 1]);
ylim([0 1]);
xlabel('Input Correlation (Rinput)');
ylabel('Output Correlation (Routput)');

for i=1:no_of_inputsets
mean2(i)= nanmean(output_correlation_coefficients{1,i});
SEM(i)= std(output_correlation_coefficients{1,i})/sqrt(length(output_correlation_coefficients{1,i})); 
end
errorbar(cell2mat(input_correlation_coefficients),mean2,SEM,'k')
hold off


figure('Name','Decorelation','NumberTitle','off');
for i=1:no_of_inputsets
input_output{i} = abs(output_correlation_coefficients{1,i}-input_correlation_coefficients{1,i});
mean3(i)= nanmean(input_output{i});
SEM2(i)= std(input_output{i})/sqrt(length(input_output{i})); 
end
errorbar(cell2mat(input_correlation_coefficients),mean3,SEM2,'k')

xlim([0 1]);
ylim([0 1]);
xlabel('Rinput');
ylabel('Decorrelation (Rinput - Routput)');

figure('Name','Decorelation','NumberTitle','off');
for i=1:no_of_inputsets
input_output_2{i} = (input_output{1,i}/input_correlation_coefficients{1,i})*100;
mean4(i)= nanmean(input_output_2{i});
SEM3(i)= std(input_output_2{i})/sqrt(length(input_output_2{i})); 
end
errorbar(cell2mat(input_correlation_coefficients),mean4,SEM3,'k')

xlim([0 1]);
ylim([0 100]);
xlabel('Rinput');
ylabel('Decorrelation / Rinput (%)');