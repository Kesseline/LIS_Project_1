function ytest = normtrain(XTrain, YTrain, XTest )
%NORMTRAIN Summary of this function goes here
%   Detailed explanation goes here

Xtr = [ones(size(XTrain,1),1), XTrain];
Xt = [ones(size(XTest,1),1), XTest];
w = normeq(Xtr,YTrain);
ytest = Xt*w;

end

