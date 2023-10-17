function [ output_args ] = MegaBatch( foldername, graph)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

graph = 0;
foldername = 'C:\MWT\N2';
foldercontents = dir(foldername);
parentfolders = {foldercontents([foldercontents.isdir]).name};
parentfolders = parentfolders(3:end);
numparent = numel(parentfolders, ':', ':');

excelname = [foldername '\MegaCrunched.xlsx'];


for z = 1:numparent
    subname = parentfolders{z};
    kidpath = [foldername '\' subname];
    disp(['Crunching:' kidpath])
    %% probability output cell contents = spont dist, tap dist, spont dur, tap dur.
    % raws output cell contents =  spont dist, tap dist, spont dur, tap dur
    
    probability = [];
    [probability, omegaspont, noomegaspont, omegatap, noomegatap, raws,Ns]= WormCruncher(kidpath, 0, 0);
    
    ospont(z) = {omegaspont};
    nospont(z) = {noomegaspont};
    otap(z) = {omegatap};
    notap(z) = {noomegatap};
%% collect raw data
    ospontraw(z) = {omegaspont(:,4:5)};
    nospontraw(z) = {noomegaspont(:,4:5)};
    otapraw(z) = {omegatap(:,4:5)};
    notapraw(z) = {noomegatap(:,4:5)};

    
sdistprob(:,1) = probability{1};
tdistprob(:,1) = probability{1};
sdurprob(:,1) = probability{4};
tdurprob(:,1) = probability{4};    


sdistprob(:,z+1) = probability{2};
tdistprob(:,z+1) = probability{3};
sdurprob(:,z+1) = probability{5};
tdurprob(:,z+1) = probability{6};

%% Gathers N's for the categories
Ns = cell2mat(Ns);

omegaNdist(:,1) = Ns(:,1);
omegaNdist(:,z+1) = Ns(:,2);
noomegaNdist(:,1) = Ns(:,3);
noomegaNdist(:,z+1) = Ns(:,4);


%% new way of calculating probability

%spontaneous distance
[srange, somegacount, snoomegacount, stotal, sPomega] = EasyBin(omegaspont(:,5), noomegaspont(:,5), 0.1,2.6, 0.1);

spontprob(:, 1) = srange';
spontprob(:,z+1) = sPomega;

%tap induced distance
[trange, tomegacount, tnoomegacount, ttotal, tPomega] = EasyBin(omegatap(:,5), noomegatap(:,5), 0.1,2.6, 0.1);

tapprob(:, 1) = trange';
tapprob(:,z+1) = tPomega;

%% spontaneous Duration
[sdurrange, sduromegacount, sdurnoomegacount, sdurtotal, sdurPomega] = EasyBin(omegaspont(:,4), noomegaspont(:,4), 0.2,8, 0.5);

spontdurprob(:, 1) = sdurrange';
spontdurprob(:,z+1) = sdurPomega;

%tap induced duration
[tdurrange, tduromegacount, tdurnoomegacount, tdurtotal, tdurPomega] = EasyBin(omegatap(:,4), noomegatap(:,4), 0.2,8, 0.5);

tapdurprob(:, 1) = tdurrange';
tapdurprob(:,z+1) = tdurPomega;
end

[distancelength, distancewidth] = size(sdistprob);
[durationlength, durationwidth] = size(sdurprob);

pooleddistanceprob = [sdistprob(:,1) sdistprob(:,2:end) tdistprob(:,2:end)];
pooleddurationprob = [sdurprob(:,1) sdurprob(:,2:end) tdurprob(:,2:end)];

if graph == 1
figure(12321434)
hold on
bar(noomegaNdist(:,1), noomegaNdist(:,2:end),'g')
bar(omegaNdist(:,1), omegaNdist(:,2:end),'r')
legend('No Omega', 'Omega')
xlabel('distance(mm)')
ylabel('# worms')
title('distribution of reversal distances')
end
%hold off

ospontraw = vertcat(ospontraw{:});
nospontraw = vertcat(nospontraw{:});
otapraw = vertcat(otapraw{:});
notapraw = vertcat(notapraw{:});
spontraw = vertcat(ospontraw,nospontraw);
tapraw = vertcat(otapraw, notapraw);


[osn, osc] = hist(ospontraw(:,1), 50);
[sn, sc] = hist(nospontraw(:,1), 50);
[otn, otc] = hist(otapraw(:,1),50);
[tn, tc] = hist(notapraw(:,1),50);
[spontn, spontc] = hist(spontraw(:,1), 50);
[tapn, tapc] = hist(tapraw(:,1),50);

spontn = (spontn/sum(spontn))*100
tapn = (tapn/sum(tapn))*100
osn = (osn/sum(osn))*100
sn = (sn/sum(sn))*100
otn = (otn/sum(otn))*100
tn = (tn/sum(tn))*100

figure()
hold on
stem(osc,osn, 'c')
stem(sc,sn, 'y')
stem(otc,otn, 'm')
stem(tc,tn, 'b')
xlim([0,10])
ylim([0,50])
xlabel('Reversal Duration(s)')
ylabel('Percent of Reversals')
legend('Spontaneous Omega', 'Spontaneous No Omega', 'Tap Omega', 'Tap No Omega');
hold off

figure()
hold on
stem(spontc,spontn, 'm')
stem(tapc,tapn, 'b')
xlim([0,10])
ylim([0,50])
xlabel('Reversal Duration(s)')
ylabel('Percent of Reversals')
legend('Spontaneous Reversals', 'Tap Induced Reversals');
hold off





delete(excelname)
xlswrite(excelname, pooleddistanceprob, 'Sheet1', 'A1')

xlswrite(excelname, Ns, 'Ns', 'B1');

xlswrite(excelname, ospontraw, 'Sp Omega Raw', 'A1');
xlswrite(excelname, nospontraw, 'Sp No Omega Raw', 'A1');
xlswrite(excelname, otapraw, 'Tap Omega Raw', 'A1');
xlswrite(excelname, notapraw, 'Tap No Omega Raw', 'A1');

xlswrite(excelname, spontprob, 'New Spont dist', 'A1');
xlswrite(excelname, tapprob, 'New Tap dist', 'A1');
xlswrite(excelname, spontdurprob, 'New Spont dur', 'A1');
xlswrite(excelname, tapdurprob, 'New Tap dur', 'A1');
disp('Job Done!!!!!!')
