function [bins] = data_binning(nBins,spikeMat)

% This function bins spiketrain data

% nBins = number of bins
% spikeMat = matrix of spiketrains for binning

% For consistency with Madar et al., 2019 use:
% nBins = 200

% Syntax:
% [bins] = data_binning(200,spikeMat)

[x,y] =size(spikeMat);
for trialCount = 1:x
    for binCount=1:nBins-1
        %bins(trialCount,binCount) = sum(spikeMat(trialCount,(10*binCount)-9:10*binCount));
        bins(trialCount,binCount) = sum(spikeMat(trialCount,binCount:binCount+1));
    end
end
