function [ output_args ] = PlotTracks( foldername)

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'E:\jeremy\OmegaExperiments\QW1655_Pflp-18_FLP-18(ox)\170117_QW1655\20170117_113948';




%% get prefix for datfile
seqmap = MapGen(2);
seqmap = vertcat(seqmap, seqmap);
seqmap = vertcat(seqmap, seqmap);
%seqmap = vertcat(seqmap, seqmap);
%seqmap = vertcat(seqmap, seqmap);
%seqmap = vertcat(seqmap, seqmap);


 ordering = randperm(length(seqmap));       
 randmap = seqmap(ordering,:);


files = dir(foldername);
for i = 3:numel(files)
z(i-2) = {files(i).name};
end

spinefind = strfind(z, '.spine');
spineidx = find(~cellfun('isempty',spinefind));

z = z(spineidx);
cmap = distinguishable_colors(length(z))
for i=1:length(z)
    spinepath(i) = {[foldername '\' z{i}]};
end
%%
p = regexp(foldername, '\', 'split');
m = [p{end-1} ' ' p{end}]
n = strrep(m, '_', ' ');

col = bone(length(spinepath));

h = figure();

for i = 1:length(spinepath)
fid = fopen(spinepath{i});
data = textscan(fid, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(fid);


time(i) = {data(:,1)};
xy(i) = {data(:,10:11)};

%% Uncomment to center all tracks around a single point.
%normx = {xy{i}{1}-mean(xy{i}{1})};
%normy = {xy{i}{2}-mean(xy{i}{2})};
%fig = plot(normx{:}, normy{:},'color', col(i,:), 'linewidth',   .75 );


fig = plot(xy{i}{:}, 'linewidth',   1.5, 'color',  randmap(i,:) );
set(gca, 'xlim', [0,25], 'ylim', [0,27], 'Box', 'off', 'XColor', 'none', 'YColor', 'none', 'Color', 'none')
set(h, 'Position', [403 246 560 560])
num = num2str(i)
savename = [foldername '\' m '_PlotTracks_' num]

%% uncomment to export all tracks as a single graph
%hold on
%print(h,savename, '-dpng', '-r300')
%% uncomment to export single tracks with transparent background
export_fig(sprintf('170227_gk3063_20170227_145150_PlotTracks_%d.png', i), '-transparent', '-a3', '-m3')

end


m = [p{end-1} ' ' p{end}]
n = strrep(m, '_', ' ');
title(n);

 

hold off
savename = [foldername '\' m '_PlotTracks'];
%saveas(fig, [foldername '\' p{end-1} '_PlotTracks.pdf'])

print(h,savename, '-dtiffn', '-r300')
end

