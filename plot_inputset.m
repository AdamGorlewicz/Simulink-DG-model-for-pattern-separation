function [crossCor, Rinput] = plot_inputset(dataSet)

% Syntax:
% plot_inputset(dataSet);
[nTrials,y] = size(dataSet);
figure('Name','Input spike trains','NumberTitle','off');
spikeMat = logical(dataSet);
dt = 1/1000; % s to ms
tSim =2;
nBins = floor(tSim/dt);
tBin = 10;
tVec = 0:dt:tSim-dt;
hold all;
binning = 2000;
for trialCount = 1:nTrials
    spikePos = tVec(spikeMat(trialCount, :));
    for spikeCount = 1:length(spikePos)
        plot([spikePos(spikeCount) spikePos(spikeCount)], ...
            [trialCount-0.4 trialCount+0.4], 'k');
    end
    for binCount=1:floor(nBins/tBin)
        bins(trialCount,binCount) = sum(spikeMat(trialCount,(10*binCount)-9:10*binCount));   
    end
end
ylim([0 nTrials+1]);
ylabel('Input Train #')
set(gca, 'PlotBoxAspectRatio', [1 1 1]);
xlabel('Time [ms]');
ylabel('Input Train #'); 

bins = data_binning(binning,dataSet);
crossCor = corrcoef(bins');
for trialCount = 1:nTrials
    factors{trialCount} = crossCor(trialCount+1:nTrials,trialCount);
end
Rinput = mean(cell2mat(factors(:)));
figure('Name','Input corelation matrix','NumberTitle','off');
hold off
heatmap(crossCor,'Colormap', hot, 'CellLabelColor','none','ColorScaling','scaled','ColorLimits',[0 1]);
xlabel('Input Train #');
ylabel('Input Train #');
title(['Rinput = ' num2str(Rinput)])
end