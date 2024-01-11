function [Pstruct,Hstruct] = plot_compute_stats(beforeColor, afterColor, isAfter, nChannels, ...
    nCol, nRow, myFontSize, myYLabel, idx, printFigs, figureName, data)
% Plots and computes statistics of a certain metric given by data
hFig = figure;
set(hFig, 'Name', figureName, 'color', 'w')
labels = categorical(isAfter);
labels(isAfter) = "after";
labels(~isAfter) = "before";
for iChannels=1:nChannels+1
    subplot(nRow, nCol, iChannels)
    if iChannels<=nChannels
        beforeData = data(~isAfter,iChannels);
        afterData = data(isAfter,iChannels);
        % idx2include = [3 4 6 10 12 13 15 17 18 19];
%         idx2include = 1:10;
%         afterData = afterData(idx2include);
        % labels = labels([1:9 end-5:end]);
        boxplot([afterData; beforeData], labels,  'Colors', [afterColor; beforeColor]);
        hold on;
        x1 = 2*ones([sum(labels=="before") 1]);
        x2 = ones([sum(labels=="after") 1]);
        h1 = scatter(x1,beforeData,'filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.15);
        h1.CData = beforeColor;
        h2 = scatter(x2,afterData,'filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.15);
        h2.CData = afterColor;
        if all(isnan(beforeData)) || all(isnan(afterData))
            Pstruct(iChannels).P = NaN;
            Hstruct(iChannels).H = 0;
        else
            [Pstruct(iChannels).P, Hstruct(iChannels).H] = signrank(beforeData, afterData);
        end
%         if iChannels == 5
%             ylabel(myYLabel, 'FontSize', myFontSize)
%         end
        title(sprintf('ch%d p=%0.3f', idx(iChannels),Pstruct(iChannels).P))
    else
        plot([0 0],[1 1], '-', 'Color', afterColor, 'LineWidth', 2)
        hold on
        plot([0 0],[1 1], ':', 'Color', beforeColor, 'LineWidth', 2)
        legend({'after' 'before'}, 'Location', 'EastOutside')
%         axis off
        ylabel(myYLabel, 'FontSize', myFontSize)
        set(gca, 'XTick', [], 'YTick', [])
    end
    set(gca,'FontSize', myFontSize)
end
% Specify window units
set(hFig, 'units', 'inches')
% Change figure and paper size
set(hFig, 'Position', [0.1 0.1 15 10])
set(hFig, 'PaperPosition', [0.1 0.1 15 10])
if printFigs
    print(hFig, '-dpng', figureName, sprintf('-r%d',300));
    close(hFig)
end
end

% EOF