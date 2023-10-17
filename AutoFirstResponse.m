function [output] = AutoFirstResponse(foldername,taptime,window, write, tooshort)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
tooshort = 0.07;
write = 1;
window = 1;
taptime = 300;
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Developmemt\Adult';
foldername = uigetdir('C:\Users\MWT\Desktop\Jeremy\Developmemt')
splits = regexp(foldername, '\', 'split');

k = 1;
pd = dir(foldername);
for i = 1:length(pd)
    if pd(i).isdir == 1
        subfolds(k) = {pd(i).name};
        k = k+1;
    end
end
subfolds = subfolds(3:end);
tdeeds = [];
tfirst = [];
tevents = [];
tfract  = [];
output = struct();

for i = 1:length(subfolds)
    subsub = [foldername '\' subfolds{i}];
    tempout = BatchFirstResponse(subsub, taptime, window, 0, tooshort)
    tdeeds = vertcat(tdeeds, tempout(:).deeds);
    tfirst = vertcat(tfirst, tempout(:).first);
    tevents = vertcat(tevents, tempout(:).nevents);
    tfract = vertcat(tfract, tempout(:).fractions);
 end

output.deeds = tdeeds;
output.first = tfirst;
output.nevents = tevents;
output.fractions = tfract;
output.mean = mean(output.fractions, 1);


if write == 1
    header1 = {'Time', 'ID', 'Action', 'Duration', 'Distance', 'N'};
    header2 = {'Forward', 'Stop', 'Reverse', 'Omega'};
    header3 = {'% Forward', '% Stop', '% Reverse', '% Omega'};
    
    excelname = [foldername '\' splits{end} '_AutoFirstResponse.xlsx'];
    delete(excelname)
    xlswrite(excelname, header1, 'Sheet1', 'A1');
    xlswrite(excelname, output.deeds, 'Sheet1', 'A2');
    xlswrite(excelname, header1, 'First Response', 'A1');
    xlswrite(excelname, output.first, 'First Response', 'A2');
    xlswrite(excelname, header2, '# Events', 'A1');
    xlswrite(excelname, output.nevents, '# Events', 'A2');
    xlswrite(excelname, header3, '% Events', 'A1');
    xlswrite(excelname, output.fractions, '% Events', 'A2');
    xlswrite(excelname, header2, '% Average', 'A1');
    xlswrite(excelname, output.mean, '% Average', 'A2');
    
    disp('DONE!')

end





end

