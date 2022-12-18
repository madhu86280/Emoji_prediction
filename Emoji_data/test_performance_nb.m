clc; clear all; warning('off','all'); close all;
% load data and

load nb;


load tr_ts_data;

h = waitbar(0, 'please wait ...');

% do for each character
result = zeros(1,size(tsData,1));
for i = 1: size(tsData,1)
    class = predict(classifier,tsData(i,:));
%rfPred = (cell2mat(class));
%     tmp = svm_multi_classify(svmStruct,tsData(i,:));
%     
    result(i) = class;
    
    waitbar(i/ size(tsData,1), h);
    
end

close(h);

%% confusion matrics

mat = confusionmat(tsLabel, result)

%% accuracy

[c_matrix,Result]= confusion_cal.getMatrix(tsLabel, result);
