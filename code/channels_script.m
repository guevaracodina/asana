%% For VFT task: This script retrieves data from Homer3 structures, organizes it
% per task and computes a given metric from the estimated HRF
% This the first script to run (1/3)
%% Clear space
clear; close all; clc
% check_homer_path

%% Prefrontal cortex template
% Brite Frontal with 22 long channels and 2 short separation channels using
% 8 Rx and 10 Tx (for Homer Export)
[idxL, idxR] = get_channels_from_template('prefrontal');
% Only include long channels (exclude short-separation channels SSC)
longChannelsIdx = [idxL, idxR];

%% List of files with the subject-specific HRF (Change as needed!)
% Verbal Fluency Task Before Yoga
fileList{01} = '..\VFT_Group_Before\derivatives\homer\PilotYoga01\VFT 1.mat';
fileList{02} = '..\VFT_Group_Before\derivatives\homer\PilotYoga02\Verbal Test 1 Jose Luis.mat';
fileList{03} = '..\VFT_Group_Before\derivatives\homer\PilotYoga03\Verbal Test 1 Jesus Alcalar.mat';
fileList{04} = '..\VFT_Group_Before\derivatives\homer\PilotYoga04\Verbal 1 Sofi.mat';
fileList{05} = '..\VFT_Group_Before\derivatives\homer\PilotYoga05\VFT_1_Alicia.mat';
fileList{06} = '..\VFT_Group_Before\derivatives\homer\PilotYoga06\VFT_1 Magda.mat';
fileList{07} = '..\VFT_Group_Before\derivatives\homer\PilotYoga07\VFT_1 Maria del Carmen (2).mat';
fileList{08} = '..\VFT_Group_Before\derivatives\homer\PilotYoga08\VFT_1 Monica.mat';
fileList{09} = '..\VFT_Group_Before\derivatives\homer\PilotYoga09\VFT_1 Montse Michelle Goodrick.mat';
fileList{10} = '..\VFT_Group_Before\derivatives\homer\PilotYoga10\VFT_1 Vannessa.mat';
fileList{11} = '..\VFT_Group_Before\derivatives\homer\PilotYoga11\VFT_Samantha_1.mat';
fileList{12} = '..\VFT_Group_Before\derivatives\homer\PilotYoga12\VFT_1 Lys.mat';
fileList{13} = '..\VFT_Group_Before\derivatives\homer\PilotYoga13\VFT_1 Diana.mat';
fileList{14} = '..\VFT_Group_Before\derivatives\homer\PilotYoga14\VFT_1 Daniel.mat';
fileList{15} = '..\VFT_Group_Before\derivatives\homer\PilotYoga15\VFT_1 Karla.mat';
fileList{16} = '..\VFT_Group_Before\derivatives\homer\PilotYoga17\1_VFT Mimi.mat';
fileList{17} = '..\VFT_Group_Before\derivatives\homer\PilotYoga18\1_VFT Maria Dani.mat';
fileList{18} = '..\VFT_Group_Before\derivatives\homer\PilotYoga19\1_VFT Flor.mat';
fileList{19} = '..\VFT_Group_Before\derivatives\homer\PilotYoga20\1_VFT Jenny.mat';
fileList{20} = '..\VFT_Group_Before\derivatives\homer\PilotYoga21\1_VFT Martha.mat';
fileList{21} = '..\VFT_Group_Before\derivatives\homer\PilotYoga22\1_VFT Darianne.mat';
fileList{22} = '..\VFT_Group_Before\derivatives\homer\PilotYoga23\1_VFT Claudia.mat';
fileList{23} = '..\VFT_Group_Before\derivatives\homer\PilotYoga24\1_VFT Ale.mat';
fileList{24} = '..\VFT_Group_Before\derivatives\homer\PilotYoga25\1_VFT Victor.mat';
fileList{25} = '..\VFT_Group_Before\derivatives\homer\PilotYoga26\1_VFT Miguel.mat';
fileList{26} = '..\VFT_Group_Before\derivatives\homer\PilotYoga27\1_VFT Almendra.mat';
fileList{27} = '..\VFT_Group_Before\derivatives\homer\PilotYoga28\1_VFT Sinhue.mat';
fileList{28} = '..\VFT_Group_Before\derivatives\homer\PilotYoga29\1_VFT Monica D.mat';
fileList{29} = '..\VFT_Group_Before\derivatives\homer\PilotYoga30\1_VFT Jesus.mat';
fileList{30} = '..\VFT_Group_Before\derivatives\homer\PilotYoga31\1_VFT Patty.mat';

