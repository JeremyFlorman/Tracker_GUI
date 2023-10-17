function [data, aligned, popmean] = SignedVelocity( foldername, mintime, maxtime, print)
%UNTITLED Generates velocity traces for individual animals with reverals
%converted to negative values
%   Analyze experiments to generate individual dat files, column order
%   should be 1)time 2)speed 3)bias....
%print = 0;
%mintime = 270;
%maxtime = 330;
%foldername = uigetdir('E:\')
%foldername = 'C:\MWT\Tap_Strength\180911_N2_Strong\20180911_105104';

pps = 4;
ii = 1;
files = dir([foldername '\*.dat']);
for i = 1:length(files)
    datnames(i) = {files(i).name};
    datlength(i,1) = length(files(i).name);
end

if numel(datnames) == 1
    error('Only 1 .dat file found, set IDs to "all" to get individual .dat files')
elseif numel(datnames) > 1
    
    [mn,i] = min(datlength);
    mx = max(datlength);
    
    if  mn ~= mx
        datnames(i) = [];
    end
    
    tempdata = {};
    temptime = [];
    tempvel = [];
    tempbias = [];
    
    
    pretime = -((maxtime-mintime)/2); %% use these if setting time before and after by variables in tracker gui
    posttime = ((maxtime-mintime)/2);
    
    data = struct();
    data.timeline = (pretime:(1/pps):posttime)';
    zpoint = find(data.timeline == 0);
    aligned = NaN(((maxtime-mintime)*pps)+1,length(datnames));
    time = NaN(((maxtime-mintime)*pps)+1,length(datnames));
    
    p = 1;
    for i = 1:length(datnames)
        
        tempdata = dlmread([foldername '\' datnames{i}]);
        
        temptime = tempdata(:,1);
        tempvel = tempdata(:,2);
        tempbias = tempdata(:,3);
        tempbias(tempbias == 0) = 1;
        signedvel = tempvel.*tempbias;
        
        data(i).dat = tempdata;
        data(i).dat(:,2) = signedvel;
        %%
        ind = find(floor(data(i).dat(:,1)) == 300,1);
        relend = length(signedvel)-ind;
        pt = pps*posttime;
        
        
        
        
        %% fit all speed traces to data point per second using common time scale
        
        tt = floor(temptime*pps)/pps;   %% round time to points per second
        fp = tt(1)*pps;                 %% index of first time point
        lp = tt(end)*pps;               %% index of last time point
        
        stim = find(tt==300);
        signedvel(isnan(signedvel)) = 0;

        try

                aligned(fp:lp,i) = signedvel;   %% align data to common timescale
                time(fp:lp,i) = tt;             %% align time to common timescale
             
         
        catch
            
        end
        
        
        
        
        
        %%       Overly complicated method that works best for small time windows
        oldway = 0;
        if oldway == 1
            
            if ~isempty(ind)
                if length(signedvel) >= ind+pt && ind-pt>0 %% full track availible
                    aligned(1:end,p) = signedvel(ind-pt:ind+pt);
                    time(1:end,p) = temptime(ind-pt:ind+pt);
                    p = p+1;
                elseif length(signedvel) >=ind+(1*pt) && ind-pt>0 %% full beginning but track ends before 15s
                    aligned(1:pt+1+relend,p) = signedvel(ind-pt:end);
                    time(1:pt+relend,p) = temptime(ind-pt:end);
                    p=p+1;
                elseif length(signedvel) >= ind+pt+1 && ind-pt<0 %% starts late but rest of track complete
                    aligned(pt+2-ind:end,p) = signedvel(1:ind+pt);
                    time(pt+2-ind:end,p) = temptime(1:ind+pt);
                    p = p+1;
                elseif length(signedvel) >= ind+(1*pt) && ind-pt<0 %% starts late ends early
                    aligned(pt+2-ind:pt+1+relend, p) = signedvel(1:end);
                    time(pt+2-ind:pt+1+relend, p) = temptime(1:end);
                    p = p+1;
                end
            end
        end
        
    end
    
    aligned(aligned==0) = NaN;
    %  aligned = aligned(:,1:p-1);
    if max(time(zpoint,:)) == min(time(zpoint,:))
        disp([foldername ' is all good'])
    elseif max(time(zpoint,:)) ~= min(time(zpoint,:))
        disp(['Error!!!  ' foldername  ' Error!!!']);
        disp(['min = ' num2str(min(time(zpoint,:))) ' max = ' num2str(max(time(zpoint,:)))]);
    end
    
end



popmean = mean(aligned, 2,'omitnan');
print = 0;
if print == 1
    t = -30:1/pps:30;
    y = mean(aligned,2, 'omitnan');
    plot(t, y)
    ylim([-.5, .25])
    xlim([-30, 30])
end

figure()
mesh(aligned) 
dlmwrite([foldername '\SignedVelocity.txt'], aligned, 'delimiter', ' ')
dlmwrite([foldername '\populationmean.txt'], popmean, 'delimiter', ' ')
end



