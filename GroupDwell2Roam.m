function [ output_args ] = GroupDwell2Roam( foldername, codeout, units )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'E:\jeremy\OmegaExperiments\BaRgTest';
%units = 1; 
%codeout = [];
if isempty(codeout) == 1
    codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\OmegaExperiments\N2\160330_N2\20160330_141304 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 180,119';
end


kids = dir(foldername);
ii =1;
subpath = {};
for i=1:length(kids)
    if kids(i).isdir == 1
        subpath(ii) = {kids(i).name};
        ii = ii+1;
    end 
end

groupvel = {};
groupang = {};
subpath = subpath(3:end);
tempvel = [];
tempturn = [];
group = [];
for p = 1:length(subpath)
    temppath = [foldername '\' subpath{p}];
   [vel, turn]= BatchDwell2Roam(temppath, codeout, units,0);
   tempvel = vertcat(tempvel, vel);
   tempturn = vertcat(tempturn, turn);
   
   groupvel(p) = {vel};
   groupturn(p) = {turn};
   groupname(p) = {subpath{p}};
   bigness(p) = length(vel);
   tempgroup = {};
   tempgroup(1:length(vel),1) = {subpath{p}};
   
   group = vertcat(group, tempgroup);
   
    
end
%%
disp('Graphing');
    figure()
    
    scatterhist(tempturn, tempvel,'Group', group, 'Direction', 'out', ...
        'Marker', '.','MarkerSize', 7, 'NBins', [25,25], 'Legend', 'on',...
         'Kernel', 'overlay', 'LineStyle', {'-'})
    set(gca, 'Xlim', [0,35], 'Ylim', [0,.25])
    xlabel 'Angular Velocity(deg/sec)'
        if units == 0    
            ylabel 'Velocity(um/s)'
        elseif units == 1
            ylabel 'Velocity(lengths/s)'
        end
disp('Done Graphing')
%%
disp('Writing Data...')
    matvel(1:max(bigness), 1:length(subpath)) = [NaN];
    for p = 1:length(subpath)
        matvel(1:length(groupvel{p}),p)= groupvel{p};
         matturn(1:length(groupturn{p}),p) = groupturn{p};
    end

        excelname = [foldername '/Dwell2RoamData.xlsx'];
        xlswrite(excelname, groupname, 'Velocity')
        xlswrite(excelname, matvel, 'Velocity', 'A2')
        xlswrite(excelname, groupname, 'Turning Rate')
        xlswrite(excelname, matturn, 'Turning Rate', 'A2')
disp('Process Complete')
end

