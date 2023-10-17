function [ velocity, turning ] = BatchDwell2Roam( folder, codeout, units, print )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%folder = 'E:\jeremy\OmegaExperiments\N2\160330_N2';

if isempty(codeout) == 1
    codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,119';
end

kids = dir(folder);
ii =1;
subpath = {};
for i=1:length(kids)
    if kids(i).isdir == 1
        subpath(ii) = {kids(i).name};
        ii = ii+1;
    end 
end


subpath = subpath(3:end);
velocity = [];
turning = [];
grouping = [];
for p= 1:length(subpath)
    temppath = [folder '\' subpath{p}];
   [tempvel, tempang]= Dwell2Roam(temppath,0, codeout,units);
    velocity = vertcat(velocity, tempvel);
    turning = vertcat(turning, tempang);
    
    
%    tempgroup(1:length(tempvel),1) = {['experiment: ' num]};
%tempgroup(1:length(tempvel),1) = p;
 %   grouping = vertcat(grouping, tempgroup);
end

if print == 1
    figure()
    %grouping = grouping(2:end,1);
    scatterhist(turning, velocity, 'Direction', 'out', ...
        'Marker', '.','MarkerSize', 7, 'NBins', [10,20])
    set(gca, 'Xlim', [0,50], 'Ylim', [0,.3])
    xlabel 'Angular Velocity(deg/sec)'
        if units == 0    
            ylabel 'Velocity(um/s)'
        elseif units == 1
            ylabel 'Velocity(lengths/s)'
        end
end

end

