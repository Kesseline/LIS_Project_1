% Sigmoid kernel
% Also not too promising

load('../data/train.mat');

kappa = 1/15;
lambda = 10;
b = 100;
kern = @( x1, x2 )(tanh(kappa*x1*x2' - b));
f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, lambda));
mse = crossval('mse',X,y,'Predfun',f);


display(sqrt(mse));