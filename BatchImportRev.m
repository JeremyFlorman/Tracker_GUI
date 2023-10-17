function  BatchImportRev( foldername )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapTrials\130823\130823_flp-18';

foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};
last = numel(subfolders, ':', ':');
newpath = {};
count = 3;
tick = 0;
while  count<=last  
    tempfolder = subfolders(1, count);
outfold = char(tempfolder);


   count = count + 1;
   tick = tick + 1;
   %newpath{tick} = [foldername '\' outfold];
   newpath = [foldername '\' outfold];
   [reversals] = ImportReversals(newpath);
    combinerev(1, tick) = {reversals};
      
end
sumnum = numel(combinerev, ':', ':');
   sumdata =  cell2mat(combinerev(:));
summaryname = [foldername '\reversalsummary.xlsx'];
delete(summaryname);
xlswrite(summaryname, sumdata);

%foldcount = numel(newpath, ':', ':');
%thing = 1;
%while thing <= foldcount
 %   folders = char(newpath{thing});
  %  listfolders{thing} = folders;
   % excelnames{thing} = [outfold '.xlsx'];
   % ImportReversals(folders);
    %outputfolders{thing} = folders;
    %thing = thing + 1;

%end

 %   iters = numel(listfolders, ':', ':');
  %  plod = 1;
  %  data = cell(1, iters);
  

    %for plod=1:iters 
      %
      %ImportReversals(oncemore);
    %end
    
  %  for plod = 1:iters
  %  oncemore = char(listfolders(plod));
   % importnames = [oncemore '\' char(excelnames(plod))];
  %  data{plod} = xlsread(importnames);
  % end
%   xlswrite([foldername '\reversalsummary.xlsx'], data);
%end