% Verbal Fluency Task After Yoga
fileList{31} = '..\VFT_Group_After\derivatives\homer\PilotYoga01\VFT 2 Edgar.mat';
fileList{32} = '..\VFT_Group_After\derivatives\homer\PilotYoga02\Verbal Test 2 Jose Luis.mat';
fileList{33} = '..\VFT_Group_After\derivatives\homer\PilotYoga03\Verbal Test 2 Jesus Alcalar.mat';
fileList{34} = '..\VFT_Group_After\derivatives\homer\PilotYoga04\Verbal 2 Sofi.mat';
fileList{35} = '..\VFT_Group_After\derivatives\homer\PilotYoga05\VFT_2.mat';
fileList{36} = '..\VFT_Group_After\derivatives\homer\PilotYoga06\VFT_2 Magda.mat';
fileList{37} = '..\VFT_Group_After\derivatives\homer\PilotYoga07\VFT_2 Maria del Carmen.mat';
fileList{38} = '..\VFT_Group_After\derivatives\homer\PilotYoga08\VFT_2 Monica.mat';
fileList{39} = '..\VFT_Group_After\derivatives\homer\PilotYoga09\VFT_2 Montse Michelle Goodrick.mat';
fileList{40} = '..\VFT_Group_After\derivatives\homer\PilotYoga10\VFT_2 Vannesa.mat';
fileList{41} = '..\VFT_Group_After\derivatives\homer\PilotYoga11\VFT_2_Samantha.mat';
fileList{42} = '..\VFT_Group_After\derivatives\homer\PilotYoga12\VFT_2 Lys.mat';
fileList{43} = '..\VFT_Group_After\derivatives\homer\PilotYoga13\2_VFT Diana.mat';
fileList{44} = '..\VFT_Group_After\derivatives\homer\PilotYoga14\2_VFT Daniel.mat';
fileList{45} = '..\VFT_Group_After\derivatives\homer\PilotYoga15\2_VFT Karla.mat';
fileList{46} = '..\VFT_Group_After\derivatives\homer\PilotYoga17\2_VFT Mimi.mat';
fileList{47} = '..\VFT_Group_After\derivatives\homer\PilotYoga18\2_VFT Maria Dani.mat';
fileList{48} = '..\VFT_Group_After\derivatives\homer\PilotYoga19\2_VFT Flor.mat';
fileList{49} = '..\VFT_Group_After\derivatives\homer\PilotYoga20\2_VFT Jenny.mat';
fileList{50} = '..\VFT_Group_After\derivatives\homer\PilotYoga21\2_VFT Martha.mat';
fileList{51} = '..\VFT_Group_After\derivatives\homer\PilotYoga22\2_VFT Darianne.mat';
fileList{52} = '..\VFT_Group_After\derivatives\homer\PilotYoga23\2_VFT Claudi.mat';
fileList{53} = '..\VFT_Group_After\derivatives\homer\PilotYoga24\2_VFT Ale.mat';
fileList{54} = '..\VFT_Group_After\derivatives\homer\PilotYoga25\2_VFT Victor.mat';
fileList{55} = '..\VFT_Group_After\derivatives\homer\PilotYoga26\2_VFT Miguel.mat';
fileList{56} = '..\VFT_Group_After\derivatives\homer\PilotYoga27\2_VFT Almendra.mat';
fileList{57} = '..\VFT_Group_After\derivatives\homer\PilotYoga28\2_VFT Sinhue.mat';
fileList{58} = '..\VFT_Group_After\derivatives\homer\PilotYoga29\2_VFT Monica D.mat';
fileList{59} = '..\VFT_Group_After\derivatives\homer\PilotYoga30\2_VFT Jesus.mat';
fileList{60} = '..\VFT_Group_After\derivatives\homer\PilotYoga31\2_VFT Patty.mat';
% Labels vector, true if files is after yoga, else false.
isAfter = [false([30 1]); true([30 1])];    % Change as needed
nFiles = numel(fileList);
nLongChannels = numel(longChannelsIdx);

%% Extract channels data (HbO/HbR/HbT)
nTimeSamples = 926;     % Change as needed (depending on HRF duration)
for iFiles = 1:nFiles
    load(fileList{iFiles});
    if iFiles==1
        HbOchannels.L = nan([nFiles, nLongChannels, nTimeSamples]);
        HbRchannels.L = nan([nFiles, nLongChannels, nTimeSamples]);
        HbTchannels.L = nan([nFiles, nLongChannels, nTimeSamples]);
    end
    if size(output.dcAvg.dataTimeSeries,1) ~= nTimeSamples
        % Then resample to have the same number as the rest: nTimeSamples samples
        resamplingFactor = round(size(output.dcAvg.dataTimeSeries,1)/nTimeSamples);
        channelData = resample(output.dcAvg.dataTimeSeries,1,resamplingFactor);
    else
        channelData = output.dcAvg.dataTimeSeries;
        timeVector = output.dcAvg.time;
    end
    for iChannels=1:nLongChannels
        for offSet = 1:3         % OffSet = 1 for HbO, 2 for HbR & 3 for HbT
            idxReal = (longChannelsIdx(iChannels)-1)*3+offSet;
            switch offSet
                case 1 % HbO
                    if size(channelData,2)==72      % Check what happens with 'before' group //EGC TO DO!
%                     if ~all(isnan(channelData(:,1)))
                        HbOchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    else
                        HbOchannels.L(iFiles,iChannels, :) = channelData(:,72+idxReal).';
