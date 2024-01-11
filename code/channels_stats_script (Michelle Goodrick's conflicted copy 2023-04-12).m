% Computes statistics about the following HRF metrics on a channel-by-channel
% basis: peak value, time-to-peak, AUC, mean value, slope
% For the VFT task before/after
%% Load channel by channel data
clear; close all; clc
% check_homer_path
load ('..\data\channelData.mat')

%% General plotting settings
printFigs = false; % change as needed
myFontSize = 16;
myMarkerSize = 5;
nChannels = numel(longChannelsIdx);
nS   = sqrt(nChannels);
nCol = ceil(nS);
nRow = nCol - (nCol * nCol - nChannels > nCol - 1);
% Initialize structure
P(nChannels).peakHbOL = nan;
H(nChannels).peakHbOL = nan;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Peak amplitude Peak_HbO VFT before/after
% Colors
beforeColor = [1 0 1];
afterColor = [1 0 0];
myYLabel = '\Delta HbO (\muM\cdotmm)';
figureName = '..\figures\HbO_VFT_peak.png';
data = 1e6*HbOchannels.LmaxVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).peakHbOL] = currentP.P;
[H(:).peakHbOL] = currentH.H;

%% Peak amplitude Peak_HbR VFT before/after
beforeColor = [0 1 1];
afterColor = [0 0 1];
myYLabel = '\Delta HbR (\muM\cdotmm)';
figureName = '..\figures\HbR_VFT_peak.png';
data = 1e6*HbRchannels.LmaxVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).peakHbRL] = currentP.P;
[H(:).peakHbRL] = currentH.H;

%% Peak amplitude Peak_HbT VFT before/after
beforeColor = [0.00787401574803150,0.412505789717462,0.284113015284854];
afterColor = [0 1 0];
myYLabel = '\Delta HbT (\muM\cdotmm)';
figureName = '..\figures\HbT_VFT_peak.png';
data = 1e6*HbTchannels.LmaxVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).peakHbTL] = currentP.P;
[H(:).peakHbTL] = currentH.H;

%% AUC HbO VFT before/after
% Colors
beforeColor = [1 0 1];
afterColor = [1 0 0];
myYLabel = 'HbO AUC (\muM\cdotmm\cdots)';
figureName = '..\figures\HbO_VFT_AUC.png';
data = HbOchannels.LAUC;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).AUCHbOL] = currentP.P;
[H(:).AUCHbOL] = currentH.H;

%% AUC HbR VFT before/after
beforeColor = [0 1 1];
afterColor = [0 0 1];
myYLabel = 'HbR AUC (\muM\cdotmm\cdots)';
figureName = '..\figures\HbR_VFT_AUC.png';
data = HbRchannels.LAUC;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).AUCHbRL] = currentP.P;
[H(:).AUCHbRL] = currentH.H;

%% AUC HbT VFT before/after
beforeColor = [0.00787401574803150,0.412505789717462,0.284113015284854];
afterColor = [0 1 0];
myYLabel = 'HbT AUC (\muM\cdotmm\cdots)';
figureName = '..\figures\HbT_VFT_AUC.png';
data = HbTchannels.LAUC;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).AUCHbTL] = currentP.P;
[H(:).AUCHbTL] = currentH.H;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mean HbO VFT before/after
% Colors
beforeColor = [1 0 1];
afterColor = [1 0 0];
myYLabel = 'HbO mean (\muM\cdotmm)';
figureName = '..\figures\HbO_VFT_meanVal.png';
data = 1e6*HbOchannels.LmeanVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).meanValHbOL] = currentP.P;
[H(:).meanValHbOL] = currentH.H;

%% Mean HbR VFT before/after
beforeColor = [0 1 1];
afterColor = [0 0 1];
myYLabel = 'HbR mean (\muM\cdotmm)';
figureName = '..\figures\HbR_VFT_meanVal.png';
data = 1e6*HbRchannels.LmeanVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).meanValHbRL] = currentP.P;
[H(:).meanValHbRL] = currentH.H;

%% Mean HbT VFT before/after
beforeColor = [0.00787401574803150,0.412505789717462,0.284113015284854];
afterColor = [0 1 0];
myYLabel = 'HbT mean (\muM\cdotmm)';
figureName = '..\figures\HbT_VFT_meanVal.png';
data = 1e6*HbTchannels.LmeanVal;
[currentP, currentH] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, longChannelsIdx, printFigs, figureName, data);
[P(:).meanValHbTL] = currentP.P;
[H(:).meanValHbTL] = currentH.H;


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Print and create tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VFT before/after
fprintf('HbO_L Peak \t  AUC \t Mean \t \n')
disp([P(:).peakHbOL; P(:).AUCHbOL; P(:).meanValHbOL]')
fprintf('HbR_L Peak \t  AUC \t Mean \t \n')
disp([P(:).peakHbRL; P(:).AUCHbRL; P(:).meanValHbRL]')
fprintf('HbT_L Peak \t  AUC \t Mean \t \n')
disp([P(:).peakHbTL; P(:).AUCHbTL; P(:).meanValHbTL]')

VFT_stats = ...
    [P(:).peakHbOL; P(:).peakHbRL; P(:).peakHbTL; ...
    P(:).AUCHbOL; P(:).AUCHbRL; P(:).AUCHbTL; P(:).meanValHbOL; P(:).meanValHbRL; P(:).meanValHbTL]';


%% FDR correction
nStats = size(VFT_stats,2);
VFT_stats_FDR = nan(size(VFT_stats));
for iStats=1:nStats
    VFT_stats_FDR(:,iStats) = ioi_fdr(VFT_stats(:,iStats));
end

%% Save statistics
save ('..\data\channelStats.mat')
disp('channel-by-channel stats done!')
% EOF