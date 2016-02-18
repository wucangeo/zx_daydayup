function fileList = handlefilelist( dirin )
%HANDLEFILELIST Summary of this function goes here
%   Detailed explanation goes here

dirData = dir(dirin);
dirIndex = [dirData.isdir];  %# Find the index for directories
fileList = {dirData(~dirIndex).name}';  %'# Get a list of the files
if ~isempty(fileList)
    fileListIn = cellfun(@(x) fullfile(dirin,x),fileList,'UniformOutput',false);  %# Prepend path to files
end

for i = 1:length(fileListIn)
    %     fprintf('%s\n',fileListIn{i});
    %     fprintf('%s\n',fileListOut{i});
    txtimport(fileListIn{i});
end

end

