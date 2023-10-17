function [ idlist ] = GetIDs( foldername )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%foldername =  'C:\Users\AlkemaM\Desktop\jeremy\20131018_111943';
datsearch = '\*.dat';
datlist = FileSearch(foldername, datsearch);
txtlist = FileSearch(foldername, '\*.txt');
%dlmread(temppath, ' ');
%dlmread(revfile, ' ' );
numdat = numel(datlist, ':', ':');
numtxt = numel(txtlist, ':', ':');

%get ID's of worms passing reversal criteria 
for tick=1:numtxt
test = char(txtlist(tick));
[path, name, ext] = fileparts(test);
[token, remain] = strtok(name, '.');
[tok2, rem2] = strtok(remain, '.');
comma = {','};
id = {char(tok2)};
andout(1,tick) = strcat(id, comma);
end
idlist = char(cell2mat(andout));
idlist=idlist(1:end-1)
end

