function [rpt] = ReadRPT(foldername)
%UNTITLED Summary of this function goes here
%   Converts and reads outputs from the choreography plugin 'MultiSensed.
%   Takes files that end in .rpt.ms and changes them to \*_RPT.txt for 
%   reading, if the file has already been converted this function will read 
%   it and return the data as [report]


%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2\20131121_113256';

extension = 'rpt';
excelname = [foldername '\RPTreport.xlsx'];
exten = ['\*.' extension '.ms'];
delim = ' ';
MSname = char(FileSearch(foldername, exten ));



isthere = strcmp(MSname, 'No Files Matching That Extension');

%report = NaN(100, 9);
switch isthere
    case 1
   altname = char(FileSearch(foldername, ['\*_' extension '.txt']));
   fid = fopen(altname, 'r');
   data = textscan(fid, '%s', 'delimiter', '\n');
    case 0
[path, name, ext] = fileparts(MSname);
[match, split] = regexp(name, '\.', 'split');

newname = [char(match(1)) '_' char(match(2)) '.txt'];
system(['rename ' MSname ' ' newname]);
   
    altname = char(FileSearch(foldername, ['\*_' extension '.txt']));
    fid = fopen(altname, 'r');
    data = textscan(fid, '%s', 'delimiter', '\n');
end

fclose(fid);

[match, split] = regexp(data{1}, '\n', 'split');


report = char(data{:});

[l, w] = size(report);
for y = 1:l
    item = regexp(report(y,:), ' ', 'split');
    time(y) = {str2double(item{1})};
    wormid(y) = {str2double(item{2})};
    action(y) = {item{3}};
    duration(y) = {str2double(item{4})};
    distance(y) = {str2double(item{5})};
    N(y) = {str2double(item{6})};
end

for prog = 1:l 

    f=1;
    s=1;
    b=1;
    o=1;
    
    tempact = action{prog};
    codata = [time{prog}, wormid{prog}, action{prog}, duration{prog}, distance{prog}, N{prog}];
    switch tempact
        
        case 'f'
            action(prog)  = {1};
           % forward(f) = {codata};
            f = f+1;
            indexf(f,1) = prog;
        case 's' 
            action(prog) = {2};
           % stop(s) = {codata};
            s = s+1;
            indexs(s,1) = prog;
        case 'b' 
            action(prog) = {3};
           % reversal(b) = {codata};
            b = b+1;
            indexb(b,1) = prog;
        case 'o'
            action(prog) = {4};
            %omega(o) = {codata};
            o = o+1;
            indexo(o,1) = prog;

    end
end



rpt(1:l,1) = time';
rpt(1:l,2) = wormid';
rpt(1:l,3) = action;
rpt(1:l,4) = duration';
rpt(1:l,5) = distance';
rpt(1:l,6) = N';

rpt = cell2mat(rpt);


   fi = 1;
   si = 1;
   bi = 1;
   oi = 1;
forward = cell(l,1);
stop = cell(l,1);
reversal = cell(l,1);
omega = cell(l,1);
   
for count = 1:l
   type = rpt(count,3);

    switch type
        case 1 
         forward(fi) = {rpt(count,:)};
         fi = fi+1;
         case 2 
         stop(si) = {rpt(count,:)};
         si = si+1;
         case 3
         reversal(bi) = {rpt(count,:)};
         bi = bi+1;
         case 4 
         omega(oi) = {rpt(count,:)};
         oi = oi+1;
    end
end


lastf =find(cellfun(@isempty, forward), 1);
forward = forward(1:lastf-1);
forward = cell2mat(forward);

lasts =find(cellfun(@isempty, stop), 1);
stop = stop(1:lasts-1);
stop = cell2mat(stop);

lastb =find(cellfun(@isempty, reversal), 1);
reversal = reversal(1:lastb-1);
reversal = cell2mat(reversal);

lasto =find(cellfun(@isempty, omega), 1);
omega = omega(1:lasto-1);
omega = cell2mat(omega);

omen = isempty(omega)


headers = {'time', 'worm id', 'action', 'duration', 'distance', 'N'};
delete(excelname)
xlswrite(excelname, headers, 'Sheet1', 'A1');
xlswrite(excelname,rpt, 'Sheet1', 'A2');
xlswrite(excelname, forward, 'Forward', 'A1');
xlswrite(excelname, stop, 'Stop', 'A1');
xlswrite(excelname, reversal, 'Reversal', 'A1');
if omen == 0
xlswrite(excelname, omega, 'Omega', 'A1');
end
%report = [data{:,3} data{:,5}, data{:,6} data{:,7} data{:,8} data{:,9}]; 



%writetable('C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2\20131121_131350\test.xlsx', report)

