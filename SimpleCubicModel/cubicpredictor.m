function ypred = cubicpredictor(Xtrain, ytrain, Xtest, lambda)

n1 = size(Xtrain,1);
n2 = size(Xtest,1);

Mat_Ones = ones(n1,1);
Extended_X = extend2Cubic([Mat_Ones Xtrain]);

w = (Extended_X'*Extended_X + lambda*eye(816))\(Extended_X'*ytrain);

Mat_OnesT = ones(n2,1); 
Extended_XT = extend2Cubic([Mat_OnesT Xtest]);

ypred = Extended_XT*w;


end

