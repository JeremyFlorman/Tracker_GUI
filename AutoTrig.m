function [ output_args ] = AutoTrig( foldername, codeout)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isempty(codeout) == 1
    codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,119';
end

%foldername = 'C:\mwt\n2';
foldercontents = dir(foldername);
parentfolders = {foldercontents([foldercontents.isdir]).name};
parentfolders = parentfolders(3:end);
numparent = numel(parentfolders, ':', ':');

[match, split] = regexp(foldername, '\', 'split');


t = regexp(codeout, '--trigger ', 'split');
t = regexp(t{end}, ',', 'split');
t = t{1};

excelname = [foldername '\Autotrig_' match{end} '_(' t 's).xlsx'];

params = regexp(codeout, '-o', 'split');
params = regexp(params{end}, '--shadowless', 'split');
params = regexp(params{1}, ',', 'split');
params = [{'Time'}, params]

numoutputs = length(params);
fmt='';
for i = 1:numoutputs    
    fmt = [fmt '%f'];
end

trigdata = [];
for z = 1:numparent                     % outerfolder loop
    subname = parentfolders{z};
    parentname = [foldername '\' subname];
    disp(['Crunching:' parentname])
    
    
    kids = dir(parentname);
    kidfolders = {kids([kids.isdir]).name};
    kidfolders = kidfolders(3:end);
    numkid = numel(kidfolders, ':', ':');
    


for y = 1:numkid
    fullkidname = [parentname '\' kidfolders{y}];    
    
  
    kidname = [fullkidname '\*.trig'];
    trigfile = dir(kidname);
    tn =  trigfile.name;
    trigname = [fullkidname '\' tn]; 
    fid = fopen(trigname);
    temptrig = textscan(fid, fmt);
%    temptrig = readtrig(trigname, 1, numoutputs,numoutputs);
    
trigdata = vertcat(trigdata, temptrig);
end


end
trigdata = cell2mat(trigdata)

delete(excelname)
xlswrite(excelname, params,'Sheet1', 'A1')
xlswrite(excelname, trigdata,'Sheet1', 'A2')

disp('jub dun')
end

