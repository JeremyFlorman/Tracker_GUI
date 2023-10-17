function [ output_args ] = AutoDeleteAll( foldername )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%foldername = 'C:\mwt\n2';
foldercontents = dir(foldername);
parentfolders = {foldercontents([foldercontents.isdir]).name};
parentfolders = parentfolders(3:end);
numparent = numel(parentfolders, ':', ':');


for z = 1:numparent                     % outerfolder loop
    subname = parentfolders{z};
    parentname = [foldername '\' subname];
    disp(['Crunching:' parentname])
    
    
   
    BatchDeleteTxt(parentname, '\*.dat');
     BatchDeleteTxt(parentname, '\*.trig');
      BatchDeleteTxt(parentname, '\*.*.trig');
       BatchDeleteTxt(parentname, '\*.txt');
        BatchDeleteTxt(parentname, '\*.spine');


end


disp('this is the end')
end



