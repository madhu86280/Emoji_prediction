function feature = img2fet(rgb)

% gray
if size(rgb,3) > 1
    gray = rgb2gray(rgb);
else
    gray = rgb;
end
    
% make it smaller
rsz = imresize(gray,[224, 244]);


rsz = medfilt2(rsz,[5,5]);
rsz=double(rsz);
  
%     points = detectHarrisFeatures(rsz);
%     [features, ~] = extractFeatures(gray, points);
%     featureVector1 =features.Features;
%     featureVector1=mean(featureVector1);   
[meanAmplitude, msEnergy] = gaborWavelet(rsz, 4, 6);
feature = [ meanAmplitude, msEnergy];
