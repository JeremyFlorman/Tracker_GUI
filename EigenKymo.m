function [  ] = EigenKymo( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%[filename,PathName,FilterIndex] = uigetfile('E:\jeremy\OmegaExperiments\Pnpr-5_npr-5\Pnpr-5_NPR-5_4-3\151015_pnpr-5_npr-5_4-3\*.data')  
%filename = 'E:\jeremy\OmegaExperiments\Pnpr-5_npr-5\Pnpr-5_NPR-5_4-3\151015_pnpr-5_npr-5_4-3\20120704_172756\151015_pnpr-5_npr-6_4-3.eigen.data';
  

%filename= [PathName  filename]

    fid = fopen(filename, 'r');
    data = textscan(fid, '%f %f %f %f %f %f %f %f %f %f');
    fclose(fid)
    data = cell2mat(data);
    [l,w] = size(data);
    time =0.25:0.25:l/4;
    
    data = (data*57.2958);

   createkymo([1:10],time(1:1000),data(1:1000,:))



end

