function  BatchImportRev( foldername )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapTrials\130823\130823_n2';

foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};
last = numel(subfolders, ':', ':');
newpath = {};
count = 3;
tick = 0;

%Loop through folders 
while  count<=last  
    tempfolder = subfolders(1, count);
outfold = char(tempfolder);


   count = count + 1;
   tick = tick + 1;
        
%get current folder name
newpath = [foldername '\' outfold];

%get current folder contents
subfold = dir(newpath);
filenames = {subfold(~[subfold.isdir]).name};
numfile = numel(filenames, ':', ':');

%find files matching MWT prefix and ending in .txt. 

suspect = regexp(newpath, '\', 'split');
theguy = [char(suspect(1,(end - 1))) '.txt'];
hideout = [newpath '\' theguy];

%import Matching files
riches(tick, 1) = {importdata(hideout)};


    
end

% Create Summay excel file.
sumdata = cell2mat(riches);
trimdata = sumdata(:,2:end);
headers = {'Total N','%Wrong Way','%Nothing','%Respond','# Wrong Way','# Nothing','# respond','Avg','Std','Sem','Min','25th%','median','75th%','max','Avg','Std','Sem','Min','25th%','median','75th%','max'};
maths = {'=SUM(E3:G3)', '=(E3/$A3)*100','=(F3/$A3)*100','=(G3/$A3)*100'};
summaryname = [foldername '\Collectsummary.xlsx'];
delete(summaryname);

xlswrite(summaryname, trimdata, 'Sheet1', 'E3');
xlswrite(summaryname, maths,'Sheet1', 'A3');
xlswrite(summaryname, headers ,'Sheet1', 'A2');


