function [ output_args ] = BatchSignedVel(parentfolder, mintime, maxtime)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%mintime = 270;
%maxtime = 330;
%parentfolder = 'C:\MWT\N2_Strong\180911_N2_Strong_2';

%parentfolder = uigetdir('E:\');

subfolders = dir(parentfolder);

ii=1;
for i = 1:size(subfolders)
    if subfolders(i).isdir==1
        foldnames(ii) = {subfolders(i).name};
        ii=ii+1;
    end
    
end

foldnames = foldnames(3:end);
avel = [];
pmean = [];
timeline = [];
for i=1:size(foldnames,2)
    temppath=[parentfolder '\' foldnames{i}];
    [data, aligned, popmean] = SignedVelocity(temppath, mintime, maxtime, 0);
    if i==1
        avel = aligned;
        pmean = popmean;
    elseif i>1
        avel = horzcat(avel,aligned);
        pmean = horzcat(pmean, popmean);
    end
    timeline = data.timeline;
end
tl = -300:0.25:300;
n = regexp(parentfolder, '\', 'split');
excelname = [parentfolder '\' n{end} '_Signed+Aligned.xlsx']
othername = [parentfolder '\' n{end} '_population_mean.xlsx']
delete(excelname);
delete(othername);
writematrix(pmean, othername);
xlswrite(excelname, horzcat(tl', avel))

disp('done')

end

