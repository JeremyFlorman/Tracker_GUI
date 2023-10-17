function [trig, outputs, outputflag] = BatchCustomTrig(foldername,dt,times,codeout)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\N2\171108_N2';
%dt = 3;
%times = [295,300];
%codeout = '';

trig = [];
f = dir(foldername);
f = f([f.isdir]);
f = f(3:end);
        
for i = 1:length(f)
    subpath = [foldername '\' f(i).name '\'];
    [t, outputs, outputflag] = CustomTrig(subpath, dt, times, codeout);
    
    if i == 1
        trig = t;
    elseif i>1
        trig = vertcat(trig, t);
    end
end

trig = sortrows(trig);

outname = [foldername '\CustomTrig_dt_' num2str(dt) 'sec.txt'];
dlmwrite(outname, trig, ' ')
    
end