%                          HbOchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    end
                    
                case 2 % HbR
                    if size(channelData,2)==72
%                     if ~all(isnan(channelData(:,1)))
                        HbRchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    else
                        HbRchannels.L(iFiles,iChannels, :) = channelData(:,72+idxReal).';
%                         HbRchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    end
                    
                case 3 % HbT
                    if size(channelData,2)==72
%                     if ~all(isnan(channelData(:,1)))
                        HbTchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    else
                        HbTchannels.L(iFiles,iChannels, :) = channelData(:,72+idxReal).';
%                         HbTchannels.L(iFiles,iChannels, :) = channelData(:,idxReal).';
                    end
            end
            measurementList{iChannels, offSet} = sprintf('S%d D%d %s\n', ...
                output.dcAvg.measurementList(idxReal).sourceIndex, ...
                output.dcAvg.measurementList(idxReal).detectorIndex, ...
                output.dcAvg.measurementList(idxReal).dataTypeLabel);
        end
    end
end

% HbXchannels.L contains the average HRF per channel, per
% subject, organized as follows: (nSubjects, nChannelsPerSide, nSamples)

%% Compute HRF metrics: maxVal, timeToMax, meanVal and AUC
timeRange = [25 30];   % Original 0.5-15, Change as needed!
for offSet = 1:3         % OffSet = 1 for HbO, 2 for HbR & 3 for HbT
    for iFiles = 1:nFiles
        for iChannels=1:nLongChannels
            switch offSet
                case 1 % HbO
                    idxRange = find(timeVector>=timeRange(1), 1):find(timeVector>=timeRange(2), 1);
                    [HbOchannels.LmaxVal(iFiles,iChannels), idx] = nanmax(HbOchannels.L(iFiles,iChannels,idxRange));
                    HbOchannels.LtimeToMax(iFiles,iChannels) = timeVector(idx+idxRange(1));
                    idxRange(2) = idx;
                    HbOchannels.LmeanVal(iFiles,iChannels) = nanmean(HbOchannels.L(iFiles,iChannels,idxRange));
                    HbOchannels.LAUC(iFiles,iChannels) = trapz(HbOchannels.L(iFiles,iChannels,idxRange));
                    HbOchannels.Lslope(iFiles,iChannels) = HbOchannels.LmaxVal(iFiles,iChannels)/HbOchannels.LtimeToMax(iFiles,iChannels);
                case 2 % HbR
                    % condition L
                    idxRange = find(timeVector>=timeRange(1), 1):find(timeVector>=timeRange(2), 1);
                    [HbRchannels.LmaxVal(iFiles,iChannels), idx] = nanmin(HbRchannels.L(iFiles,iChannels,idxRange));
                    HbRchannels.LtimeToMax(iFiles,iChannels) = timeVector(idx+idxRange(1));
                    idxRange(2) = idx;
                    HbRchannels.LmeanVal(iFiles,iChannels) = nanmean(HbRchannels.L(iFiles,iChannels,idxRange));
                    HbRchannels.LAUC(iFiles,iChannels) = trapz(HbRchannels.L(iFiles,iChannels,idxRange));
                    HbRchannels.Lslope(iFiles,iChannels) = HbRchannels.LmaxVal(iFiles,iChannels)/HbRchannels.LtimeToMax(iFiles,iChannels);
                case 3 % HbT
                    % condition L
                    idxRange = find(timeVector>=timeRange(1), 1):find(timeVector>=timeRange(2), 1);
                    [HbTchannels.LmaxVal(iFiles,iChannels), idx] = nanmax(HbTchannels.L(iFiles,iChannels,idxRange));
                    HbTchannels.LtimeToMax(iFiles,iChannels) = timeVector(idx+idxRange(1));
                    idxRange(2) = idx;
                    HbTchannels.LmeanVal(iFiles,iChannels) = nanmean(HbTchannels.L(iFiles,iChannels,idxRange));
                    HbTchannels.LAUC(iFiles,iChannels) = trapz(HbTchannels.L(iFiles,iChannels,idxRange));
                    HbTchannels.Lslope(iFiles,iChannels) = HbTchannels.LmaxVal(iFiles,iChannels)/HbTchannels.LtimeToMax(iFiles,iChannels);
            end
        end
    end
end
% 5 metrics x 22 channels = 110 columns, 20 subjects = 20 rows
HbOdata.L = [HbOchannels.LmaxVal HbOchannels.LtimeToMax HbOchannels.LmeanVal HbOchannels.LAUC HbOchannels.Lslope];
HbRdata.L = [HbRchannels.LmaxVal HbRchannels.LtimeToMax HbRchannels.LmeanVal HbRchannels.LAUC HbRchannels.Lslope];
HbTdata.L = [HbTchannels.LmaxVal HbTchannels.LtimeToMax HbTchannels.LmeanVal HbTchannels.LAUC HbTchannels.Lslope];
clear offSet iChannels iFiles output Folder idx
save ('..\data\channelData.mat')
disp('Channel by channel metrics computed!')
% EOF