clc; clear; close all; warning('off','all');
load tr_ts_data;


classifier = fitcsvm(trData,trLabel);

save('nb.mat','classifier');
