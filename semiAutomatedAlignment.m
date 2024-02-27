function [alignedMatrix] = semiAutomatedAlignment(folder,varargin)
%semiAutomatedAlignment aligns MWT data based on when an Event occurs,
%such as encountering a bacterial lawn.
%
%   worm IDs and Event times can be obtained from viewing the map/video
%   output in Tracker_GUI (Display Data = Map). Individual worm .dat files
%   are required. Type "all" in the IDs box in Tracker_GUI to output
%   individual worm .dat files.
%
%   Enter IDs and Event Times into a spreadsheet with the filename ending
%   in "...times.xlsx". The file should be placed in the same folder as the
%   .dat files. Column A is worm ID and Column B is time of the event.
%   multiple worms IDs and times can be stacked in their respective
%   columns.
%
%   Aligned data will be written to the "...times.xlsx" file on a new sheet
%   called "AlignedVelocity". Close the "...times.xlsx" file to avoid an
%   error.
%
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Call semiAnnotatedAlignment with inputs, or define them below in the
%   "inputs section".
%
%   folder:
%   path to experiment folder (i.e. folder containing
%   .dat files).
%
%
%   window:
%   Amount of data (in seconds) to display before and after the
%   event. default = 60.
%
%   abslouteSpeed: 
%   How to report velocity data.
%   absoluteSpeed == 1, the default MWT instantaneous velocity is used.
%   absoluteSpeed == 0, signed velocity is used (i.e. backward velocity is
%   negative). 
%   default = 1. 
%
%   smoothFactor: Smooths data. Requires curve fitting toolbox. If
%   smoothFactor == 0, no smoothing, raw data will be aligned. Otherwise,
%   enter the number of data points to use for moving-average smoothing.
%   4 points per second the is default sampling rate in Tracker_GUI so
%   smoothFactor = 4 would smooth with a 1 second moving-average window.
%   default = 0.
%
% see also Tracker_GUI



 
%% inputs section!
if nargin  <1
%     folder = uigetdir('C:\Users\AlkemaLab\Desktop\Deyana\Patch_Dilution\')
    folder = 'C:\Users\Jeremy\Desktop\semiAutomatedAlignment\example_data\20230126_160037';
    
    window = 50; % time before and after event to display
    absoluteSpeed = 1;  % 1 = instantaneous velocity, 0 = signed velocity (backward = negative)
    smoothFactor = 0;
else
    window = varargin{1};
    absoluteSpeed = varargin{2};
    smoothFactor = varargin{3};
end

%%

timePath = dir([folder '\*times.xlsx']);
eventInfo = readtable(fullfile(timePath(1).folder,timePath(1).name));

alignedMatrix = nan(window*2*4+1, size(eventInfo,2));
Entry = nan(window*2*4+1, size(eventInfo,2));
count1 = 1;
Exit = nan(window*2*4+1, size(eventInfo,2));
count2 = 1;
% preTapExit = nan(window*2*4+1, size(eventInfo,2));
% count3 = 1;
% postTapExit = nan(window*2*4+1, size(eventInfo,2));
% count4 = 1;
figure;
for i = 1:size(eventInfo,1)
    eventID = eventInfo{i,1};
    eventTime = eventInfo{i,2};
    eventType = eventInfo{i,3};
    

    id = num2str(eventID,'%05.f');
    dat = dir([folder '\*' id '.dat']);
    tempdata = readmatrix(fullfile(dat.folder,dat.name));

    [~, index] = min(abs(tempdata(:,1)-eventTime));


    preIndex = index-window*4; % start value aligned window
    postIndex = index+window*4; % end value of aligned window

    %% align data and deal with missing values
    if preIndex>0 && length(tempdata)>postIndex % complete trace is available...
        traceStartIndex = preIndex;
        traceEndIndex = postIndex;
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);
        
        matrixStartIndex = 1;
        matrixEndIndex = length(alignedMatrix);

    elseif preIndex<0 && length(tempdata)>postIndex  % missing values only at beginning...
        traceStartIndex = 1;
        traceEndIndex = postIndex;
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);

        matrixStartIndex = abs(preIndex);
        matrixEndIndex = abs(preIndex)+length(alignedData)-1;
    
    elseif preIndex>0 && length(tempdata)<postIndex % missing values only at end...
        traceStartIndex = preIndex;
        traceEndIndex = length(tempdata);
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);
        
        matrixStartIndex = 1;  
        matrixEndIndex = length(alignedData);

    elseif preIndex<0 && length(tempdata)<postIndex % missing values at beginning and end...
        traceStartIndex = 1;
        traceEndIndex = length(tempdata);
        alignedData = tempdata(traceStartIndex:traceEndIndex,:);

        matrixStartIndex = abs(preIndex);
        matrixEndIndex = abs(preIndex)+length(alignedData)-1;
    end

    
    alignedTime = linspace(-window,window,length(alignedData));

    %% signed velocity (i.e. backward = negative)
    if absoluteSpeed == 0
        bias = alignedData(:,6);
        bias(bias==0) = 1;
        if smoothFactor == 0
            velocity = alignedData(:,3).*bias;
        else
            velocity = smooth(alignedData(:,3).*bias, smoothFactor);
        end

    elseif absoluteSpeed ==1
        if smoothFactor == 0
            velocity = alignedData(:,3);
        else
            velocity = smooth(alignedData(:,3),smoothFactor);
        end

    end

    plot(alignedTime,velocity)
    hold on
    alignedMatrix(matrixStartIndex:matrixEndIndex,i) = velocity;
%% group data based on additional parameters 
         if strcmpi(eventType,'enter') == 1
             Entry(matrixStartIndex:matrixEndIndex,count1) = velocity;
             count1 = count1+1;
         elseif strcmpi(eventType,'exit') == 1
             Exit(matrixStartIndex:matrixEndIndex,count2) = velocity;
             count2 = count2+1;
         end

%     if strcmpi(eventType,'enter') == 1
%         if eventTime < 900
%             preTapEntry(matrixStartIndex:matrixEndIndex,count1) = velocity;
%             count1 = count1+1;
%         elseif eventTime > 900
%             postTapEntry(matrixStartIndex:matrixEndIndex,count2) = velocity;
%             count2 = count2+1;
%         end
%     elseif strcmpi(eventType,'exit') == 1
%         if eventTime < 900
%             preTapExit(matrixStartIndex:matrixEndIndex,count3) = velocity;
%             count3 = count3+1;
%         elseif eventTime > 900
%             postTapExit(matrixStartIndex:matrixEndIndex,count4) = velocity;
%             count4 = count4+1;
%         end
%     end

        
end
outname = fullfile(timePath(1).folder,timePath(1).name)
writematrix(alignedMatrix,outname,'Sheet','AlignedVelocity')


if count1>1
    writematrix(Entry,outname,'Sheet','preTapEntry')
end

if count2>1 
    writematrix(Exit,outname,'Sheet','postTapEntry')
end
 
% if count3>1 
%     writematrix(preTapExit,outname,'Sheet','preTapExit')
% end
% 
% if count4>1
%     writematrix(postTapExit,outname,'Sheet','postTapExit')
% end
    
hold off
end