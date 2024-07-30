function [] = parseFlux(foldername)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% foldername = 'C:\Users\Administrator\Desktop\foodEncounter\240715_Starved2hr\20240715_193221';
window = 30;
speedColumn = 2;


d = dir([foldername '\*.flux']);
fluxData = [];

if isscalar(d)
    fluxData = readmatrix(fullfile(d(1).folder, d(1).name),'FileType','text');
    regionID = 1;
    fluxData = [fluxData repmat(regionID,size(fluxData,1),1)];
    r = regexp(d(1).name, '\.', 'split');

else
    for i = 1:length(d)
        tempflux = [];
        r = regexp(d(i).name, '\.', 'split');
        regionID = str2num(r{end-1}); % get region IDs from filename
        tempflux = readmatrix(fullfile(d(1).folder, d(1).name),'FileType','text');
        tempflux = [tempflux repmat(regionID,size(tempflux,1),1)]; % add region IDs
        fluxData = vertcat(fluxData,tempflux);
    end
end

nihl = abs(fluxData(:,2))==2; % find events where worms emerge or dissappear
fluxData = fluxData(~nihl,:); % remove those events

[~, sortIdx] = sort(fluxData(:,3)); % sort by worm ID
fluxData = fluxData(sortIdx,:);


%% filter for artifacts (eg worms sitting on a boundary causing repeated flux entries)
excludeList = ones(size(fluxData,1),1);
for i = 1:length(fluxData)-1
    % find events that occur within 5 seconds
    if abs(fluxData(i,1)-fluxData(i+1,1))<5

        % find events that involve the same worm ID and same region ID
        if isequal(fluxData(i,3),fluxData(i+1,3)) && isequal(fluxData(i,6),fluxData(i+1,6))
            fluxData(i:i+1,:)

            % flag successive entry/exits for removal
            if ~fluxData(i,2)+fluxData(i+1,2) % if not -1 + 1 
                excludeList(i:i+1) = 0;
            end
        end
    end
end



cleanedFluxData = fluxData(logical(excludeList),:);


%% Get Traces at entry/exit
alignedMatrix = nan(2*window*4+1,size(cleanedFluxData,1));

for i = 1:size(cleanedFluxData,1)
    id = num2str(cleanedFluxData(i,3),'%05d');
    eventTime = cleanedFluxData(i,1);
    eventType = cleanedFluxData(i,2);
    
    

    
    dat = dir([foldername '\*' id '.dat']);
    tempdata = readmatrix(fullfile(dat.folder,dat.name));

    [~, index] = min(abs(tempdata(:,1)-eventTime));


    preIndex = index-window*4; % start value aligned window
    postIndex = index+window*4; % end value of aligned window


    %% align data and deal with missing values
    if preIndex>0 && length(tempdata)>postIndex % complete trace is available...
        traceStartIndex = preIndex;
        traceEndIndex = postIndex;
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);
        % 
        % matrixStartIndex = 1;
        % matrixEndIndex = length(alignedMatrix);

    elseif preIndex<0 && length(tempdata)>postIndex  % missing values only at beginning...
        traceStartIndex = 1;
        traceEndIndex = postIndex;
        padnan = nan(abs(preIndex)+1,size(tempdata,2));
        alignedData = vertcat(padnan, tempdata(traceStartIndex:traceEndIndex,:));

    
    elseif preIndex>0 && length(tempdata)<postIndex % missing values only at end...
        traceStartIndex = preIndex;
        traceEndIndex = length(tempdata);


        alignedData = tempdata(traceStartIndex:traceEndIndex,:);
        padnan = nan(length(alignedMatrix)-length(alignedData), size(alignedData,2));
        alignedData = vertcat(alignedData, padnan);

    elseif preIndex<0 && length(tempdata)<postIndex % missing values at beginning and end...
        traceStartIndex = 1;
        traceEndIndex = length(tempdata);
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);

        prepad = nan(abs(preIndex),size(alignedData,2));
        postpad = nan(abs(preIndex)+length(alignedData)-1,size(alignedData,2));
    end

     
    alignedTime = linspace(-window,window,length(alignedData))';
    alignedMatrix(1:length(alignedData),i) = alignedData(:,speedColumn);
    
end

entryFlag = cleanedFluxData(:,2)==1;
entryData = alignedMatrix(:,entryFlag');
exitData = alignedMatrix(:,~entryFlag');


entrymean = mean(entryData,2,'omitnan');
exitmean = mean(exitData,2,'omitnan');



summaryHeaders = {'Event Time', 'Entry(+1)/Exit(-1)', 'Worm ID', 'X Location', 'Y Location', 'Region ID' };
meanHeaders = {'Time (s)', 'Entry Speed', 'Exit Speed'};



outname = [fullfile(d(1).folder, r{1}) '_FluxData.xlsx'];
writecell(summaryHeaders, outname, 'Sheet', 'All Events', 'Range','A1')
writematrix(cleanedFluxData, outname, 'Sheet', 'All Events', 'Range','A2')

writecell(meanHeaders, outname, 'Sheet', 'All Events', 'Range','H1')
writematrix([alignedTime entrymean exitmean], outname, 'Sheet', 'All Events', 'Range','H2')

writematrix(entryData, outname, 'Sheet', 'Entry')
writematrix(exitData, outname, 'Sheet', 'exit')




end