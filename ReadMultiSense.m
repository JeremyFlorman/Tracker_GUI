function [report] = ReadMultiSense( foldername)
%UNTITLED Summary of this function goes here
%   Converts and reads outputs from the choreography plugin 'MultiSensed.
%   Takes files that end in .rpt.ms and changes them to \*_RPT.txt for 
%   reading, if the file has already been converted this function will read 
%   it and return the data as [report]


%foldername = 'C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2\20131121_113256';
extension = 'trp';
msext = ['\*.' extension '.ms'];
txtext = ['\*_' extension '.txt'];
delim = ' ';
MSname = char(FileSearch(foldername, msext ));
TXTname = char(FileSearch(foldername, txtext ));
fid = [];
data = {};
msthere = strcmp(MSname, 'No Files Matching That Extension');
txtthere = strcmp(TXTname, 'No Files Matching That Extension');
%report = NaN(100, 9);


    if txtthere == 0 %% txt file is there
        
   altname = char(FileSearch(foldername, ['\*_' extension '.txt']));
   fid = fopen(altname, 'r');
   data = textscan(fid, '%n %n %n %s %n %n %n %n %n');
    fclose(fid);
    end
    
    if msthere == 0 && txtthere == 1

[path, name, ext] = fileparts(MSname);
[match, split] = regexp(name, '\.', 'split');

newname = [char(match(1)) '_' char(match(2)) '.txt'];
system(['rename ' MSname ' ' newname]);
   
    altname = char(FileSearch(foldername, ['\*_' extension '.txt']));
    fid = fopen(altname, 'r');
    data = textscan(fid, '%n %n %n %s %n %n %n %n %n');
   fclose(fid);
    end


action = data{1,4};
[l,w] = size(action);

for ted = 1:l 
    tempact = action{ted,1};
    switch tempact
        case 'f'
            data{1,4}(ted) = {1};
        case 's'
            data{1,4}(ted) = {2};
        case 'b'
            data{1,4}(ted) = {3};
        case 'o'
            data{1,4}(ted) = {4};
    end
end
 
this = data(:,4);
this = cell2mat(this{:});
data(4) = {this};

report = [data{:,1} data{:,2} data{:,3} data{:,4} data{:,5}, data{:,6} data{:,7} data{:,8} data{:,9}]; 



%writetable('C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131121_N2\20131121_131350\test.xlsx', report)

