% Gaussian kernel
% Doesnt look too promising...

varh = optimizableVariable('h',[4.5,6.5]);
varl = optimizableVariable('l',[0,1]);
varl.Type = 'integer';

results = bayesopt(@fun,[varl])

function rmse = fun(x)
    load('../data/train.mat');
    
    kern = @( x1, x2 )( exp(-(norm(x1-x2)^2)/(6.2^2)));
    f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, x.l));
    mse = crossval('mse',X,y,'Predfun',f);
    rmse = sqrt(mse);
    
end
