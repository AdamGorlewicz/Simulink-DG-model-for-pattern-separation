function [Rotp] = cross_corr_2(dataset)

inputtrials = 4;
iterations =10;
 
crossCor = corrcoef(dataset');

test1 = reshape(crossCor(inputtrials+1:inputtrials+iterations,inputtrials+1+iterations:end).',1,[]);
test2 = reshape(crossCor(inputtrials+1+(iterations*1):(inputtrials+(iterations*2)),inputtrials+1+(iterations*2):end).',1,[]);
test3 = reshape(crossCor(inputtrials+1+(iterations*2):(inputtrials+(iterations*3)),inputtrials+1+(iterations*3):end).',1,[]);
test4 = reshape(crossCor(inputtrials+1+(iterations*3):(inputtrials+(iterations*4)),inputtrials+1+(iterations*4):end).',1,[]);
test =[test1,test2,test3,test4];
Rotp = nanmean(test);

R = Rotp;

figure('Name','Correlation Coeficients','NumberTitle','off');
hold off
h=heatmap(crossCor,'Colormap', hot, 'CellLabelColor','none','ColorScaling','scaled','ColorLimits',[0 1]);
xlabel('Output Subsets');
ylabel('Output Subsets');
title(['Routput = ' num2str(R)]);
h.XDisplayLabels = ["" "Input" "" "" "" "" "" "" "" "" "" "#1" "" "" "" "" "" "" "" "" "" "#2" "" "" "" "" "" "" "" "" "" "#3" "" "" "" "" "" "" "" "" "" "#4" "" "" "" "" "" "" "" "" "" "#5" "" "" ""];
h.YDisplayLabels = ["" "Input" "" "" "" "" "" "" "" "" "" "#1" "" "" "" "" "" "" "" "" "" "#2" "" "" "" "" "" "" "" "" "" "#3" "" "" "" "" "" "" "" "" "" "#4" "" "" "" "" "" "" "" "" "" "#5" "" "" ""];
end