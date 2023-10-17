function [ meanvel, meanang ] = Dwell2Roam( foldername,print, codeout, units )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here 
%foldername = 'E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304';
if isempty(codeout) == 1
    codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,119';
end

if isempty(print)
    print = 1;
end

if isempty(units)
    units = 1;
end


%% Find positions of speed and angular velocity in dat file
i = regexp(codeout, '-o', 'split');
ii = regexp(i{2}, '--', 'split');
iii = regexp(ii{1}, ',', 'split');

iii = [{'time'} iii];

spidx = strcmp(iii,'speed');
angidx = strcmp(iii,'angular');


numpar = numel(iii);
%% get prefix for datfile

files = dir(foldername);

z = regexp(files(3).name, '\.', 'split');
prefix = z{1};
datpath = [foldername '\' prefix '.dat'];


fmt='';
for i = 1:numpar+1    
    fmt = [fmt '%f'];
    i =i+1;
end

 
datpath
fid = fopen(datpath);
data = textscan(fid, fmt);

vel = data{:,spidx};
ang = data{:,angidx};

s = 1;
for e = 1:length(vel)/40
    meanvel(e,1) = mean(vel(s:s+39));
    meanang(e,1) = mean(ang(s:s+39));
    s = s+40;
       
end
if print == 1
figure()
scatterhist(meanang, meanvel, 'Direction', 'out', 'Marker', '.')
%scatter(meanang, meanvel, '.')
set(gca, 'Xlim', [0,100], 'Ylim', [0,.3])

xlabel 'Angular Velocity(deg/sec)'

if units == 0    
    ylabel 'Velocity(um/s)'
elseif units == 1
    ylabel 'Velocity(lengths/s)'
end
end
