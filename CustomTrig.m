function [trig, outputs, outputflag] = CustomTrig(foldername,dt,times,codeout)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\N2\171103_N2\20171103_135539';
%dt = 3;
%times = [295,300];

outputflag = '';
if isempty(codeout)
    codeout = 'java -Xmx10000m -cp C:\Users\MWT\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\MWT\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\MWT\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\MWT\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\N2\171103_N2\20171103_135539 -p 0.013514 -s 0.25 -T 0.25 -t 20 -M 5 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,kink,bias,pathlen,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,120';
    outputflag = 'No Parameters Detected, assuming default parameters';
end

c = regexp(codeout, '-o ', 'split');
c = regexp(c{end}, '--shadowless', 'split');
c = regexp(c{1}, ',', 'split');
outputs = [{'Time'} c];

datname = ls([foldername '\*.dat']);
datname = [foldername deblank(datname(end,:))];

data = dlmread(datname);
trig = NaN(length(times), size(data,2));


for i = 1:length(times)
    startidx = find(floor(data(:,1)) == times(i), 1);
    endidx = find(floor(data(:,1)) == times(i)+dt, 1);
    t = mean(data(startidx:endidx, :));
    if i == 1
        trig = t; 
    elseif i>1
        trig = vertcat(trig, t);
    end
end

outname = [foldername '\CustomTrig_dt_' num2str(dt) 'sec.txt'];
dlmwrite(outname, trig, ' ')

end

