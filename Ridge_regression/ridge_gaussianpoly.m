load('../data/train.mat');

h = 6.1;
lambda = 10; %0.01 best for RBF
p = 3;
c = 1;
c1 = 0.82;
c2 = 0.008;

kern = @( x1, x2 )( c1*exp(-(norm(x1-x2)^2)/(h^2)) + c2*(x1 * x2' + c )^p);
f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, lambda));
mse = crossval('mse',X,y,'Predfun',f);


display(sqrt(mse));