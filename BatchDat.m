function  BatchDat(foldername, outputheaders)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'E:\jeremy\jeremy\SpontaneousReversals\131126_N2\20131126_145316';

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
    temppath = newpath{2};
    ImportDat(temppath, outputheaders);
end

