function [trace] = OmegaTrace(foldername,codeout, outputs, align, timepre, timepost, reprocess,print, batch)
%UNTITLED Summary of this function goes here
%   OPENS .RPT files and extracts data around a specified event
% Operating Instructions: Runs on single folders. Requires a folder with a
% population .DAT file which has a 'TAP' parameter. Also Requires
% individual worm .DAT files. Process the experiment once to load the
% 'codeout' value into the function, then call omega trace on a given
% folder. Will produce a '_multisense.xlsx' output file. 


%foldername = 'E:\jeremy\140122_MaxOmegaTest2\20140122_130201';

%codeout = 'java -Xmx1000M -cp C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\scala-library.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\Chore.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\IchiMwt.jar;C:\Users\clarkc4\Desktop\MWT_1.3.0_r1035\ChoreographyNew\commons-math3-3.1.1.jar Choreography E:\jeremy\140122_MaxOmegaTest2\20140122_130201 -p 0.014286 -s 0.25 -T 0.25 -t 20 -M 3 --minimum-biased 3 --body-length-units -I  --plugin amp@Amplitude -o speed,bias,amp --shadowless -S --plugin Reoutline::exp::despike --plugin Respine --plugin SpinesForward --plugin MultiSensed::report --trigger 10,tap::0'; 
%timepre = 10;
%timepost = 15;
%reprocess = 0;

%% print individual excel files (1 = yes, 0 = no)
%print = 0;
%%
timepre =timepre*4;
timepost = timepost*4;

