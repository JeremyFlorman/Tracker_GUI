function [] = FluxCode(foldername,numCircles,handles)
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

elp = NaN([numCircles 4]);


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
% regionLabels = {'1','2','3','4','5','6','7','8','9','10', 'eleven', 'twelve', 'thirteen','fourteen', 'fifteen'};
fluxcode = ''; 

fluxType = handles.FluxOutputType{:};
    for i=1:numCircles
        tempRegion = [' --plugin Flux::+E,' num2str(round(elp(i,1))) ',' num2str(round(elp(i,2))) ',' ...
            num2str(round(elp(i,3))/2) ',' num2str(round(elp(i,4))/2) '::' fluxType...
            '::report::postfix=' num2str(i)];

            fluxcode = [fluxcode tempRegion];
        
    end


codeout = getCodeout(handles);
codeout = [codeout fluxcode]
dos(codeout)



end

