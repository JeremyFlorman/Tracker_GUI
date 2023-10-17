function [result] = MetaCustomTrig(foldername,dt,times,codeout)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\';
%dt = 3;
%times = [295,300];
%codeout = '';


trig = [];
f = dir(foldername);        
f = f([f.isdir]);
f = f(3:end);
        
for i = 1:length(f)
    subpath = [foldername '\' f(i).name '\'];
    
    t = AutoCustomTrig(subpath, dt, times, codeout);

end
    

result = 'Done!';   
disp(result)
end