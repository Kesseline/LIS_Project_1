function yfit = kernridgereg( XTRAIN, ytrain, XTEST, lambda, p, c )
%FUN Summary of this function goes here
%   Detailed explanation goes here

[n,d] = size(XTRAIN);
[m,e] = size(XTEST);

yfit = zeros(m,1);

pol = @( x1, x2 )( (x1 * x2' + c )^p );

K = zeros(n,n);

for i = 1:n
    for j = 1:n
        K(i,j) = pol(XTRAIN(i,:), XTRAIN(j,:));
    end
end
    
for l = 1:m
    k = zeros(n,1);
    
    for  i = 1:n
        k(i) = pol(XTRAIN(i,:), XTEST(l,:));
    end
    
    yfit(l) = (ytrain' * ((K + lambda*eye(n))\k));
end
end