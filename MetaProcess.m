function [ output_args ] = MetaProcess( foldername, codeout )
%Analyzes a 3-Tiered nested folder structure using the most recent "process
%experiment" command issued.
%   Arrange folders as follows: Parent Folder -> Genotype Folders -> Daily
%   Experimental Folders -> Individual Experiment Folders. The daily
%   experiment folders must contain a Calibration image in tiff format with
%   the number of pixels per millimeter included in the filename in the
%   format "[calibration name](xx-xx).tif" the x's denoting numbers and the
%   hypen replacing the decimal if necessary. eg:
%   161221_Calibration(67-25).tif or 161221_Calibration(67).tif. this is
%   requried to set the scale while analyzing subfolders.

if isempty(codeout)
codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\161221_N2\20120704_110709 -p 0.014403 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,dir,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 90,210,300'
end

%foldername = 'E:\jeremy\OmegaExperiments\NewOmega';

subfold = dir(foldername);
for i = 3:length(subfold)
    tempname = [foldername '\' subfold(i).name];
    disp(['MetaCrunching:  ' tempname])
AutoDeleteAll(tempname)
try
AutoProcess(tempname, codeout)
AutoTrig(tempname,codeout)
AutoTrp(tempname,codeout)
catch 
end
end
disp('I Have Crunched Everything Master')
end

