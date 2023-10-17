function ImportDat(foldername, outputheaders)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'E:\jeremy\jeremy\Unc-2\Spontaneous\131216_Unc-2\20131216_104326';
%outputheaders = { 'Time '    'Speed '    'Angular Velocity '    'Kink '    'Bias '    'Pathlength '    'Curvature '    'Dir '    'Orientation '    'Crab '    'Amplitude'};
% Directory of the files
excelname= [foldername '\Dat.xlsx'];
excelfile = FileSearch(foldername, '\Dat.xlsx');

delete(char(excelfile));

datfile = FileSearch(foldername, '\*.dat');
numdat = numel(datfile, ':', ':');
datname = datfile{numdat};
datdata = dlmread(datname);

xlswrite(excelname, outputheaders, 'Sheet1', 'A1');
xlswrite(excelname, datdata, 'Sheet1', 'A2');
disp('Done');



