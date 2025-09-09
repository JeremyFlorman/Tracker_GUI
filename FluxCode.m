function [sortcat] = FluxCode(codein,foldername, numCircles, fluxFlag)
%FluxCode - this is a function to interface with the choreography based 
%Flux plugin (Rex Kerr), using the 'Tracker_GUI' framework (Jeremy Florman). 
%
%when called from Tracker_GUI all input variables except for "output"
%and "numCircles" will be automatically provided by the settings in the
%'quality control' panel (upper left) of Tracker_GUI. numCircles and output
%are specified in a panel currently called Flux and determine ROI behavior
%(numCircle) and plugin output (output). See documentation in choreography
%"--plugin Flux::help" for details, or ask Jeremy. 
%
%Unlike other functions in the Tracker_GUI, FluxCode launches its own
%choreography analysis of the data indicated by the path selected in
%"select data". Changing output parameters in the Tracker_GUI will not
%affect analysis. To change parameters, adjust the string in "code5" as
%well as the 'outputnames' cell array at the end of the function. 
% 


%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\combinedFLPs\N2\171103_N2\20171103_135539';
%numCircles = 2;
elp = NaN([numCircles 4]);


pf = regexp(foldername, '\', 'split');
parentfolder = strrep(foldername, pf{end}, '');
% scale = AutoScale(parentfolder);
% scale = num2str(1/str2double(scale));

% window = 0.25;
% minlength = 1;
% mindur = 1;
% samplerate = 0.25;
% fwdbias = 3;

img = dir([foldername '\*.png']);
img = imread(fullfile(img(1).folder, img(1).name));
figure()
img = imrotate(img, -90);
imshow(fliplr(img))


for i = 1:numCircles
disp(['Defining region ' num2str(i) ' of ' num2str(numCircles)])
rect = getrect(); 
h = imellipse(gca, rect); 
disp('- Adjust ellipse then press any key to continue'); 
pause();

elp(i,:) = h.getPosition; 

elp(i,1) = elp(i,1)+elp(i,3)/2; % convert x from corner to center point
elp(i,2) = elp(i,2)+elp(i,4)/2; % convert y from corner to center point
hold on
plot(elp(i,1),elp(i,2), 'or')

end
%%


% code1 = 'java -Xmx15g -cp C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\scala-library.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\Chore.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\IchiMwt.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\commons-math3-3.1.1.jar Choreography ';
% code2 = foldername; 
% code3 = [' -S -p ' scale];
% code4 = [' -s ' num2str(window) ' -T ' num2str(samplerate) ' -t '...
%     num2str(mindur), ' -M ' num2str(minlength) ' ']; 
% code5 = '--minimum-biased 3 --body-length-units --map --plugin amp@Amplitude -o goodnumber,speed,angular,kink,bias,pathlen,curve,tap,amp,loc_x,loc_y,custom::Flux --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report -Nall';      
% 
% codeout = [code1 code2 code3 code4 code5];

codeout = codein;

%%
fluxcode = ' --plugin Flux::';
ellipses = '';
    for i=1:numCircles
        tempelp = ['E,' num2str(round(elp(i,1))) ',' num2str(round(elp(i,2))) ',' ...
            num2str(round(elp(i,3))/2) ',' num2str(round(elp(i,4))/2)];
        if i == 1
            ellipses = tempelp;
        else
        ellipses = [ellipses '::' tempelp];
        end
        
        % if i==1 
        %     fluxcode = [fluxcode '+' tempelp '::gate::report'];
        % else
        %     fluxcode = [fluxcode '  --plugin Flux::-' tempelp '::gate::postfix=tag'];
        % end
    end           



codeout = [codeout fluxcode ellipses '::' fluxFlag '::gate::report::postfix=tag'];
codeout = strrep(codeout, ' --shadowless',  ',custom::Flux::0 --shadowless')

dos(codeout)


%%

%foldername = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\combinedFLPs\N2\171103_N2\20171103_135539';
dats = dir([foldername '\*.dat']);

if length(dats) <=1 
    dos(codeout)
end

popdat = dlmread(fullfile(dats(end).folder, dats(end).name));

catdata = [];
for i = 1:length(dats)-1
    tempdat = dlmread(fullfile(dats(i).folder, dats(i).name));
    catdata = vertcat(catdata,tempdat);
          
end

[~,idx] = sort(catdata(:,1));
sortcat = catdata(idx,:);
outname = [foldername '\flux.xlsx'];
delete(outname);
outputnames = {'time', 'N', 'Speed','Angular Speed','Kink','Bias','Path length',...
    'Curvature', 'Tap','Amplitude','loc_x','loc_y'};
xlswrite(outname, outputnames,'Sheet1', 'A1')
xlswrite(outname, sortcat,'Sheet1', 'A2')

end

