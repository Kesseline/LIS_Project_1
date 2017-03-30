function ytest = normtrainlog(XTrain, YTrain, XTest)
%NORMTRAINLOG Summary of this function goes here
%   Detailed explanation goes here

Xtr = [ones(size(XTrain,1),1), XTrain];
Xt = [ones(size(XTest,1),1), XTest];
w = normeq(Xtr,log(YTrain + 500));
yt = Xt*w;
ytest = exp(yt) - 500;


end

