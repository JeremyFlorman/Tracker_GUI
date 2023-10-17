function [] = Meta_Reversal_Histogram(foldername,nbins, action, yaxlim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors';
%nbins = 20;

fdir = dir(foldername);

fsubnames = {};
y=1;
for i = 1:length(fdir)
    if fdir(i).isdir == 1
        fsubnames(y) = {fdir(i).name};
        y=y+1;
    end
end

fsubnames = fsubnames(3:end);

for i = 1:length(fsubnames)
    tempname = [foldername '\' fsubnames{i}];
    Auto_Reversal_Histogram(tempname, nbins, action,yaxlim)
end

