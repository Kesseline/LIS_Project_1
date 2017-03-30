% This script compares the root squared error of approximations obtained by
% normal equations and normal equations with logarithmically scaled
% y-vector


load('../data/train.mat');

% General tests regarding approximations for whole dataset
ytest1 = normtrain(X,y,X);
ytest2 = normtrainlog(X,y,X);

rms1 = rms(ytest1 - y);
rms2 = rms(ytest2 - y);

% Crossvalidation comparison
rms3 = sqrt(crossval('mse', X,y,'Predfun', @normtrain));
rms4 = sqrt(crossval('mse', X,y,'Predfun', @normtrainlog));