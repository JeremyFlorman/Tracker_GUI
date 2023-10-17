function [ output_args ] = AutoTrp( foldername,codeout)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isempty(codeout) == 1
    codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,119';
end
%foldername = 'E:\jeremy\OmegaExperiments\AIB_Caspase';
foldercontents = dir(foldername);
parentfolders = {foldercontents([foldercontents.isdir]).name};
parentfolders = parentfolders(3:end);
numparent = numel(parentfolders, ':', ':');

[match, split] = regexp(foldername, '\', 'split');

t = regexp(codeout, '--trigger ', 'split');
t = regexp(t{end}, ',', 'split');
t = t{1};
excelname = [foldername '\AutoTrp_' match{end} '_(' t 's).xlsx'];

tempf = [];
temps = [];
tempr = [];
tempo = [];

for z = 1:numparent                     % outerfolder loop
    subname = parentfolders{z};
    parentname = [foldername '\' subname];
    disp(['Crunching:' parentname])
    
    
    kids = dir(parentname);
    kidfolders = {kids([kids.isdir]).name};
    kidfolders = kidfolders(3:end);
    numkid = numel(kidfolders, ':', ':');
    


[forward, stop, reverse,omega] = BatchMultiSense(parentname);

vecsize = forward(~isnan(forward(:,1)));
v = length(vecsize);

forward = forward(1:v,:);
stop = stop(1:v,:);
reverse = reverse(1:v,:);
omega = omega(1:v,:);

tempf = vertcat(tempf, forward);
temps = vertcat(temps, stop);
tempr = vertcat(tempr, reverse);
tempo = vertcat(tempo, omega);

end
delete(excelname);
headers = {'time', 'window', 'Mean N', 'Action', '# events', 'Mean Duration', 'Stdev Duration', 'Mean Distance', 'Stdev Distance', '% action'};
xlswrite(excelname, headers, 'forward', 'A1');
xlswrite(excelname, tempf, 'forward', 'A2');

xlswrite(excelname, headers, 'stop', 'A1');
xlswrite(excelname, temps, 'stop', 'A2');


xlswrite(excelname, headers, 'reverse', 'A1');
xlswrite(excelname, tempr, 'reverse', 'A2');

xlswrite(excelname, headers, 'omega', 'A1');
xlswrite(excelname, tempo, 'omega', 'A2');

disp('done AutoTrppin')

end

