function [batchrpt]= BatchReadRPT(foldername)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2';
foldername = char(foldername);
extension = 'RPT';
excelname = [foldername '\' extension '_report.xlsx']
delete(excelname);
foldercontents = dir(foldername);
subfolders = {foldercontents([foldercontents.isdir]).name};
last = numel(subfolders, ':', ':');
newpath = {};
count = 3;
tick = 0;
took = 1;
data = {};
while  count<=last  
    tempfolder = subfolders(1, count);
outfold = char(tempfolder);


   count = count + 1;
   tick = tick + 1;
   newpath(tick, 1)={[foldername '\' outfold]}       
end
newpath = vertcat(newpath);
[l, w] = size(newpath);

for creep = 1:l
    data(took, 1) = {ReadRPT(char(newpath{creep}))};
took = took + 1;
end
batchrpt = vertcat(data{:,:});
%batchrpt(1,10) = mean(batchrpt(:,3));
%batchrpt(1,11) = mean(batchrpt(:,4));
%batchrpt(1,12) = mean(batchrpt(:,5));
%batchrpt(1,13) = sum(batchrpt(:,12));

[len, wid] = size(batchrpt);
forward = NaN(len, wid);
reversal = NaN(len,wid);

fcount = 1;
rcount = 1;

for t = 1:len
    action = batchrpt(t,3);
    switch action 
        case 1
            if batchrpt(t,5) > 0.01 
            forward(fcount, 1:6) = batchrpt(t,:);
            fcount = fcount+1;
            end
        case 3 
            if batchrpt(t,5) > 0.01 
            reversal(rcount, 1:6) = batchrpt(t,:);
            rcount = rcount+1;
            end
    end
end
    




headers = {'time', 'worm id', 'action' 'duration', 'distance', 'N'};
xlswrite(excelname, headers, 'Sheet1', 'A1');
xlswrite(excelname, batchrpt, 'Sheet1', 'A2');
xlswrite(excelname, forward, 'Forward', 'A1');
xlswrite(excelname,reversal, 'Reversals', 'A1');


disp('Thy Will Be Done');





