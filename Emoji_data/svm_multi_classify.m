
function class = svm_multi_classify(S,Y)
for i = 1:numel(S)
    temp(i) = predict(S{i},Y); %#ok<AGROW>
end
class = mode(temp);