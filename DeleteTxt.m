function  DeleteTxt( foldername,searchterm)
%UNTITLED Summary of this function goes here
%   deletes .txt files in a folder 
%foldername=('C:\Users\AlkemaM\Desktop\jeremy\SpontaneousReversals\131106_N2\20120704_094919');
%searchterm = '\*.txt';
filelist = FileSearch(foldername, searchterm);
numtxt = numel(filelist, ':',':');

for txtcount = 1:numtxt
    delete(char(filelist{txtcount}))
end

