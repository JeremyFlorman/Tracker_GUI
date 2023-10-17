function [ metatrace ] = BatchOmegaTrace( parentfolder, codeout, outputs, align, ...
    omgpre, omgpost, reprocess)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%parentfolder = 'E:\jeremy\OmegaExperiments\N2\150714_N2'
%codeout
%outputs 
%align
%timepre 
%timepost
%reprocess

splits = regexp(parentfolder, '\', 'split');
excelname = [parentfolder '\' splits{end} '_OmegaTraces.xlsx'];
%% indexes into parent folder to identify directories and remove non-folders
contents = dir(parentfolder);
f = {contents.isdir};
names = {contents.name};
t= 1;
for i = 1:length(f)
    
    if f{i} == 1
        folders(t) = {[parentfolder '\' names{i}]};
        t = t +1;
    end
end
folders = folders(3:end);
print = 0; %% Print individual excel files? (1=yes, 0=no)

speed = [];
kink = [];
curve =[];
amp =[];
relamp = [];
angular = [];
omega = [];
bias = [];

for p = 1:length(folders)
    foldername = folders{p};
    batch = 1;
 % try 
    [trace] = OmegaTrace(foldername,codeout,outputs, align, omgpre, omgpost, reprocess,print,batch);
        if p == 1
            speed = trace(:).speed;
            kink = trace(:).kink;
            curve =trace(:).curve;
            amp = trace(:).amp;
            relamp = trace(:).relamp;
            angular = trace(:).angular;
            omega = trace(:).omega;
            bias = trace(:).bias;
        else
            speed = horzcat(speed, trace(:).speed(:,2:end));
            kink = horzcat(kink, trace(:).kink(:,2:end));
            curve = horzcat(curve, trace(:).curve(:,2:end));
            amp = horzcat(amp, trace(:).amp(:,2:end));
            relamp = horzcat(relamp, trace(:).relamp(:,2:end));
            angular = horzcat(angular, trace(:).angular(:,2:end));
            omega = vertcat(omega, trace(:).omega(:,:));
            bias = horzcat(bias, trace(:).bias(:,2:end));

        end   


    metatrace.speed = speed;
    metatrace.kink = kink;
    metatrace.curve = curve;
    metatrace.amp = amp;
    metatrace.relamp = relamp;
    metatrace.angular = angular;
    metatrace.omega = omega;
    metatrace.bias = bias;
  %catch ME
  %    n = regexp(folders{p},'\', 'split')
  %    disp(['Error on: ' n{end} '...' ME.message])
  %end
  

end
delete(excelname)

if ~isempty(speed)
    xlswrite(excelname, speed, 'Speed Trace', 'A1')
end

if ~isempty(bias)
    xlswrite(excelname, bias, 'Bias Trace', 'A1')
end

if ~isempty(kink)
    xlswrite(excelname, kink, 'Kink Trace', 'A1')
end

if ~isempty(curve)
    xlswrite(excelname, curve, 'Curve Trace', 'A1')
end

if ~isempty(amp)
    xlswrite(excelname, amp, 'Raw Amp', 'A1')
end

if ~isempty(relamp)
    xlswrite(excelname, relamp, 'Normalized Amp', 'A1')
end

if ~isempty(angular)
    xlswrite(excelname, angular, 'Angular Vel', 'A1')
end

if ~isempty(omega)
   xlswrite(excelname, omega, 'Tap Induced Omega Time', 'A1') 
end

hist(omega, 300:1:315)
xlim([300,315]);
title('Omega timing distribution')

 disp('I Got Your Traces, You Got The Money?')
