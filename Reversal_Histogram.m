function [] = Reversal_Histogram(foldername, nbins, action, yaxlim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%nbins = 50;
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\FLP-18(+++)\171103_FLP-18(+++)\20171103_151458';
d = dir(foldername);
names = {d.name};
k = strfind(names, 'rpt.ms', 'ForceCellOutput', 1);
idx = [];
for i = 1:length(k)
    if ~isempty(k{i})
        idx = i;
    end
end

filename = [foldername '\' names{idx}];
fid = fopen(filename);
data = textscan(fid, '%d%d%s%f%f%d');
act = '';
switch action 
    case 'Reversal'
        act = cell2mat(data{3}) == 'b';
    case 'Forward'
        act = cell2mat(data{3}) == 'f';
    case 'Omega'
        act = cell2mat(data{3}) == 'o';
    case 'Stop'
        act = cell2mat(data{3}) == 's';
end


time = data{1};
nworms = data{end};
revtime = time(act);
revpop = nworms(act);

[counts, edges] = histcounts(revtime, nbins);
i = 1;
meanN = [];
p = 1;

chunk = round(length(time)/nbins);
for i = 1:chunk:length(time)
    if i+chunk<length(time)
        meanN(p) = mean(nworms(i:i+chunk));
    elseif i+chunk>length(time)
        meanN(p) = mean(nworms(i:end));
    end
    p = p+1;
end


    if length(counts)~= length(meanN)
        meanN = meanN(1:length(counts));
    end
    
    for i = 1:length(meanN)
        if meanN(i) == 0 
            meanN(i) = meanN(i-1);
        end
    end

normcounts = counts./meanN;

figure()
histogram('BinEdges', edges, 'BinCounts', normcounts)

ti = regexp(foldername, '\', 'split');
title([ti{end-1} '\' ti{end}])
xlabel('Time(s)')
ylabel('Count')

uselim = strcmpi(yaxlim, 'auto');

if uselim == 0 
set(gca, 'YLim', [0,str2num(yaxlim)])
end





