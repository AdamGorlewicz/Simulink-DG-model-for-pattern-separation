function [spikeMat, crossCor, R] = poissonSpikeGen_random_input(fr, tSim, tBin, nTrials)

% This function 
% - generates random poisson distributions of spikes in a train
% - plots trains
% - bins spikes
% - computes cross correlation matrix and coefficient index

% fr = an average stimulus freq in Hz
% tSim = simulation time in s
% tBin = bin time in ms
% nTrials = number of spiketrains
% spikeMat = matrix of generated spiketrains
% tVec = time vector used for plotting
% crossCor = cross correlation matrix
% R = pearson correlation coefficient

% For consistency with Madar et al., 2019 use:

% fr = 10
% tSim = 2
% tBin = 10
% nTrials = 5

% Syntax:
% [x,y,z] = poisson_spike_generator(10,2,10,5);

dt = 1/1000; % s to ms
nBins = floor(tSim/dt);
spikeMat = rand(nTrials, nBins) < fr*dt;
tVec = 0:dt:tSim-dt;

figure('Name','Input spike trains','NumberTitle','off');
hold all;
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
for i = 1:nTrials+1
    labels{i} = num2str(i-1);
end
labels{nTrials+2} = [];
labels{1} = [];
yticklabels((labels));
xlabel('Time [s]')

crossCor = corrcoef(bins');

for trialCount = 1:nTrials
    factors{trialCount} = crossCor(trialCount+1:nTrials,trialCount);
end
R = mean(cell2mat(factors(:)));
figure('Name','Input corelation matrix','NumberTitle','off');
hold off
heatmap(crossCor,'Colormap', hot, 'CellLabelColor','none','ColorScaling','scaled','ColorLimits',[0 1]);
xlabel('Input Train #');
ylabel('Input Train #');
title(['Rinput = ' num2str(R)])