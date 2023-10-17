function [ Raws ] = SpontaneousRevCollect(foldername)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%
% for use with starvation experiments, requires spontaneous reversals under
% the collect setting. 
%
%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\StarvationExperiments\131008\131008_tbh-1';
excelname = [foldername '\SpontaneousReversals.xlsx'];
foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};

numfolders=numel(subfolders, ':', ':');
%filelist=cell(size(numfolders-2));

for tick = 3:numfolders
    cells = {'A1', 'I1', 'Q1', 'Y1', 'AG1', 'AO1', 'AW1', 'BE1'};
    times = {'5-30 min', '1 hr', '2 hr', '3 hr', '4 hr', '5hr', '6 hr', '24 hr'};
    reversalheaders = {'time', '#respond', 'avg dist','avg duration'};
    tempfolder =[foldername '\' char(subfolders{tick})];
        revname = FileSearch(tempfolder, '\*.txt');                             %finds reversal data in folder
        datname = FileSearch(tempfolder, '\*dat');                              %finds dat data in folder
        revdata = dlmread(char(revname), ' ');                                  %reads reversal data
        revcondense = [revdata(:,1), revdata(:,5), revdata(:,8),revdata(:,19)]; %extracts relevant reversal data
        datdata = dlmread(char(datname), ' ');                                  % read dat data
        filelist(tick)= {revdata};                                              %%%unused, creates list of rev files
        numel(filelist, ':', ':')
        sheetname = times{tick-2};                                              %creates seperate sheets for each of the timepoints
        cellindex = cells{tick-2};                                              %places dat data in proper columns
        xlswrite(excelname ,reversalheaders, sheetname, 'A1');                  %writes column headers for reversals
        xlswrite(excelname ,revcondense, sheetname, 'A2');                      %writes actual Reversal Data
        xlswrite(excelname, datdata, 'Sheet1', cellindex)                       %writes dat data
end


end
