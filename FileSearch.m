function [filelist] = FileSearch( foldername, searchterm )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%searchterm = '\*.spine';
%foldername = 'C:\MWT\N2\140501_N2\20140501_161533';
datsearch = [foldername searchterm];
files = dir(datsearch);
numfiles = numel(files, ':', ':');
if numfiles == 0
    filelist = 'No Files Matching That Extension';
elseif numfiles > 0 
    for count=1:numfiles
    filenames={files.name};
    end

        for clamp=1:numfiles
        tempname = char(filenames(clamp));
        temppath = [foldername '\' tempname];

        filelist(clamp) = {temppath};
        end

end
