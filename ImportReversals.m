function [ reversals ] = ImportReversals( foldername )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% I altered the main output code to add .txt to filenames of reversal
% output so this code goes and looks for text files that fit the pattern
% [filename\...[ID#].txt]. 


%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapTrials\130820\130812_flp-18\20130820_162700';
% Directory of the files

% Retrieve the name of the folders
subfold = dir(foldername);
filenames = {subfold(~[subfold.isdir]).name};
numfile = numel(filenames, ':', ':');
headcount = 0;   
perp = {numfile};
revdata = {numfile};
[revpath, revname] = fileparts(foldername);

%look for files that match .txt and have ID number in specified folder
for index=1:numfile
        examiner = char(filenames(index));
        [path, name, ext] = fileparts(examiner);
      judge = strcmp(ext, '.txt');
      inquisition = regexp(name, '\.', 'split');
      heretic = numel(inquisition, ':', ':');

% create array of heretics and burn them
        if heretic == 2 && judge == 1
            headcount = headcount + 1;
            perp{headcount} = [foldername '\' examiner];
         currentfile =  char(perp{headcount});
      revdata{headcount, 1} = importdata(currentfile);
      
        end
end
reversals = cell2mat(revdata);
excelname = [revname 'ReversalData.xlsx'];
delete([foldername '\' excelname]);
xlswrite(excelname, reversals);
movefile(excelname, foldername);
end

