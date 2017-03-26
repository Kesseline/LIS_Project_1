
load('../data/train.mat');

lambda = 1000;
p = 2;
c = 10;

kern = @( x1, x2 )( (x1 * x2' + c )^p );

f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, lambda));
mse = crossval('mse',X,y,'Predfun',f);
rmse = sqrt(mse)