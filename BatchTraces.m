function [longrev] = BatchTraces(foldername, timepre, timepost)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'E:\jeremy\OneTap\131217_N2';
%timepre = 10;
%timepost = 15;

foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};
last = numel(subfolders, ':', ':');
newpath = {};
count = 3;
tick = 0;
took = 0;
newpath = {};
while  count<=last  
    tempfolder = subfolders(1, count);
    outfold = char(tempfolder);


   count = count + 1;
   tick = tick + 1;
   newpath(tick, 1)={[foldername '\' outfold]};       
end
listsize = numel(newpath, ':', ':');

for p = 1:listsize
    temppath = newpath{p};
longrev =  MasterTrace(temppath, timepre, timepost);
end


