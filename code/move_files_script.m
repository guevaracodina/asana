folderName = 'C:\Edgar\Dropbox\CIACYT\Students\Michelle\fNIRS Yoga\resting_state_before';
dirStruct = dir(fullfile(folderName, '*.snirf'));
nFiles = numel(dirStruct);
cd(folderName)
for iFiles = 1:nFiles
    currentFolder = sprintf('%02d',iFiles);
    if ~exist(currentFolder,'dir')
        mkdir(currentFolder)
    end
end