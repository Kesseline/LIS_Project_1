
varp = optimizableVariable('p',[2,4]);
varp.Type = 'integer';
varl = optimizableVariable('l',[0,1]);

opt  = @f;

results = bayesopt(opt,[varp,varl]);

function mse = f(x)

    load('../data/train.mat');
    kern = @(x1, x2)((x1 * x2' + 1 )^x.p );
    fun  = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, x.l));
    mse  = crossval('mse',X,y,'Predfun',fun);
end