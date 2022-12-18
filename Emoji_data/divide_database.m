clc; clear; close all; warning('off','all');
% load database
load database;

% number of classes
n = numel(unique(label));

trData = [];
trLabel = [];
tsData = [];
tsLabel = [];

% divide data
for i = min(label):max(label)
    idx = label == i;
    
    tmpData = data(:,idx);
    tmpLabel = label(idx);
    
    nL = sum(double(idx));
    
    idx1 = 1:ceil(nL*0.90);
    idx2 = ceil(nL*0.50)+1:nL;
    
    trData = [trData, tmpData(:,idx1)];
    trLabel = [trLabel, tmpLabel(idx1)];
    tsData = [tsData, tmpData(:,idx2)];
    tsLabel = [tsLabel, tmpLabel(idx2)];
end

% save
trData = trData';
tsData = tsData';
trLabel = trLabel';
tsLabel = tsLabel';
save('tr_ts_data.mat','trData','trLabel','tsData','tsLabel');