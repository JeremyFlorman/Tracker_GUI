dataDir = 'Y:\Calcium Imaging\Wookyu\MuscleCalcium_B12';
combineData = 0;

if combineData == 1
    d = dir([dataDir '\**\*wormdata.mat']);
    b = contains({d(:).name}, 'B');

    plusB12 = d(b);
    minusB12 = d(~b);

    af = contains({minusB12(:).name}, 'acr2');
    aBf = contains({plusB12(:).name}, 'acr2');
    acr2Files = minusB12(af);
    acr2BFiles = plusB12(aBf);

    wf = contains({minusB12(:).name}, 'wt');
    wBf = contains({plusB12(:).name}, 'wt');
    wtFiles = minusB12(wf);
    wtBFiles = plusB12(wBf);

    uf = contains({minusB12(:).name}, 'unc2');
    uBf = contains({plusB12(:).name}, 'unc2');
    unc2Files = minusB12(uf);
    unc2BFiles = plusB12(uBf);

    wt_bulkSignal = collectBulkSignal(wtFiles);
    wtB_bulkSignal = collectBulkSignal(wtBFiles);

    acr2_bulkSignal = collectBulkSignal(acr2Files);
    acr2B_bulkSignal = collectBulkSignal(acr2BFiles);

    % unc2_bulkSignal = collectBulkSignal(unc2Files);
    % unc2B_bulkSignal = collectBulkSignal(unc2BFiles);
    %% write data to spreadsheet
    outname = fullfile(dataDir,'CombinedBulkSignal.xlsx');

    writematrix(wt_bulkSignal,outname,'Sheet', 'wt')
    writematrix(wtB_bulkSignal,outname,'Sheet', 'wt+B12')

    writematrix(acr2_bulkSignal,outname,'Sheet', 'acr-2')
    writematrix(acr2B_bulkSignal,outname,'Sheet', 'acr-2+B12')

    % writematrix(unc2_bulkSinal,outname,'Sheet', 'unc-2')
    % writematrix(unc2B_bulkSinal,outname,'Sheet', 'unc-2+B12')
else
    outname = fullfile(dataDir,'CombinedBulkSignal.xlsx');

    wt_bulkSignal = readmatrix(outname,'Sheet', 'wt');
    wtB_bulkSignal = readmatrix(outname,'Sheet', 'wt+B12');

    acr2_bulkSignal = readmatrix(outname,'Sheet', 'acr-2');
    acr2B_bulkSignal = readmatrix(outname,'Sheet', 'acr-2+B12');

    % unc2_bulkSinal = readmatrix(outname,'Sheet', 'unc-2')
    % unc2B_bulkSinal = readmatrix(outname,'Sheet', 'unc-2+B12')
end

%% Plot Heat Maps
figure('Position',[384.2000 377 766.4000 271.2000], 'Color',[1 1 1])
tiledlayout(2,4, 'Padding','compact')
nexttile(1,[1 2])
heatMapTraces(wt_bulkSignal,0,1)
title('\itwildtype')

nexttile(5,[1 2])
heatMapTraces(wtB_bulkSignal,1, 1)
title('{\itwildtype} +B12')

nexttile(3, [1 2])
heatMapTraces(acr2_bulkSignal,0, 0)
title('\itacr-2')

nexttile(7,[1 2])
heatMapTraces(acr2B_bulkSignal,1,0)
title('{\itacr-2} +B12')

cb = colorbar();
cb.Layout.Tile = 'east';
cb.Label.String ='Fluorescent Intensity (a.u.)';
cb.Label.Rotation = -90;
cblabelpos = cb.Label.Position;
cblabelpos(1) = 4;
cb.Label.Position = cblabelpos;
%%
function [bulkSignal] = collectBulkSignal(files)
if ~isempty(files)
    bulksignal = cell(1,length(files));
    for i=1:length(files)
        disp(fullfile(files(i).folder,files(i).name))
        wd=load(fullfile(files(i).folder,files(i).name),'wormdata');
        bulksignal(i) = {wd.wormdata.bulkSignal-wd.wormdata.backgroundSignal};
    end
    bulkSignal = cell2mat(bulksignal);
end
end

function heatMapTraces(data, xlbl, ylbl)
meansig = mean(data,1,'omitnan');
[~, sortindex] = sort(meansig,'descend');

data = data(:,sortindex);
imagesc(smoothdata(data(900:3600,:),1,'movmean',2)', [0 6000])
ax = gca;


xt = linspace(1,4500,6);
xtl = 0:5;
ax.XTick = xt;
ax.XTickLabel = xtl;
ax.YTick = 1:size(data,2);
ax.FontName='Arial';
if xlbl == 1
    xlabel('time (min)')
end



if ylbl ==1
    ylabel('Worm #')
end

ax.TickDir = 'none';
colormap(turbo)

end


