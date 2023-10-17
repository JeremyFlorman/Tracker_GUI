function [ seqmap ] = MapGen( num )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
switch num
    case 1
        seqmap =   [1,          1,              0.850980392
                   0.929411765,	0.97254902,     0.694117647
                   0.780392157,	0.91372549,     0.705882353
                   0.498039216,	0.803921569,    0.733333333
                   0.254901961,	0.71372549,     0.768627451
                   0.11372549,	0.568627451,    0.752941176
                   0.133333333,	0.368627451,    0.658823529
                   0.145098039,	0.203921569,    0.580392157
                   0.031372549,	0.11372549,     0.345098039];
               disp('Colormap: Yellow Blue Green')
    case 2
        seqmap =    [1,             0.968627451,	0.984313725
                    0.925490196,	0.88627451,     0.941176471
                    0.815686275,	0.819607843,	0.901960784
                    0.650980392,	0.741176471,	0.858823529
                    0.403921569,	0.662745098,	0.811764706
                    0.211764706,	0.564705882,	0.752941176
                    0.007843137,	0.505882353,	0.541176471
                    0.003921569,	0.423529412,	0.349019608
                    0.003921569,	0.274509804,	0.211764706];
                disp('Colormap: Green Blue Grey')
    case 3
        seqmap =    [0.403921569,	0,              0.121568627
                    0.698039216,	0.094117647,	0.168627451
                    0.839215686,	0.376470588,	0.301960784
                    0.956862745,	0.647058824,	0.509803922
                    0.992156863,	0.858823529,	0.780392157
                    0.980392157,	0.980392157,	0.980392157
                    0.878431373,	0.878431373,	0.878431373
                    0.729411765,	0.729411765,	0.729411765
                    0.529411765,	0.529411765,	0.529411765
                    0.301960784,	0.301960784,	0.301960784
                    0.101960784,	0.101960784,	0.101960784];
                 disp('Colormap: Red Grey Black')
    case 4
        seqmap =   [0.647058824,	0,              0.149019608
                    0.843137255,	0.188235294,	0.152941176
                    0.956862745,	0.42745098,     0.262745098
                    0.992156863,	0.682352941,	0.380392157
                    0.996078431,	0.878431373,	0.564705882
                    1,              1,              0.749019608
                    0.878431373,	0.952941176,	0.97254902
                    0.670588235,	0.850980392,	0.91372549
                    0.454901961,	0.678431373,	0.819607843
                    0.270588235,	0.458823529,	0.705882353
                    0.192156863,	0.211764706,	0.584313725];
                disp('Colormap: Red Yellow Blue')
                
    case 5
        seqmap =   [0.182941176,	0.45745098,     0.410392157
                    0.63,           0.63,           0.331960784
                    0.375098039,	0.359411765,	0.484901961
                    0.614313725,	0.131960784,	0.077058824
                    0.131960784,	0.324117647,	0.45745098
                    0.622156863,	0.335882353,	0.014313725
                    0.331960784,	0.500588235,	0.041764706
                    0.618235294,	0.433921569,	0.528039216
                    0.480980392,	0.480980392,	0.480980392];
                disp('Colormap: Muted Pastels')
                
   
    case 6 
       seqmap =[0.8918    0.4581    0.2960
                0.8849    0.5706    0.6965
                0.5789    0.3340    0.7502
                0.1416    0.9446    0.1230
                0.3802    0.9355    0.2494
                0.2983    0.9181    0.2336
                0.2895    0.6496    0.6117
                0.2539    0.7035    0.7027
                0.0512    0.3506    0.8009
                0.8537    0.5205    0.0670];
    case 7
        seqmap=[0.670588235	0.076470588	0.082352941
                0.161764706	0.370588235	0.541176471
                0.226470588	0.514705882	0.217647059
                0.447058824	0.229411765	0.479411765
                0.75        0.373529412	0
                0.75        0.75        0.15];
            
            disp('Color Map: Brewer Set1 (6 class)')
            
    case 8 
        seqmap=[0.095294118	0.557647059	0.42
                0.765882353	0.335294118	0.007058824
                0.412941176	0.395294118	0.631764706
                0.815294118	0.144705882	0.487058824
                0.36        0.585882353	0.105882353
                0.811764706	0.603529412	0.007058824];
            
            disp('Color Map: Brewer Dark1 (6 class)')

    case 9
       r = (.95-.05).*rand(10,1)+.05;
       g = (.95-.05).*rand(10,1)+.05;
       b = (.95-.05).*rand(10,1)+.05;
       
       seqmap = [r g b]
       disp('Colormap: Random')
          
end 
end

