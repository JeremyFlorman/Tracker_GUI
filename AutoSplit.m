function [ output_args ] = AutoSplit( foldername, codeout )
%Splits analysis of Multi Worm Tracker experiments to facilitate analysis
%of long duration experiments. run one experiment using 
%'process experiment' in the Tracker_GUI to generate an example code that
%will be used to analyze subsuquent experiments. Select the parent folder
%then run AutoSplit. 

%codeout = 'java -Xmx1200m -cp C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography C:\Users\Alkema\Desktop\ManuChris\170707_Mec4_Chrimson_+ATR\20160701_121954 -p 0.014703 -s 0.2 -T 0.2 -t 5 -M 0.5 --minimum-biased 3 --from 0 --to 450 --plugin amp@Amplitude -o goodnumber,speed,angular,midline,kink,bias,curve,dir,tap,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report';
%foldername = 'C:\Users\Alkema\Desktop\ManuChris\';

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
    
%%    
    
contents = dir(fullkidname);
fixidx = find(~cellfun('isempty',regexp({contents.name},'.set$')),1);
outputPrefix = contents(fixidx).name;
op= regexp(outputPrefix, '\.', 'split');
outputPrefix = [op{1} '_combined'];

startTime = 0;
endTime = 9000;
incrTime = 1000;


times = (startTime:incrTime:endTime)';
times = [times(1:end-1),times(2:end)];
if times(end,2)~=endTime
    times = [times;[times(end,2),endTime]];
end

outFile_dat = fullfile(fullkidname,[outputPrefix,'_dat.txt']);
outFile_trig = fullfile(fullkidname,[outputPrefix,'.trig']);
outFile_trpms = fullfile(fullkidname,[outputPrefix,'.trp.ms']);
outFile_rptms = fullfile(fullkidname,[outputPrefix,'.rpt.ms']);

f_dat = fopen(outFile_dat,'w');
f_trig = fopen(outFile_trig,'w');
f_trpms = fopen(outFile_trpms,'w');
f_rptms = fopen(outFile_rptms,'w');
fclose(f_dat);
fclose(f_trig);
fclose(f_trpms);
fclose(f_rptms);

outdat = [];

l=1;
line = {};
for k = 1:size(times,1)

    doscommand = [tempcode ' --from '  num2str(times(k,1)) ' --to ' num2str(times(k,2))]
   % doscommand = [commandStr{1},num2str(times(k,1)),commandStr{2},num2str(times(k,2)),commandStr{3}]
    dos(doscommand)

    % Find the latest .DAT, .RPT.MS, .TRIG, and .TRP.MS file 
    fileList = dir(fullkidname);
    % Sort by created date
    [~,idx] = sort([fileList.datenum],'descend');
    fileList = fileList(idx);
    
    % Find the files with the specific suffixes
    datIdx = find(~cellfun('isempty',regexp({fileList.name},'.dat$')),1);
    rptmsIdx = find(~cellfun('isempty',regexp({fileList.name},'.rpt.ms$')),1);
    trigIdx = find(~cellfun('isempty',regexp({fileList.name},'.trig$')),1);
    trpmsIdx = find(~cellfun('isempty',regexp({fileList.name},'.trp.ms$')),1);
    

    fidx = l;
    datfid = fopen(fullfile(fullkidname,fileList(datIdx).name), 'r+');
    while ~feof(datfid)
        line{l} = fgets(datfid);
        l=l+1;
    end
    
lidx = l-1;
    
    fline = regexp(line{fidx}, ' ', 'split');
    lline = regexp(line{lidx}, ' ', 'split');
nfline = strrep(line{fidx}, fline{2}, 'NaN');
nlline = strrep(line{lidx}, lline{2}, 'NaN');


line(fidx) = {nfline};
line(lidx) = {nlline};

end


dfid = fopen(outFile_dat, 'w');
fwrite(dfid, cell2mat(line))
fclose(dfid)
  

end
disp('Job Dun!')

end


