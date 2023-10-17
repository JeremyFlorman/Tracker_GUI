function [output] = FirstResponse(foldername,taptime,window, tooshort)
%FirstResponse Summary of this function goes here
%   Detailed explanation goes here
%tooshort = 0.06;
%window = 1;
%taptime = 300;
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Developmemt\Adult\180306_Adult\20180306_110755';

files = dir(foldername);
files = {files(:).name};
template = regexp(files{3}, '\.', 'split');

filename = [foldername '\' template{1} '.rpt.ms'];

fid = fopen(filename);

l = 1;
line = {};

while ~feof(fid) 
    line{l} = fgets(fid);
    l = l+1;
end

fclose(fid)
line = cell2mat(line);

line = strrep(line, 'f', '1'); %% forward = 1
line = strrep(line, 's', '2'); %% stop = 2
line = strrep(line, 'b', '3'); %% backward = 3
line = strrep(line, 'o', '4'); %% omega = 4

line = str2num(line);
tapevents = line(line(:,1)>taptime & line(:,1)<taptime+window,:);
ids = unique(tapevents(:,2));

first = [];
fwd = [];
stp = [];
rev = [];
omg = [];
f = 1;
s = 1;
r = 1;
o = 1;

output = struct;

for i = 1:size(ids)
    p = 1;
    lim = 1;
    deeds(i) = {tapevents(tapevents(:,2) == ids(i),:)};
    first(i,1:6) = deeds{i}(1,:);
    [ll, ~] = size(deeds{i});
    
    

    while first(i,4) < tooshort && lim < ll+1
        p = p+1;
        if p<=ll
          first(i,1:6) = deeds{i}(p,:);
        end
        lim = p;
    end
        
    switch first(i,3)
        case 1
            fwd(f, 1:6) = first(i,:);
            f = f+1;
        case 2
            stp(s, 1:6) = first(i,:);
            s = s+1;
        case 3
            rev(r, 1:6) = first(i,:);
            r = r+1;
        case 4
            omg(o, 1:6) = first(i,:);
            o = o+1;
    end
end


[lf, ~] = size(fwd);
[ls, ~] = size(stp);
[lr, ~] = size(rev);
[lo, ~] = size(omg);
tots = (lf+ls+lr+lo); 


d = [];
    for i = 1:length(deeds)
        tdeeds = deeds{i};
        d = vertcat(d, tdeeds);
    end
    
    
output.deeds = d;
output.first = first;
output.nevents = [lf ls lr lo];
output.fractions = 100*([lf/tots ls/tots lr/tots lo/tots]);
end

