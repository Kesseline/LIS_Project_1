
vark = optimizableVariable('k',[1,100]);
vark.Type = 'integer';

results = bayesopt(@fun,[vark]);

function rmse = fun(x)
    load('../data/train.mat','X','y');
    
    k = x.k;
    
    rmse = sqrt(crossval('mse',X,y,'Predfun',@getKnn));

    function yfit = getKnn( XTRAIN, ytrain, XTEST )
        [m,n] = size(XTEST);

        yfit = zeros(m,1);

        nn = knnsearch(XTRAIN, XTEST, 'K', k);

        for i=1:m
            sum = 0;
            for j=1:k
                xtrain = XTRAIN(nn(i,j),:);
                xtest = XTEST(i,:);
                d = norm(xtrain - xtest,10);
                sum = sum + (1/d)*ytrain(nn(i,j));
            end
            yfit(i) = sum/k;
        end
    end
end

