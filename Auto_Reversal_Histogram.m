function [] = Auto_Reversal_Histogram(grandparentfolder, nbins, action, yaxlim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%nbins = 48;
%grandparentfolder = 'C:\Users\MWT\Desktop\Jeremy\Spontaneous_Reversals+Tap\Suppressors\FLP-18(+++)';

gpd = dir(grandparentfolder);
    gsubnames = {};
    y = 1;
    for i = 1:length(gpd)
        if gpd(i).isdir==1
            gsubnames(y) = {gpd(i).name};
            y = y+1;
        end
    end

    gsubnames = gsubnames(3:end);
    

    yyy = 1;
    for q = 1:length(gsubnames)

        parentfolder = [grandparentfolder '\' gsubnames{q}];
        
        pd = dir(parentfolder);
        subnames = {};
        x = 1;
        for i = 1:length(pd)
            if pd(i).isdir == 1
                subnames(x) = {pd(i).name};
                x = x+1;
            end
        end
        
        subnames = subnames(3:end);
        groupedcounts = [];
        groupedNworms = [];
        for z = 1:length(subnames)
            foldername = [parentfolder '\' subnames{z}];
            
            d = dir(foldername);
            names = {d.name};
            k = strfind(names, 'rpt.ms', 'ForceCellOutput', 1);
            idx = [];
            for i = 1:length(k)
                if ~isempty(k{i})
                    idx = i;
                end
            end
            
            filename = [foldername '\' names{idx}];
            fid = fopen(filename);
            data = textscan(fid, '%d%d%s%f%f%d');
            fclose(fid);
            act = '';
            switch action  
                case 'Reversal'
                    act = cell2mat(data{3}) == 'b';
                case 'Forward'
                    act = cell2mat(data{3}) == 'f';
                case 'Omega'
                    act = cell2mat(data{3}) == 'o';
                case 'Stop'
                    act = cell2mat(data{3}) == 's';
            end


            time = data{1};
            nworms = data{end};
            revtime = time(act);
            revpop = nworms(act);
            
            [counts, edges] = histcounts(revtime, nbins);
            meanN = [];
            p = 1;
            chunk = round(length(time)/nbins);
            
            for i = 1:chunk:length(time)
                if i+chunk<length(time)
                    meanN(p) = mean(nworms(i:i+chunk));
                elseif i+chunk>length(time)
                    meanN(p) = mean(nworms(i:end));
                end
                p = p+1;
            end
            
            if length(counts)~= length(meanN)
                meanN = meanN(1:length(counts));
            end
            yyy = yyy+1;

            
            for i = 1:length(meanN)
                if meanN(i) == 0 
                    meanN(i) = meanN(i-1);
                end
            end
            
            
            normcounts = counts./meanN;

%            histogram('BinEdges', edges, 'BinCounts', normcounts)
            
            if z == 1
                groupedcounts = counts;
                groupedNworms = meanN;
            elseif z > 1
                groupedcounts = groupedcounts+counts;
                groupedNworms = groupedNworms+meanN;
            end
            
        end
    end
    
    normcounts = groupedcounts./groupedNworms;
    figure()
    histogram(normcounts, edges, 'Values', normcounts)
    t = regexp(grandparentfolder, '\', 'split');
    t = t{end};
    title([t ' ' action]);
    xlabel('Time(s)')
    ylabel('Count')
    h = gcf;

    
    uselim = strcmpi(yaxlim, 'auto');
    if uselim == 0 
    set(gca, 'YLim', [0,str2num(yaxlim)])
    end
    savename = [grandparentfolder '\' t '_' action '_Histogram_' num2str(nbins) '_bins.tiff']
    saveas(h, savename)


