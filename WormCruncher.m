function [probability, omegaspont, noomegaspont, omegatap, noomegatap, raws, Ns] = WormCruncher( parentfolder, print, graph )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%parentfolder = 'C:\MWT\N2\140320_N2';
%print = 0;

parentcontents = dir(parentfolder);
expfolders = {parentcontents([parentcontents.isdir]).name};
expfolders = expfolders(3:end);
numexp = numel(expfolders, ':', ':');

rawrpt = cell(numexp);

scale = AutoScale(parentfolder);

[path, name, ext] = fileparts(parentfolder);
excelname = [parentfolder '\' name '_Worm_Cruncher_Output.xlsx'];
%% Subfolder loop... operates within each experiment folder
for a = 1:numexp
    %% Gets temp folder name and accesses RPT.MS files, renaming them to a
    %  .txt file, reading them and renaming them back to the original name.
    %  data is stored as a cell array in rawrpt
    tempexp = expfolders{a};
    
    temppath = [parentfolder '\' tempexp '\' name];
    rptname = [parentfolder  '\' tempexp '\' name '.rpt.ms'];
    renamed = [parentfolder  '\' tempexp '\' name '_RPT.txt'];
    try 
    movefile(rptname, renamed, 'f')
    rawrpt = ReadData(renamed);
    catch exception;
        try rawrpt = ReadData(renamed);
        catch exception;
        end
    end
    
    movefile(renamed, rptname);
%% converts letter code for actions into numer code, f=1, s=2, b=3, o=4
    for index = 1:length(rawrpt)
        matrpt = NaN(length(rawrpt), 6);
        letter = rawrpt{index,3};        
        
        f = strcmpi(letter, 'f');
        s = strcmpi(letter, 's');
        b = strcmpi(letter, 'b');
        o = strcmpi(letter, 'o');
        
        if f == 1
           rawrpt(index,3) = {1};
        end
        
        if s == 1
            rawrpt(index,3) = {2};
        end
        
        if b == 1
            rawrpt(index,3) = {3};
        end
        
        if o == 1
            rawrpt(index,3) = {4};
        end
        
        
        
    end
    
    %% groups rpt data by ID #
    
    matrpt = cell2mat(rawrpt);
    ids = matrpt(1:end, 2);
    ids = unique(ids);
    [lid, wid] = size(ids);
    
    for c = 1:lid
        ididx = (matrpt(:,2) == ids(c));
        wormrpt(c) = {matrpt(ididx,:)};
        newrpt(c) = {matrpt(ididx,:)};
    end

   %% collects Reversal Events
   revidx = (matrpt(:,3) == 3 & matrpt(:,4) > 0);
   revmat = sortrows(matrpt(revidx,:),2);
    
   %% collects Omega events and removes false positives (<0.5 sec)
   omidx = (matrpt(:,3) == 4 & matrpt(:,4) >= 0.2);
   omegamat = matrpt(omidx,:);

   %% From the list of omegas, finds Worm ID and Omega Time
   
   [olen, ~] = size(omegamat);
   for k = 1:olen
       time = omegamat(k,1);
       id = omegamat(k,2);
   
   % gets ids and the revs relevant to that id.
        historyidx= (revmat(:,2) == id);
        relevantrevs = revmat(historyidx, :);
        
        prunedidx = (relevantrevs(:,1) >= (time-20) & relevantrevs(:,1) <= time-0.1);
        prunedrevs = relevantrevs(prunedidx,:);
        
        [prl, ~] = size(prunedrevs);
        
        
%% Deals With identifying the pre-omega reversal
        
   % If there is only 1 reversal in the time window
   % prior to the omega, this is the last reversal.
        lastrev = NaN(1,6);
      
        if prl == 1
            lastrev = prunedrevs(1,:);
        end
        
   % If there are multiple reversals, see what the 
   % time difference is between them. If there is a 
   % large dt, assume that the last reversal is correct.
        
        if prl >1 
           t0 = prunedrevs(end,1);
           t1 = prunedrevs(end-1,1);
           d0 = prunedrevs(end,5);
           d1 = prunedrevs(end-1,5);
                    
           dt = t0-t1;

           
           if d0 > 0.1
               lastrev = prunedrevs(end,:);                                 % if the time between reversals is big
                                                                            % assume the last rev is correct.
           elseif dt < 1 && d0 <= 0.1                                    % if there are two reversals that are close in time
               prunedrevs(end,4) = prunedrevs(end,4)+prunedrevs(end-1,4);   % and the last reversal is less than 0.1mm in distance
               prunedrevs(end,5) = prunedrevs(end,5)+prunedrevs(end-1,5);   % combine the two reversals.
               lastrev = prunedrevs(end,:);
           end
           
           
           grouped(k,1:6) = lastrev(:,:);
           grouped(k,7:12) = omegamat(k,:);
           grouped = sortrows(grouped, 2);
        end
        
        

        
   end
  try
   grnz = grouped(:,1)>0;
   grouped = grouped(grnz,:);

  
   
%% daygrouped collects omega and preceeding reversal data into a single matrix.
  % dayomega is just the omega data contained in daygrouped.
  % daydata is the entire rpt file for all experiments that day.
    
    daygrouped(a) = {grouped(:,:)};
    dayrevs(a) = {revmat(:,:)};
    dayomega(a) = {sortrows(omegamat, 2)};
    daydata(a) = {wormrpt};
    
    daygroupedmat = vertcat(daygrouped{:});
    
    %% Need to clear variables for recycling in the exp loop.
    grouped(:,:) = NaN;
    wormrpt(:) = {[]};
      catch exception
          disp(temppath)
      continue
  end
end



%% seperates reversals from reversal-omegas
try
omegas = cell2mat(daygrouped(:));
omegas = omegas(:,1:6);
reversals = dayrevs{:};

noomegall = setdiff(reversals,omegas,'rows', 'stable'); %% all reversals that dont end in an omega.

%% separates everything: tap-no-omega, spontaneous-no-omega ,tap-omega, spontaneous-omega.
tapidx = noomegall(:,1)>= 300 & noomegall(:,1) <=320;       %% index of reversals that are between 300 and 310 sec.
noomegatap = noomegall(tapidx,:);                                %% reversals cooresponding to above index.
noomegaspont = setdiff(noomegall,noomegatap,'rows','stable');       %% all other (spontaneous) reversals that dont end in omega.

omegatapidx = omegas(:,1)>=300 & omegas(:,1)<=320;             % reversals between 300 and 310 sec that do end in an omega.   
omegatap = omegas(omegatapidx, :);
omegaspont = setdiff(omegas,omegatap,'rows','stable');         %% all other reversals that end in an omega (spontaneous)



%% calculates probabilities.

spontno = [noomegaspont(:,4) noomegaspont(:,5)];
spontomega = [omegaspont(:,4) omegaspont(:,5)];
tapno = [noomegatap(:,4) noomegatap(:,5)];
tapomega = [omegatap(:,4) omegatap(:,5)];



%%%%%%%%%%%rewrite with histc




[sdur,sdist,tdur,tdist] = OmegaRevProb(spontno,spontomega,tapno,tapomega);

sdur = cell2mat(sdur);
sdist = cell2mat(sdist);
tdur = cell2mat(tdur);
tdist = cell2mat(tdist);

catch exception

end
%% writes stuff to file
if graph == 1
    
figure(1)
clf
hold on;
plot(tdur(:,1),tdur(:,5), 'k','LineWidth', 2)
plot(sdur(:,1),sdur(:,5), 'r','LineWidth', 2)
legend('Tap Induced', 'Spontaneous','Location','NorthEastOutside');
legend('boxoff')
title('Duration')
ylim([-0.1,1.01])
xlim([0,4])
xlabel('Reversal Duration(s)')
ylabel('Probability of Omega Turn')
hold off;

figure(2)
clf
hold on;
plot(tdist(:,1),tdist(:,5), 'g', 'LineWidth', 2 )
plot(sdist(:,1),sdist(:,5), 'k', 'LineWidth', 2)
legend('Tap Induced', 'Spontaneous','Location','NorthEastOutside')
legend('boxoff')
title('Distance')
xlabel('Reversal Distance(mm)')
ylabel('Probability of Omega Turn')
ylim([-0.1,1.01])
xlim([0,2])
hold off;


figure(3)
clf
hold on;


scatter(noomegaspont(:,4),noomegaspont(:,5),'y', 'SizeData', 3);
scatter(noomegatap(:,4),noomegatap(:,5),'k');
scatter(omegaspont(:,4),omegaspont(:,5),'r^', 'MarkerFaceColor', 'r','SizeData', 75);
scatter(omegatap(:,4),omegatap(:,5),'b^' ,'MarkerFaceColor', 'b','SizeData', 75);

xlabel('Reversal Duration (s)')
ylabel('Reversal Distance (mm)')
legend('No-Omega Spontaneous', 'No-Omega Tap', 'Omega Spontaneous', ...
    'Omega Tap', 'Location','NorthEastOutside')
legend('boxoff')
hold off; 
end


if print == 1
delete(excelname)
headerG = {'Time', 'ID', 'Reversal', 'Duration', 'Distance','# Worms',...
    'Time','ID','Omega', 'Duration', 'Distance', '# Worms'};

headerR = {'Time', 'ID', 'Reversal', 'Duration', 'Distance','# Worms'};


xlswrite(excelname, daygroupedmat, 'Sheet1', 'A2');
xlswrite(excelname, headerG, 'Sheet1', 'A1');

try
xlswrite(excelname, noomegaspont, 'No-omega-Spont', 'A2');
xlswrite(excelname, headerR, 'No-omega-Spont', 'A1');
xlswrite(excelname, noomegatap, 'No-omega-Tap', 'A2');
xlswrite(excelname, headerR, 'No-omega-Tap', 'A1');
xlswrite(excelname, omegaspont, 'Omega-Spont', 'A2');
xlswrite(excelname, headerR, 'Omega-Spont', 'A1');
xlswrite(excelname, omegatap, 'Omega-Tap', 'A2');
xlswrite(excelname, headerR, 'Omega-Tap', 'A1');

catch exception
end

xlswrite(excelname, {'Spontaneous Dist' '# Omega' '# No Omega' 'Total' 'Prob' ...
    '' 'Tap Dist' '# Omega' '# No Omega' 'Total' 'Prob' ''...
    'Spontaneous Duration' '# Omega' '# No Omega' 'Total' 'Prob' '' 'Tap Duration'...
    '# Omega' '# No Omega' 'Total' 'Prob'}, 'Sheet1', 'A1');
xlswrite(excelname, sdist, 'Sheet1', 'A2');
xlswrite(excelname,tdist, 'Sheet1', 'G2');
xlswrite(excelname,sdur, 'Sheet1', 'M2');
xlswrite(excelname,tdur, 'Sheet1', 'S2');

end


%% probability output cell contents = spont dist, tap dist, spont dur, tap dur.
% 'raws' output =  spont dist, tap dist, spont dur, tap dur.
[distancelength,~] = size(tdist);
[durationlength,~] = size(tdur);


sdistprob = sdist(:,5);
tdistprob = tdist(:,5);
sdurprob = sdur(:,5);
tdurprob = tdur(:,5);
incdist = tdist(:,1);
incdur = tdur(:,1);

omegadistance(:,1) = sdist(:,1);
omegadistance(:,2) = sdist(:,2) + tdist(:,2)
noomegadistance(:,1) = sdist(:,1)
noomegadistance(:,2) = sdist(:,3) + tdist(:,3)

if print == 1
figure(14)


bar(noomegadistance(:,1), noomegadistance(:,2), 'g')
hold on 
bar(omegadistance(:,1), omegadistance(:,2),'r')
xlabel('distance(mm)')
ylabel('# worms')
legend('No omega', 'Omega')
hold off
end

raws = {sdist tdist sdur tdur}
Ns = {omegadistance noomegadistance}
probability = {incdist sdistprob tdistprob incdur sdurprob tdurprob};


disp('G''''Bye');

end

