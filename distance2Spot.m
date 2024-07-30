foldername = 'C:\Users\Administrator\Desktop\N2nofood90minOP50\20240724_095406';
spotX = 19.2184; % x location of spot
spotY = 47.0125; % y location of spot
xCol = 3; % column number in .dat file with x_Loc
yCol = 4; % column number in .dat file with y_Loc
minWormNum = 1; % only include time points with more than this many worms
foodtime = 5400;


d = dir([foldername '\*.dat']);
txy = [];
distMat = [];

for i = 1:length(d)
    tempdata = readmatrix(fullfile(d(i).folder,d(i).name));
    txy = vertcat(txy, [tempdata(:,1) tempdata(:,xCol), tempdata(:,yCol)]);
end

[~,sortIdx] = sort(txy(:,1));
txy = txy(sortIdx,:);

distances = sqrt((txy(:,2) - spotX).^2 + (txy(:,3) - spotY).^2);


Time = unique(txy(:,1));

distMat = nan(length(Time),length(d));

for i = 1:length(Time)
    timeflag = txy(:,1) == Time(i);
    if nnz(timeflag)>minWormNum
    distMat(i,1:nnz(timeflag)) = distances(timeflag)';
    end
end
%%
meandist = smoothdata(fillmissing(median(distMat, 2, 'omitnan'),"linear",SamplePoints=Time),1,"movmedian",30,"omitnan");

plot(Time,smoothdata(fillmissing(median(distMat, 2, 'omitnan'),"linear",SamplePoints=Time),1,"movmedian",30,"omitnan"))
line([foodtime foodtime], [min(distMat,[], 'all', 'omitnan'), max(distMat,[], 'all', 'omitnan')])


