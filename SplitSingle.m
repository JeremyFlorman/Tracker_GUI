function [ output_args ] = SplitSingle( foldername, codeout )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%foldername = 'C:\Users\Alkema\Desktop\Jeremy\Stress_Experiments\N2_Tap+Fe\170719_N2_Tap+Fe_rig2\20160701_173155';
%codeout  = 'java -Xmx1200m -cp C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\Alkema\Desktop\MWT_files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography C:\Users\Alkema\Desktop\Jeremy\Stress_Experiments\N2_Tap+Fe\170719_N2_Tap+Fe_rig2\20160701_173155 -p 0.013272 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o speed,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report';



parts = regexp(codeout, ' -p', 'split');
subparts = regexp(parts{2}, ' ', 'split');
subpath = regexp(parts{1}, 'Choreography', 'split');
prepath = regexp(foldername, '\', 'split');
parentname = strrep(foldername, ['\' prepath{end}], '');
oldscale = subparts{2};

foldername


 

    
    [scale] = AutoScale(parentname) ;        % gets scale of outer folder
    proscale = str2double(scale);
    proscale = 1/proscale;
    proscale = num2str(proscale);

    tempcode = strrep(codeout, oldscale, proscale);
    tempcode = strrep(tempcode, subpath{end}, [' ' foldername]);

   
   tempcode = strrep(tempcode, '-I', '');
   tempcode = strrep(tempcode, '--map', '');
    
    
    disp(tempcode) 
    disp(['scale: ' scale])
    
%%    
    
contents = dir(foldername);
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

outFile_dat = fullfile(foldername,[outputPrefix,'_dat.txt']);
outFile_trig = fullfile(foldername,[outputPrefix,'.trig']);
outFile_trpms = fullfile(foldername,[outputPrefix,'.trp.ms']);
outFile_rptms = fullfile(foldername,[outputPrefix,'.rpt.ms']);

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
    fileList = dir(foldername);
    % Sort by created date
    [~,idx] = sort([fileList.datenum],'descend');
    fileList = fileList(idx);
    
    % Find the files with the specific suffixes
    datIdx = find(~cellfun('isempty',regexp({fileList.name},'.dat$')),1);
    rptmsIdx = find(~cellfun('isempty',regexp({fileList.name},'.rpt.ms$')),1);
    trigIdx = find(~cellfun('isempty',regexp({fileList.name},'.trig$')),1);
    trpmsIdx = find(~cellfun('isempty',regexp({fileList.name},'.trp.ms$')),1);
    
fullfile(foldername,fileList(datIdx).name)
fidx = l;
    
    datfid = fopen(fullfile(foldername,fileList(datIdx).name), 'r+');
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
s = whos('line');
disp(s.bytes/1000000)
end


dfid = fopen(outFile_dat, 'w');
fwrite(dfid, cell2mat(line))
fclose(dfid)
  


disp('Job Dun!')

s = whos('line');
f = num2str(s.bytes/1000000);

disp(['filesize = ' f ' MB'])

end

