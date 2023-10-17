function[forward, stop, reverse, omega]=  BatchMultiSense(foldername)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2';
extension = 'trp';
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
   newpath(tick, 1)={[foldername '\' outfold]};       
end
newpath = vertcat(newpath);
[l, w] = size(newpath);

for creep = 1:l
    newpath{creep}
    tempdata = ReadMultiSense(char(newpath{creep}));
    if tempdata(1,3) > 0 
        data(took, 1) = {tempdata};
        took = took + 1;
    end
    %    data(took, 1) = {ReadMultiSense(char(newpath{creep}))}

end
newdata = vertcat(data{:,:});

%newdata = cell2mat(newdata);

[len, wid] = size(newdata);
fi =1;
si = 1;
ri=1;
oi=1;
forward = NaN(len, wid);
stop = NaN(len, wid);
reverse = NaN(len, wid);
omega = NaN(len, wid);
for p = 1:len
   act = newdata(p,4);
    switch act 
        case 1
            forward(fi,1:wid) = newdata(p,:);
            fi = fi+1;
        case 2
            stop(si, 1:wid) = newdata(p,:);
            si = si+1;
        case 3
            reverse(ri,1:wid) = newdata(p,:);
            ri = ri+1;
        case 4 
            omega(oi, 1:wid) = newdata(p,:);
            oi = oi+1;
    end
end
window = num2str(newdata(1,2));

spt = regexp(foldername, '\', 'split');


excelname = [foldername '\' spt{end} '_' extension '_report(' window 's).xlsx'];
delete(excelname);
headers = {'time', 'window', 'Mean N', 'Action', '# events', 'Mean Duration', 'Stdev Duration', 'Mean Distance', 'Stdev Distance', '% action'};
xlswrite(excelname, headers, 'forward', 'A1');
xlswrite(excelname, forward, 'forward', 'A2');

xlswrite(excelname, headers, 'stop', 'A1');
xlswrite(excelname, stop, 'stop', 'A2');


xlswrite(excelname, headers, 'reverse', 'A1');
xlswrite(excelname, reverse, 'reverse', 'A2');

xlswrite(excelname, headers, 'omega', 'A1');
xlswrite(excelname, omega, 'omega', 'A2');

xlswrite(excelname, headers, 'Sheet1', 'A1');
xlswrite(excelname, newdata, 'Sheet1', 'A2');

disp('Job Done!')
