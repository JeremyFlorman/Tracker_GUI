function [ scale ] = AutoScale( foldername )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%foldername = 'C:\MWT\N2\140131_N2';

imgname = dir([foldername '\*.tif']);
if isempty(imgname) == 1
imgname = dir([foldername '\*.tiff']);
end

if isempty(imgname) == 1
imgname = dir([foldername '\*.jpeg']);
end

if isempty(imgname) == 1
imgname = dir([foldername '\*.jpg']);
end

if isempty(imgname) == 1
imgname = dir([foldername '\*.png']);
end

proscale =regexp(imgname(1).name,'(\d+)-(\d+)', 'match');
if isempty(proscale) == 0
    scale = char(strrep(proscale, '-', '.'));
elseif isempty(proscale) == 1
    proscale = regexp(imgname(1).name, '(\d+)_(\d+)','match');
    scale = char(strrep(proscale, '_', '.'));

end

if isempty(proscale) == 1 
    proscale = regexp(imgname.name, '(\d+)', 'match');
    scale = proscale{end};
end

end
 
