% Gaussian kernel
% Doesnt look too promising...

load('../data/train.mat');

h = 5;
lambda = 1200;
kern = @( x1, x2 )( exp(-(norm(x1-x2)^2)/(h^2)));
f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, lambda));
mse = crossval('mse',X,y,'Predfun',f);


display(sqrt(mse));