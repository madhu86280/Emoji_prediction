clc; clear; close all; warning('off','all');
% list traing files
list = dir('emoji\smile\*.png');

% process each image
h = waitbar(0,'');
for i = 1:size(list,1)
    waitbar(i/size(list,1),h,sprintf('%3.0d of %3.0d done',i,size(list,1)));
    % read image
    nameOfImage = list(i).name;
    rgb = imread(['emoji\smile\', nameOfImage]);

    % Process Face
    featureVector = img2fet(rgb);
    
    % save feature
    if i == 1
        P = zeros(size(featureVector,2),size(list,1));
        T = zeros(7,size(list,1));
    end
    P(:,i) = featureVector';
     label(i)=6;
 end

save('smile.mat','P','label');
close(h);