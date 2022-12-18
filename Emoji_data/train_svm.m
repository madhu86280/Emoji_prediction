clc; clear; close all; warning('off','all');
load tr_ts_data;


classifier = TreeBagger(150,trData,trLabel);

save('rf.mat','classifier');
