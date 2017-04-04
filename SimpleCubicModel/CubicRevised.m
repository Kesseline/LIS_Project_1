% compute the regression.
% (USE MATLAB'S CROSS VALIDATION.)

load('../data/train.mat');
lambda = 206;

f = @(Xtrain,ytrain, Xtest)cubicpredictor(Xtrain,ytrain,Xtest,lambda);
err = crossval('mse', X,y, 'Predfun', f);

disp('Cubic least squares regression:');
disp(sqrt(err));


