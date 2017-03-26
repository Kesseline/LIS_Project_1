
load('../data/train.mat');

err = zeros(3,5);

h = waitbar(0, 'Please wait...');
for p = 1:3
    for l = 1:5
        waitbar(p*l / 15, h);
        lambda = l*200; 
        kern = @( x1, x2 )( (x1 * x2' + 1 )^p );
        f = @(XTRAIN, ytrain, XTEST)(kernridgereg(XTRAIN,ytrain,XTEST, kern, lambda));
        mse = crossval('mse',X,y,'Predfun',f);
        err(p,l) = sqrt(mse);
    end
end

save('crossval_err','err');