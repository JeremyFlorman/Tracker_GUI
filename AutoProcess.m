function [ output_args ] = AutoProcess(foldername, codeout)
% Analyzes a 2-tiered nested folder structure using the most recent
% "process experiment" command issued. 
%   Detailed explanation goes here
% will batch process multiple folders and subfolders using a given
% settings. To generate settings for batch processing, process a single
% experiment. this will pass the Choreography code on to the 'Auto Process'
% button in tracker_gui. Next select the parent folder which you want to
% process and press the AutoProcess button

%codeout = 'java -Xmx1000M -cp C:\MWT\Choreography\scala-library.jar;C:\MWT\Choreography\Chore.jar;C:\MWT\Choreography\IchiMwt.jar;C:\MWT\Choreography\commons-math3-3.1.1.jar Choreography C:\MWT\N2\140801_N2\20140801_145432 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o speed,bias,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MeasureReversal::tap::dt=5::idt=0.5::toobrief=0.3::toosmall=7::postfix=txt --plugin MultiSensed::report --trigger 10,tap:10:0';
%chore = 'java -Xmx1000M -cp C:\MWT\Choreography\scala-library.jar;C:\MWT\Choreography\Chore.jar;C:\MWT\Choreography\IchiMwt.jar;C:\MWT\Choreography\commons-math3-3.1.1.jar Choreography';
%foldername = 'C:\MWT\N2';
 

[match, i] = regexp(codeout, ' ', 'split'); % breaks up codeout to remove foldername
first = codeout(1:i(5));
last = codeout(i(8):end);
 

foldercontents = dir(foldername);
parentfolders = {foldercontents([foldercontents.isdir]).name};
parentfolders = parentfolders(3:end);
numparent = numel(parentfolders, ':', ':');




for z = 1:numparent                     % outerfolder loop
    subname = parentfolders{z};
    parentname = [foldername '\' subname];
    disp(['Crunching:' parentname])
    
    [scale] = AutoScale(parentname) ;        % gets scale of outer folder
    proscale = str2double(scale);
    proscale = 1/proscale;
    proscale = num2str(proscale);
    chorescale = [' -p ' proscale];
    
    kids = dir(parentname);
    kidfolders = {kids([kids.isdir]).name};
    kidfolders = kidfolders(3:end);
    numkid = numel(kidfolders, ':', ':');

for y = 1:numkid
    fullkidname = [parentname '\' kidfolders{y}];
    tempcode = [first fullkidname chorescale last];
    
   tempcode = strrep(tempcode, '-I', '');
    tempcode = strrep(tempcode, '--map', '');
    
    
    disp(tempcode) 
    disp(['scale: ' scale])
    

    dos(tempcode)
  
    %kidname = [fullkidname '\*.trig'];
    %trigfile = dir(kidname);
    %tn =  trigfile.name;
    %trigname = [fullkidname '\' tn];
    %trigdata(y) = {readtrig(trigname)};
end
   %trigdata(z) = {vertcat(trigdata{:})}

end

