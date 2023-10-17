function [longrev] =  MasterTrace( foldername, timepre, timepost )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%timepre = 10;
%timepost = 15;

%foldername =  'C:\MWT\Omegas\TapInduced\131121_N2\20131121_115819';
datsearch = '\*.dat';
txtlist = char(FileSearch(foldername, '\*.txt'));
predatlist = FileSearch(foldername, datsearch);
rptlist = FileSearch(foldername, '\*rpt.txt');

rpts = isempty(rptlist);
tracesize = ((timepre + timepost)*4)+5


if rpts == 0 
    txtlist = txtlist(1:end-1,:);
end
[datlen, datwid] = size(predatlist);
[length, width] = size(txtlist);

if datwid > length
    for this = 1:datwid-1
    datlist(this,:) = predatlist{this};
    end
elseif datwid == length
    for this = 1:datwid
    datlist(this,:) = predatlist{this};
    end
end
tracemaster = NaN(tracesize, length);
nofill = NaN(tracesize, length);
newrev = NaN(tracesize, length);
matrev = NaN(52,length);
groupnorm =cell(1,length);
temptrace = NaN(tracesize,1);
distdur = [100,2];
shortrev = NaN(tracesize,length);
longrev = NaN(tracesize,length);
excelname = [foldername '\tracemaster.xlsx'];
delete(excelname)
shorttick = 1;
longtick = 1; 
total = 0;
revs = 0;
inx = 1;
for step = 1:length

    revdata = dlmread(txtlist(step,:));
    datdata = dlmread(datlist(step,:));
    [l,w] = size(revdata);
    time =datdata(:,1);
    
for revcount = 1:l
    
    revtimes(revcount) = revdata(revcount, 2);
    revdur(revcount) = revdata(revcount, 4);
    rawdur = revdata(1, 4);
    revdist = revdata(1,3);
    revend(revcount) = (revtimes(revcount))+(revdur(revcount));
    
end


for hitcount = 1:l
    [c, enddex] = min(abs(time-revend(hitcount)));
    [d, startdex] = min(abs(time-revtimes(hitcount)));
   revendindex(hitcount)= (enddex+1); %find(time == revend(hitcount),1);
   hit(hitcount) = {startdex+1}; %{find(time==revtimes(hitcount), 1)};
end


relvel = [];
first = time(1);
last = time(end);

 for tracecount = 1:l
    revstart = hit{tracecount};
    revstop = revendindex(tracecount);
    pre = revstart-(4*(timepre));
    post= revstart+(4*(timepost));
    
    
    
    [ldat, wdat] = size(datdata);
    vel = datdata(:,2);
    %bias = datdata(:,3);
    size(vel);
    %size(bias);
    vel(revstart:revstop)=(vel(revstart:revstop)*-1);
    tempdistdur= [revdist; rawdur]';
    temprev=vel(revstart:revstop);

    
   
    if pre>0 && post<ldat       
         temptrace = vel(pre:post+1,1);

    elseif pre>0 && post>ldat
        temptrace = vel(pre:end, 1);
    end
    
 end
[len, widt] = size(temprev);
[el,dubya] = size(temptrace);
[ll, ww] = size(tempdistdur);
pinx = inx;
inx = inx +ll;

revs = revs + l;


if len >= 2
total = total +1;
disdur(pinx:inx-1,:) = tempdistdur;
tracemaster(1:el,total) = temptrace;
tracemaster(el:tracesize,total)=NaN;





[tlen, twid] = size(tracemaster);
if revdist < 0.5
    shortrev(1:el,shorttick) = temptrace;
    shorttick = shorttick + 1;
end
if revdist >0.5
   longrev(1:el,longtick) = temptrace;
    longtick = longtick + 1;
end



uniontime = round(45/(len));
%uniontime = preunion-1;
space = round(100/len);
place = 2;
newplace = space;
placeholder =2;



newrev(1,total) = 0;
for lenny = 1:len-1
    newrev(place:newplace, total) = temprev(lenny);
    place=place+space;
    newplace= newplace+space;
    placeholder = place;
end

newrev(placeholder:100, total) = temprev(end);
newrev(101, total) = 0;

%%%%%%%
%%%%%%% Disabled 'No Fill' to get the aligned reversals because it was
%%%%%%% throwing errors. Feel free to reenable it!


%spuce = round(100/len);
%spot = 2;
%nofill(1,total) = 0;
%novill(1,total) = temprev(1);
%for ticker = 1:len-1
    %nofill(spot, total) = temprev(ticker);
    
%    pt1 = temprev(ticker);
%    pt2 = temprev(ticker+1);
%    inc = abs(((pt2-pt1)/space));
%    if pt2<pt1
%        inc=inc*-1;
%    end
%    fill = pt1:inc:pt2;
%    nofill(spot:((spot+spuce)-1), total) = fill(1:end-1);
%    
%    spot=spot+spuce;
%end
%spaceleft = 100-spot;
%penult = temprev(end-1);
%ult = temprev(end);
%lastinc = ((ult-penult)/space);
%lastfill = (penult:lastinc:ult)';
%index = 1;
%[ll, ww] = size(lastfill);
%    for i = spot:99
%        nofill(i,total) = lastfill(index, 1);
%        if index< ll
%        index = index + 1;
%        end
%    end
%    
%
%
%
%nofill(100, total) = temprev(end);
%nofill(101, total) = 0;

%pretrace = vel(pre:revstart);
%posttrace = vel(revstop:post);



%%%%%%%
%%%%%%%


pos = uniontime;
matrev(1,total) = 0;
   
    if len == 1
        matrev(2,total) = temprev(1);
    elseif len == 2 
        matrev(2,total) = temprev(1);
        matrev(3,total) = temprev(2);
    elseif len > 2
        for spdcount = 1:len
        matrev(pos,total) = temprev(spdcount);
        pos = pos + uniontime;
        end
    end
    
matrev(52,total) = 0;


%%% Bin By length


%%%%%% there is something wrong with the size of matrev, it increases for
%%%%%% some reason even though it should not get past 100. find out whats
%%%%%% wrong!!

justrev(1:len,total) = temprev;
justrev(len:end,total)= NaN;


unittime = 1/len;
inc= (0:unittime:1)';
normrev = NaN(101,2);

normrev(1:len,1) = inc(1:end-1);
normrev(1:len,2) = temprev;

groupnorm(total) = {normrev(1:25, :)};


end





disp('....')
end

groupnorm=cell2mat(groupnorm);
heads = {'Distance', 'Duration'};
excelname = [foldername '\tracemaster.xlsx'];

xtimes = (-(timepre):0.25:(timepost));
xtimes = xtimes';

traceis = isempty(tracemaster);


xlswrite(excelname, xtimes,'Sheet1', 'A1');

if traceis == 0
xlswrite(excelname,tracemaster ,'Sheet1', 'B1');
end 

%xlswrite(excelname, disdur, 'Sheet2', 'A1');
%xlswrite(excelname, justrev, 'Sheet3', 'A1');
xlswrite(excelname, shortrev, '<1 bodylength', 'A1');
xlswrite(excelname, longrev, '>1 bodylength', 'A1');
%%%%%%
%xlswrite(excelname,matrev,'Normalized Reversals','A1')
%xlswrite(excelname, newrev, 'Filled Reversals', 'A1')
%xlswrite(excelname, nofill, 'nofill', 'A1')


disp('Done');
end

