function yfit = kernridgereg( XTRAIN, ytrain, XTEST, kern, lambda )
%FUN Summary of this function goes here
%   Detailed explanation goes here

[n,d] = size(XTRAIN);
[m,e] = size(XTEST);

yfit = zeros(m,1);

K = zeros(n,n);

for i = 1:n
    for j = 1:n
        K(i,j) = kern(XTRAIN(i,:), XTRAIN(j,:));
    end
end
    
for l = 1:m
    k = zeros(n,1);
    
    for  i = 1:n
        k(i) = kern(XTRAIN(i,:), XTEST(l,:));
    end
    
    yfit(l) = (ytrain' * ((K + lambda*eye(n))\k));
end
end