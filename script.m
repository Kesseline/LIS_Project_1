
load('data/train.mat');

lambda = 1000;
p = 2;
c = 10;

f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, lambda, p, c));
mse = crossval('mse',X,y,'Predfun',f);
rmse = sqrt(mse)