[path, name, ext] = fileparts(foldername);
excelname = [foldername '\' name '_multisense.xlsx'];

[rpt, reversal, omega] = BasicRPT(foldername);
%% finds positions of outputs in dat file to allow indexing into them later!!!


split = regexp(codeout, '-o', 'split'); % breaks outputs in half at -o
split = regexp(split{2}, '--shadowless', 'split');
split = split(1);                        % replaces split contents with just the output names
splat = regexp(split, ',', 'split');    % puts each output name into a cell containing a 1X3 cell
splat = splat{:};                       % converts splat into a 1X3 cell

bias = strfind(splat, 'bias');          % identifies cell containing bias
speed = strfind(splat, ' speed');        % same as above for speed
tap = strfind(splat, 'tap');
kink = strfind(splat, 'kink');
curve = strfind(splat, 'curve');
wrmlen = strfind(splat, 'midline');
angular = strfind(splat, 'angular');

[~,ww] = size(wrmlen);
[~,bw] = size(bias);                   % size
[~,sw] = size(speed);
[~,tw] = size(tap);
[~,kw] = size(kink);
[~,cw] = size(curve);
[~,aw] = size(angular);

wrmlenpos = [];                          % preallocates memory
curvepos = [];
kinkpos = [];
tappos = [];
biaspos = [];                           
speedpos = [];
angpos = [];

for w = 1:ww                            % identifies location of wrmlen in output
    if wrmlen{w} >0
        wrmlenpos = w+1;
    end
end


for b = 1:bw                            % identifies location of bias in output
    if bias{b} >0
        biaspos = b+1;
    end
end

for s=1:sw                              % identifies location of speed in output
    if speed{s} >0
        speedpos = s+1;
    end
end

for t=1:tw
    if tap{t}>0
        tappos = t+1;
    end
end

for k = 1:kw
    if kink{k} > 0
        kinkpos = k+1;
    end
end

for c = 1:cw
    if curve{c} > 0 
        curvepos = c+1;
    end
end

for a = 1:aw
    if angular{a} > 0 
        angpos = a+1;
    end
end

wrmlenpos;
curvepos;
kinkpos;
biaspos;
speedpos;
tappos;
%% works with data

%sorts and arranges rpt
sorpt = sortrows(rpt, [2 1]);
omrev = vertcat(omega, reversal);
somrev = sortrows(omrev, [2 1]);

%gets sizes and preallocates
[omgl, omgw] = size(omega);

omgtime = cell(omgl,1);
ind = cell(omgl,1);
revs = cell(omgl,1);
revstart = cell(omgl,1);
revstop = cell(omgl,1);
cellids = cell(omgl,1);
datdata = cell(omgl,1);
time = cell(omgl,1);
rstart = cell(omgl,1);
rstop = cell(omgl,1);
range = cell(omgl,1);
pre = cell(omgl,1);
post = cell(omgl,1);


%%gets ids and generates codeout

omegaids = mat2str(unique(omega(:,2)'));
ids = unique(omega(:,2)');
omegaids = omegaids(1, 2:end-1)
omegaids = strrep(omegaids, ' ', ',');


%% Reprocessing: generates individual Dat files, Corrects calibration and Path.
spath = regexp(foldername, '\', 'split');
spath = strrep(foldername, spath{end}, '');

prescale = AutoScale(spath)
scale = 1/str2double(prescale);

addn = ' -Nall';
nall = strcat(codeout, addn);               % adds '-Nall to stored codeout

m = regexp(codeout, '-p', 'split');
n = regexp(m{2}, '-s', 'split');
m = regexp(m{1}, 'Choreography', 'split');
oldpath = m{end};                            % finds old path from stored codeout 


fixpath = [ ' ' path '\' name ' '];

newcodeout = strrep(nall, oldpath, fixpath); % replaces old path with current 
                                             % path specified in 'Select
                                             % Data' or passed to this
                                             % function

                                             
scale = [' ' num2str(scale) ' '];

newcodeout = strrep(newcodeout, n{1}, scale);


% sends code out
if reprocess == 1
 dos(newcodeout)
end



%%

for s = 1:length(ids)
stromega(s).ids = ids(1,s);
tempid = num2str(ids(1,s));
makenames = [foldername '\*.*' tempid '.dat'];
filename = dir(makenames);
namenum = numel(filename, ':', ':');

tempname = [foldername '\' filename(1).name];
tempdata = dlmread(tempname);

biasdata = tempdata(:,biaspos);
veldata = tempdata(:,speedpos);
wrmlendata = tempdata(:,wrmlenpos);
angulardata = tempdata(:,angpos);

[vl, vw] = size(veldata);

biasdata(biasdata==0) = 1;

for m = 1:vl
    relvel(m,1) = biasdata(m,1)*veldata(m,1);
end

stromega(s).dat = tempdata;
stromega(s).relvel = relvel;
end

%% finds and reads population datfile.
fnamey = filename.name
datparts = regexp(fnamey, '\.', 'split');
datname = [char(foldername) '\' char(datparts(1)) '.dat'];
dat = dlmread(datname, ' ');
tapdat = dat(:,tappos);


 
%% collects RPT data relevant to each id and adds it to a field in stromega
[rptl, rptw] = size(rpt);
numids = numel(ids, ':', ':');

for idx = 1:length(ids)
    id = stromega(idx).ids;
    ievent = 1;
    oevent = 1;
    revent = 1;
    temprpt = [];
    tempomega = [];
    tempreversal = [];
    revbefore = [];
    temptrace = [];
    for q = 1:rptl
        
        querryid = rpt(q,2);
      
        if id-querryid == 0
            
             temprpt(ievent, 1:6) = rpt(q,:);
             ievent = ievent +1;
             
                if rpt(q,3) == 3
                    tempreversal(revent, 1:6) = rpt(q,:);          %%% groups reversals with id
                    revent = revent+1;
                end
                
                if rpt(q,3) == 4                                %%% groups omegas with id
                    tempomega(oevent, 1:6) = rpt(q,:);
                    otime = rpt(q,1);
                    
                    tracestart = round(otime-timepre);
                    tracestop = round(otime+timepost);
                   
                   % if tracestop< length(stromega(idx).dat)
                   % temptrace = stromega(idx).dat(tracestart:tracestop,:);
                   % else 
                   % temptrace = stromega(idx).dat(tracestart:end,:);
                   % end
                    
                    
                    if revent>1
                    revbefore(oevent, 1:6) = tempreversal(revent-1, :);   %% gets last reversal
                    end
                    oevent = oevent+1;
                    
                end
                
                
                
        end 
    end
   % stromega(idx).tracedat = temptrace(:,:);
    stromega(idx).rpt = temprpt(:,:);
    stromega(idx).omega = tempomega(:,:);
    stromega(idx).reversal = tempreversal(:,:);
    stromega(idx).revbefore = revbefore(:,:);
    
    
end
%    for g = 1:length(ids)
%        if ~isempty(stromega(g).tracedat)
%        speedtrace(:,g) =  stromega(g).tracedat(:,speedpos)
%        end
%    end

    
%% matrix manipulation of stromega data
cellmega = struct2cell(stromega);
%fieldnames(stromega)
allomegas = {cellmega{6,1,:}};
allreversals = {cellmega{7,1,:}};
oreversals = {cellmega{8,1,:}};


oreversals = cell2mat(oreversals');
allreversals = cell2mat(allreversals');
allomegas = cell2mat(allomegas');

[lorev, ~] = size(oreversals);
[lrev ~]= size(allreversals);
orevidx = NaN(lorev, 1);
revidx = NaN(lrev, 1);


for ii = 1:lorev
    time = oreversals(ii,1);
    id = oreversals(ii,2);
    orevidx(ii,1) = time*id;
end

for iii = 1:lrev
    time = allreversals(iii,1);
    id = allreversals(iii,2);
    revidx(iii,1) = time*id;
end

bites = NaN(lorev,1);
predcount = 1;

for k = 1:lorev
    bait = orevidx(k,1);
    for kk = 1:lrev
        prey = revidx(kk,1);
        pred = bait-prey;
            if pred == 0
                bites(predcount,1) = kk;
                predcount = predcount +1;
            end
    end
end

bites = unique(bites);
nans = find(isnan(bites));

bites(nans) = [];



for zz = 1:length(bites)
    chomper = bites(zz,1);
    allreversals(chomper,:) = NaN;
end


%% finds time of tap 

tapindex  = find(tapdat == 1);
taptime = dat(tapindex, 1);



taprevs = [];
otaprevs = [];


taprevlist = find(allreversals(:,1) >= taptime & allreversals(:,1) <= (taptime + 10));
otaprevlist = find(oreversals(:,1) >= taptime & oreversals(:,1) <= (taptime + 10));

for zzz = 1:length(taprevlist)
    taprevs(zzz,:) = allreversals(taprevlist(zzz),:);
    allreversals(taprevlist(zzz),:) = NaN;
end

for xxx = 1:length(otaprevlist)
    otaprevs(xxx,:) = oreversals(otaprevlist(xxx),:);
    oreversals(otaprevlist(xxx),:) = NaN;
end

for mer = 1:length(ids)
       perdat(mer) ={stromega(mer).dat};
end
%% Trace Operations

presec = timepre/4;
postsec = timepost/4;
span = timepre+timepost+1;
traceinc = -presec:0.25:postsec;

speeddata = [];
speedtrace = NaN(span,length(ids));
biasdata = [];
biastrace = NaN(span,length(ids));
kinkdata = [];
kinktrace = NaN(span,length(ids));
curvedata = [];
curvetrace = NaN(span,length(ids));
ampdata = [];
amptrace = NaN(span,length(ids));
relamptrace = NaN(span,length(ids));
timedata = [];
timetrace = [];
relampdata= [];
angdata = [];
angtrace = NaN(span,length(ids));


for der = 1:length(ids)
    if speedpos ~=0 
    tempspeed = perdat{der}(:,speedpos);
    speeddata(1:length(tempspeed),der) = tempspeed;
    end
    
    if biaspos ~=0 
    tempbias = perdat{der}(:,biaspos);
    biasdata(1:length(tempbias),der) = tempbias;
    end
    
    if kinkpos ~=0 
    tempkink = perdat{der}(:,kinkpos);
    kinkdata(1:length(tempkink),der) = tempkink;
    end
    
    if curvepos ~= 0 
    tempcurve = perdat{der}(:,curvepos);
    curvedata(1:length(tempcurve), der) = tempcurve;
    end
    
    if wrmlenpos ~= 0
        tempwrmlen = mean(perdat{der}(:,wrmlenpos));
        meanlendata(1,der) = tempwrmlen;
    end
    
    if angpos ~= 0 
        tempang = perdat{der}(:,angpos);
        angdata(1:length(tempang),der) = tempang;
    end
    
    tempamp = perdat{der}(:,end);
    relamp = tempamp/meanlendata(1,der);
    
    ampdata(1:length(tempamp),der) = tempamp;

    
    temptime = perdat{der}(:,1);
    timedata(1:length(temptime),der) = temptime;
    
    
end



sb = speeddata == 0; 
kb = kinkdata == 0;
cb = curvedata == 0;
ab = ampdata == 0;
tb = timedata == 0;
rb = relampdata == 0;
%angb = angdata == 0;

speeddata(sb) = NaN;
kinkdata(kb) = NaN;
curvedata(cb) = NaN; 
ampdata(ab) = NaN;
relampdata(rb) = NaN;
timedata(tb) = NaN;
%angdata(angb) = NaN;


ids = ids';

for blah = 1:length(ids)
    idtime = timedata(:,blah);
    tempindex= find(idtime == taptime);
    if ~isempty(tempindex)
        
        timelength = length(idtime);
        preindex = tempindex - timepre;
        postindex = tempindex + timepost;
        
        
        
        if preindex > 0 && postindex <= timelength
            speedtrace(1:span, 1) = traceinc;
            
            
            
            
            speedtrace(1:span, blah+1) = speeddata(preindex:postindex,blah);
            if ~isempty(biasdata)
                biastrace(1:span,1) = traceinc;
                biastrace(1:span,blah+1) = biasdata(preindex:postindex,blah);
            end
            
            if ~isempty(kinkdata)
                kinktrace(1:span,1) = traceinc;
                kinktrace(1:span, blah+1) = kinkdata(preindex:postindex,blah);
            end
            
            if ~isempty(curvedata)
                curvetrace(1:span,1) = traceinc;
                curvetrace(1:span, blah+1) = curvedata(preindex:postindex,blah);
            end
            
            if ~isempty(ampdata)
                amptrace(1:span,1) = traceinc;
                amptrace(1:span, blah+1) = ampdata(preindex:postindex,blah);
                
            end
            
            if ~isempty(angdata)
                angtrace(1:span,1) = traceinc;
                angtrace(1:span, blah+1) = angdata(preindex:postindex,blah);
            end
            
            relamptrace(1:span,1) = traceinc;
            relamptrace(1:span, blah+1) = amptrace(1:span,blah+1)/meanlendata(1,blah);

            
        end
            
    end
end
   % timedata(tempindex,blah)

[~,ampw] = size(amptrace);


   

speedtrace;
speeddata;
    rawbias = biastrace;
    biastrace(biastrace == 0) = 1
 %a = biastrace~= -1;
 %a = biastrace==0;
 %biastrace(a) = 1;

 
 relveltrace = speedtrace.*biastrace;
 relveltrace(1:span,1) = traceinc;
 
 relkinktrace = kinktrace.*biastrace;
 relkinktrace(1:span,1) = traceinc;
 
%% gets omega times 
tapomegatime = allomegas(:,1);

    lp = tapomegatime >= 300;
        tapomegatime = tapomegatime(lp);

    hp = tapomegatime <= 315;
        tapomegatime = tapomegatime(hp);
%% print operations

if print == 1
delete(excelname)
xlswrite(excelname,allomegas,'Omegas' ,'A1')

if ~isempty(allreversals)
xlswrite(excelname,allreversals,'Spont Reversals' ,'A1')
end

if ~isempty(oreversals)
xlswrite(excelname,oreversals,'Spont Pre-Omega Revs','A1')
end

if ~isempty(taprevs)
xlswrite(excelname, taprevs, 'Tap Reversals', 'A1');
end

if ~isempty(otaprevs)
xlswrite(excelname, otaprevs, 'Tap Pre-Omega Revs', 'A1');
end

if ~isnan(relveltrace(1,1))
xlswrite(excelname, relveltrace, 'Speed Trace', 'A1');
end

if ~isnan(kinktrace(1,1))
xlswrite(excelname, kinktrace, 'Kink Trace', 'A1');
end

if ~isnan(curvetrace(1,1))
xlswrite(excelname, curvetrace, 'Curve Trace', 'A1');
end

if ~isnan(amptrace(1,1))
xlswrite(excelname, amptrace, 'Amp Trace', 'A1');
end

if ~isnan(amptrace(1,1))
xlswrite(excelname, relamptrace, 'RelAmp Trace', 'A1');
end

if ~isnan(angtrace(1,1))
xlswrite(excelname, angtrace, 'Angular Vel Trace', 'A1');
end

if ~isnan(rawbias(1,1))
  xlswrite(excelname, biastrace, 'Bias Trace', 'A1');
end

trace.speed = relveltrace;
trace.kink = kinktrace;
trace.curve = curvetrace;
trace.amp = amptrace;
trace.relamp = relamptrace;
trace.angular = angtrace;
trace.omega = tapomegatime;
trace.bias = biastrace;

elseif print == 0 
    
disp('fin');
trace.speed = relveltrace;
trace.kink = kinktrace;
trace.curve = curvetrace;
trace.amp = amptrace;
trace.relamp = relamptrace;
trace.angular = angtrace;
trace.omega = tapomegatime;
trace.bias = biastrace;

end

