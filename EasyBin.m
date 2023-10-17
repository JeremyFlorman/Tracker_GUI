function [ binranges, omegacount, noomegacount, total, Pomega ] = EasyBin(omega, noomega, low, high, increment)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%tapomega = [1.045	0.37	1.072	0.72	1.147	1.836	1.569	1.279...
%    2.258	1.02	1.516	1.897	1.677	0.855	1.27	1.441	1.582...
%    1.375	0.827];

%tap = [1.033	0.65	0	0.926	0.846	0.725	0.013	0.571	1.579...
    %1.126	0.494	0.154	0.976	1.327	0.75	0.94	0.135	0.297...
 %   0.102	1.126	0.494	0.154	0.976];

%spont =[0.176	0.342	0.021	0.123	0.009		0.381	0.494	...
 %   0.019	0.284	0.152	0.1	0.107	0.16	0.273	0.207		0.053];

%spontomega =[0.901	0.152		0.602	0.973	0.313	0.411		...
 %   0.094	0.299	0.351	0.727	0.008	1.102	0.255	0.057	0.148	0.53];



%low=0.01;
%high = 1;
%increment = 0.2;

binranges = (low:increment:high);

noomegacount = histc(noomega, binranges);
omegacount = histc(omega, binranges);

total = noomegacount + omegacount;

Pomega = omegacount./total;
%figure(7)
%plot(Pomega, binranges)
%ylabel('Probability of Omega Turning');
%xlabel('Reversal Distance(mm)');
end

