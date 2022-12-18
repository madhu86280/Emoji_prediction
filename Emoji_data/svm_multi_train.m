function svmStruct = svm_multi_train(P,T,nClass)
nSvms = (nClass * (nClass-1))/2;

svmStruct = cell(1,nSvms);

k = 1;
h = waitbar(0,'please wait ...');
for i = 1:nClass
    for j = i+1:nClass
        idx1 = find(T == i);
        idx2 = find(T == j);
        xP = [P(idx1,:); P(idx2,:)];
        xT = [i.*ones(1,numel(idx1)) j.*ones(1,numel(idx2))]';
        svmStruct{k} = fitcsvm(xP,xT);
        k = k+1;
        waitbar(k / nSvms, h);
    end
end
close(h);