function BatchDeleteTxt( foldername, searchterm )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\SpontaneousReversals\131106_N2';
foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};
last = numel(subfolders, ':', ':');
newpath = {};
count = 3; 
tick = 0;
filelist = '';
paths = {};
while  count<=last  
    tempfolder = subfolders(1, count);
outfold = char(tempfolder);


   count = count + 1;
   tick = tick + 1;
   newpath = [foldername '\' outfold];
    paths(tick) = {newpath};


     
end
numpaths = numel(paths, ':', ':');
for through = 1:numpaths
    name = paths{through};
   % searchterm = '\*.txt';
    files = FileSearch(name,searchterm);
    
    isfiles = strcmpi(files, 'No Files Matching That Extension');
    
    if isfiles==1 
        disp('No Files Matching That Extension');
    
    elseif isfiles ~= 1
        numfiles = numel(files, ':', ':');
            
        for that = 1:numfiles
            files{that}
                delete(files{that})
                disp('Another one gone');
        end
    end

end
disp('Another one bites the dust');
