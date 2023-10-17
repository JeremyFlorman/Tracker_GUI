function DeleteZeros( foldername)
%UNTITLED Summary of this function goes here
%   deletes reversal files of time/distance = 0
%foldername=('C:\Users\AlkemaM\Desktop\jeremy\TapInducedReversals\131107_N2\20131107_095257');
searchterm = '\*.txt';
templist = FileSearch(foldername, searchterm);
numtxt = numel(templist, ':',':');
filelist = cell(numtxt);

for tip = 1:numtxt 
    filelist(tip) = {char(templist(tip))};
end


for txtcount = 1:numtxt
 temptxt = dlmread(filelist{txtcount});
    
 if temptxt(1,3)<= 0 
    delete(filelist{txtcount})
    disp('Exterminate!');
 end
 
end

end

