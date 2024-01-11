%% Plots average HRF for all channles in VFT task, before Yoga and after Yoga
% This the second script to run (2/3)
%% Load channel by channel data
clear; close all; clc
% check_homer_path
load ('..\data\channelData.mat')
% Colors
beforeColor = [1 0 1];
afterColor = [1 0 0];
myFontSize = 16;
myMarkerSize = 5;
printFigs = true;
nChannels = numel(longChannelsIdx);
nS   = sqrt(nChannels);
nCol = ceil(nS);
nRow = nCol - (nCol * nCol - nChannels > nCol - 1);
stderror = @(x) std(x)./sqrt(size(x,1));

%% Plot group-averaged hemodynamic response (HbO L condition)
hHbOL=figure; set(hHbOL, 'color', 'w', 'Name', 'HbO VFT')
myYlims = [-40 100];        % Change as needed
for iChannels=1:nChannels+1
    subplot(nRow, nCol, iChannels)
    hold on
    if iChannels<=nChannels
    % stdErr = @(x) std(x)./numel(x);
    hCtl = shadedErrorBar(timeVector, 1e6*squeeze(HbOchannels.L(~isAfter,iChannels,:)),{@nanmean, stderror},':', 1);

    hCtl.mainLine.Color = beforeColor;
    hCtl.edge(1).Color = beforeColor;
    hCtl.edge(2).Color = beforeColor;
    if ~isempty(hCtl.patch)
        hCtl.patch.FaceColor = beforeColor;
    end
    hCtl.mainLine.LineWidth = 2;
    hPD = shadedErrorBar(timeVector, 1e6*squeeze(HbOchannels.L(isAfter,iChannels,:)),{@nanmean,stderror},'-', 1);
    hPD.mainLine.Color = afterColor;
    hPD.edge(1).Color = afterColor;
    hPD.edge(2).Color = afterColor;
    if ~isempty(hPD.patch)
        hPD.patch.FaceColor = afterColor;
    end
    hPD.mainLine.LineWidth = 2;
    if iChannels == nChannels
        xlabel('Time (s)', 'FontSize', myFontSize)
    end
    if iChannels == 6
        ylabel('\Delta HbO (\muM\cdotmm)', 'FontSize', myFontSize)
    end
    title(sprintf('Ch %d', longChannelsIdx(iChannels)))
    else
        plot([0 0],[1 1], '-', 'Color', afterColor, 'LineWidth', 2)
        hold on
        plot([0 0],[1 1], ':', 'Color', beforeColor, 'LineWidth', 2)
        legend({'after' 'before'}, 'Location', 'WestOutside')
        axis off
    end
    set(gca,'FontSize',myFontSize-1)
    axis tight;
    ylim(myYlims);
end
% Specify window units
set(hHbOL, 'units', 'inches')
% Change figure and paper size
set(hHbOL, 'Position', [0.1 0.1 15 10])
set(hHbOL, 'PaperPosition', [0.1 0.1 15 10])
if printFigs
    print(hHbOL, '-dpng', '..\figures\HbO_VFT_group_avg.png', sprintf('-r%d',300));
end

