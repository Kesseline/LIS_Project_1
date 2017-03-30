addpath(genpath('../'));

load('../data/train.mat');

h = 6.1;
lambda = 10; %0.01 best for RBF
p = 3;
c = 1;
c1 = 0.82;
c2 = 0.008;

kern = @( x1, x2 )( c1*exp(-(norm(x1-x2)^2)/(h^2)) + c2*(x1 * x2' + c )^p);
ypred = kernridgereg(X,y,X, kern, lambda);
res = abs(y-ypred);
histogram(res);

Ind = find(res > 15);

A = [X y];

for i=size(Ind):1
    A(Ind(i),:) = [];
end

display(size(Ind));
display(size(A));

X_prime = A(:,1:end-1);
y_prime = A(:,end);

f = @(XTRAIN,ytrain,XTEST)(kernridgereg(XTRAIN,ytrain,XTEST,kern,lambda));

mse = crossval('mse',X_prime,y_prime,'Predfun',f);