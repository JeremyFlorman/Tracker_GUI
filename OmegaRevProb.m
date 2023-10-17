function [spontaneousduration,spontaneousdistance, tapduration,tapdistance ] = OmegaRevProb(spont, ospont, tap, otap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    otvalues = [];
    tvalues = [];
    sovalues = [];
    svalues = [];
    
    
    otnum =[];
    tnum = [];
    sonum = [];
    snum = [];
    
    
    tapdisttotal = [];
    spontdisttotal = [];
    
    pomegadist = [];
    spontpomegadist = [];

inc = (0.2:0.2:5)';
low=1;
hi = 2;

spontdis = spont(:,2);
ospontdis = ospont(:,2);
tapdis = tap(:,2);
otapdis = otap(:,2);

spontdur = spont(:,1);
ospontdur = ospont(:,1);
tapdur = tap(:,1);
otapdur = otap(:,1);


for p = 1:length(inc)-1
%% proceeds through 'inc' in a for loop and finds values that are between
%two incriments for all categories (spontaneous revs, spontaneous pre-omega
%revs, tap induced revs and tap induced pre omega revs) for distance

    lowinc = inc(low,1);
    hiinc = inc(hi,1);
    [otr,~,~] = find(otapdis >= lowinc & otapdis <= hiinc);
    [tr,~,~] = find(tapdis >= lowinc & tapdis <= hiinc);
    [sor,~,~] = find(ospontdis >= lowinc & ospontdis <= hiinc);
    [sr,~,~] = find(spontdis >= lowinc & spontdis <= hiinc);
   
%%  gets values of binned numbers  
    otvalues = otapdis(otr,1);
    tvalues = tapdis(tr,1);
    sovalues = ospontdis(sor,1);
    svalues = spontdis(sr,1);
    

    
%% gets frequency distribution of values in each category for each bin   
    otnum = length(otvalues);
    tnum = length(tvalues);
    sonum = length(sovalues);
    snum = length(svalues);
    
    

%%    
    
    tapdisttotal = (otnum + tnum);
    spontdisttotal = (sonum + snum);
    

    pomegadist = (otnum/tapdisttotal);
    spontpomegadist = (sonum/spontdisttotal);
    

    
    tapbindist(p,1) = {lowinc} ;
    tapbindist(p,2) = {otnum};
    tapbindist(p,3) = {tnum};
    tapbindist(p,4) = {tapdisttotal}; 
    tapbindist(p,5) = {pomegadist};
    
    spontbindist(p,1) = {lowinc} ;
    spontbindist(p,2) = {sonum};
    spontbindist(p,3) = {snum};
    spontbindist(p,4) = {spontdisttotal}; 
    spontbindist(p,5) = {spontpomegadist};
    
    
    low = low+1;
    hi = hi +1;

end



incdur = (0:0.1:4)';
lowdur =1;
hidur = 2;



for z = 1:length(incdur)-1
%% proceeds through 'incdur' in a for loop and finds values that are between
%two incriments for all categories (spontaneous revs, spontaneous pre-omega
%revs, tap induced revs and tap induced pre omega revs) for duration.
    
    lowincdur = incdur(lowdur,1);
    hiincdur = incdur(hidur,1);

   
    [otdur,~,~] = find(otapdur >= lowincdur & otapdur <= hiincdur);
    [tdur,~,~] = find(tapdur >= lowincdur & tapdur <= hiincdur);
    [sodur,~,~] = find(ospontdur >= lowincdur & ospontdur <= hiincdur);
    [sdur,~,~] = find(spontdur >= lowincdur & spontdur <= hiincdur);
    
%%  gets values of binned numbers  

    
    otdurvalues = otapdur(otdur,1);
    tdurvalues = tapdur(tdur,1);
    sodurvalues = ospontdur(sodur,1);
    sdurvalues = spontdur(sdur,1);
    
%% gets frequency distribution of values in each category for each bin   
    
    
    otnumdur = length(otdurvalues);
    tnumdur = length(tdurvalues);
    sonumdur = length(sodurvalues);
    snumdur = length(sdurvalues);
%%    

    tapdurtotal = (otnumdur + tnumdur);
    spontdurtotal = (sonumdur + snumdur);
    

    pomegadur = (otnumdur/tapdurtotal);
    spontpomegadur = (sonumdur/spontdurtotal);

    
    tapbindur(z,1) = {lowincdur} ;
    tapbindur(z,2) = {otnumdur};
    tapbindur(z,3) = {tnumdur};
    tapbindur(z,4) = {tapdurtotal}; 
    tapbindur(z,5) = {pomegadur};
    
    spontbindur(z,1) = {lowincdur} ;
    spontbindur(z,2) = {sonumdur};
    spontbindur(z,3) = {snumdur};
    spontbindur(z,4) = {spontdurtotal}; 
    spontbindur(z,5) = {spontpomegadur};
    
    
    lowdur = lowdur+1;
    hidur = hidur +1;

end

spontaneousduration = spontbindur;
spontaneousdistance = spontbindist;
tapduration = tapbindur;
tapdistance = tapbindist;

  % delete('C:\Users\AlkemaM\Desktop\Probomega.xls')
  % xlswrite('C:\Users\AlkemaM\Desktop\Probomega.xls', data,  'Sheet1', 'A1')
  % xlswrite('C:\Users\AlkemaM\Desktop\Probomega.xls', tapbindist,  'Tap Distance', 'A1')
  % xlswrite('C:\Users\AlkemaM\Desktop\Probomega.xls', spontbindist, 'Spont Distance', 'A1')
   
  % xlswrite('C:\Users\AlkemaM\Desktop\Probomega.xls', tapbindur,  'Tap Duration', 'A1')
  % xlswrite('C:\Users\AlkemaM\Desktop\Probomega.xls', spontbindur, 'Spont Duration', 'A1')
   
   
   %disp('she sells sea shells by the sea shore, but the sea shells she sells are not sea-shore shells')

end