%% Plot group-averaged hemodynamic response (HbR L condition)
beforeColor = [0 1 1];
afterColor = [0 0 1];
hHbRL=figure; set(hHbRL, 'color', 'w', 'Name', 'HbR VFT')
myYlims = [-40 100];        % Change as needed
for iChannels=1:nChannels+1
    subplot(nRow, nCol, iChannels)
    hold on
    if iChannels<=nChannels
    % stdErr = @(x) std(x)./numel(x);
    hCtl = shadedErrorBar(timeVector, 1e6*squeeze(HbRchannels.L(~isAfter,iChannels,:)),{@nanmean, stderror},':', 1);
    hCtl.mainLine.Color = beforeColor;
    hCtl.edge(1).Color = beforeColor;
    hCtl.edge(2).Color = beforeColor;
	if ~isempty(hCtl.patch)
        hCtl.patch.FaceColor = beforeColor;
    end
    hCtl.mainLine.LineWidth = 2;
    hPD = shadedErrorBar(timeVector, 1e6*squeeze(HbRchannels.L(isAfter,iChannels,:)),{@nanmean,stderror},'-', 1);
    hPD.mainLine.Color = afterColor;
    hPD.edge(1).Color = afterColor;
    hPD.edge(2).Color = afterColor;
    if ~isempty(hPD.patch)
        hPD.patch.FaceColor = afterColor;
    end
    hPD.mainLine.LineWidth = 2;
    if iChannels == nChannels
        xlabel('Time (s)', 'FontSize', myFontSize)
    end
    if iChannels == 6
        ylabel('\Delta HbR (\muM\cdotmm)', 'FontSize', myFontSize)
    end
    title(sprintf('Ch %d', longChannelsIdx(iChannels)))
    else
        plot([0 0],[1 1], '-', 'Color', afterColor, 'LineWidth', 2)
        hold on
        plot([0 0],[1 1], ':', 'Color', beforeColor, 'LineWidth', 2)
        legend({'after' 'before'}, 'Location', 'WestOutside')
        axis off
    end
    set(gca,'FontSize',myFontSize-1)
    axis tight;
    ylim(myYlims);
end
% Specify window units
set(hHbRL, 'units', 'inches')
% Change figure and paper size
set(hHbRL, 'Position', [0.1 0.1 15 10])
set(hHbRL, 'PaperPosition', [0.1 0.1 15 10])
if printFigs
    print(hHbRL, '-dpng', '..\figures\HbR_VFT_group_avg.png', sprintf('-r%d',300));
end

%% Plot group-averaged hemodynamic response (HbT L condition)
beforeColor = [0.00787401574803150,0.412505789717462,0.284113015284854];
afterColor = [0 1 0];
hHbTL=figure; set(hHbTL, 'color', 'w', 'Name', 'HbT VFT')
myYlims = [-40 100];    % Change as needed
for iChannels=1:nChannels+1
    subplot(nRow, nCol, iChannels)
    hold on
    if iChannels<=nChannels
    % Spectra (mean +- s.d.) are offset for clarity
    % stdErr = @(x) std(x)./numel(x);
    hCtl = shadedErrorBar(timeVector, 1e6*squeeze(HbRchannels.L(~isAfter,iChannels,:)),{@nanmean, stderror},':', 1);
    hCtl.mainLine.Color = beforeColor;
    hCtl.edge(1).Color = beforeColor;
    hCtl.edge(2).Color = beforeColor;
    if ~isempty(hCtl.patch)
        hCtl.patch.FaceColor = beforeColor;
    end
    hCtl.mainLine.LineWidth = 2;
    hPD = shadedErrorBar(timeVector, 1e6*squeeze(HbRchannels.L(isAfter,iChannels,:)),{@nanmean,stderror},'-', 1);
    hPD.mainLine.Color = afterColor;
    hPD.edge(1).Color = afterColor;
    hPD.edge(2).Color = afterColor;
    if ~isempty(hPD.patch)
        hPD.patch.FaceColor = afterColor;
    end
    hPD.mainLine.LineWidth = 2;
    if iChannels == nChannels
        xlabel('Time (s)', 'FontSize', myFontSize)
    end
    if iChannels == 6
        ylabel('\Delta HbT (\muM\cdotmm)', 'FontSize', myFontSize)
    end
    title(sprintf('Ch %d', longChannelsIdx(iChannels)))
    else
        plot([0 0],[1 1], '-', 'Color', afterColor, 'LineWidth', 2)
        hold on
        plot([0 0],[1 1], ':', 'Color', beforeColor, 'LineWidth', 2)
        legend({'after' 'before'}, 'Location', 'WestOutside')
        axis off
    end
    set(gca,'FontSize',myFontSize-1)
    axis tight;
    ylim(myYlims);
end
% Specify window units
set(hHbTL, 'units', 'inches')
% Change figure and paper size
set(hHbTL, 'Position', [0.1 0.1 15 10])
set(hHbTL, 'PaperPosition', [0.1 0.1 15 10])
if printFigs
    print(hHbTL, '-dpng', '..\figures\HbT_VFT_group_avg.png', sprintf('-r%d',300));
end

disp('HRF plots done!')
% EOF