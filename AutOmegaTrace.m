function [ output_args ] = AutOmegaTrace(parentfolder, codeout, outputs, align, ...
    omgpre, omgpost, reprocess)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%parentfolder = 'E:\jeremy\OmegaExperiments\NewOmega\QW1655_Pflp-18_FLP-18(ox)';
%codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\NewOmega\QW1655_Pflp-18_FLP-18(ox)\161208_QW1655\20161208_112541 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,dir,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 30,tap::0 ';
%outputs = [];
%align = [];
%omgpre = 30;
%omgpost = 30; 
%reprocess = 0;


prefix = regexp(parentfolder, '\', 'split');
excelname = [parentfolder '\' prefix{end} '_AutOmega.xlsx'];

%% indexes into parent folder to identify directories and remove non-folders
updir = dir(parentfolder);
f = {updir.isdir};
f=cell2mat(f);
upnames = {updir(f).name};
upnames = upnames(3:end);


    speed = [];
    kink = [];
    curve = [];
    amp = [];
    relamp = [];
    angular = [];
    omega = [];
    bias = [];



for i = 1:length(upnames)
    tempname = [parentfolder '\' upnames{i}]
    [ metatrace ] = BatchOmegaTrace( tempname, codeout, outputs, align, ...
    omgpre, omgpost, reprocess)

if i == 1
    speed = metatrace(:).speed;
    kink = metatrace(:).kink;
    curve =metatrace(:).curve;
    amp = metatrace(:).amp;
    relamp = metatrace(:).relamp;
    angular = metatrace(:).angular;
    omega = metatrace(:).omega;
    bias = metatrace(:).bias;
else
    speed = horzcat(speed, metatrace(:).speed(:,2:end));
    kink = horzcat(kink, metatrace(:).kink(:,2:end));
    curve = horzcat(curve, metatrace(:).curve(:,2:end));
    amp = horzcat(amp, metatrace(:).amp(:,2:end));
    relamp = horzcat(relamp, metatrace(:).relamp(:,2:end));
    angular = horzcat(angular, metatrace(:).angular(:,2:end));
    omega = vertcat(omega, metatrace(:).omega(:,:));
    bias = horzcat(bias, metatrace(:).bias(:,2:end));
    
end   
    
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

disp(['Boom! finished: ' parentfolder])

end

