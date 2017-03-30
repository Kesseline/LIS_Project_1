% Submission leads to error of 17.15

load('../data/train.mat');
load('../data/test.mat');
load('../data/indices.mat');
addpath(genpath('..'));
filename = 'polykernridgesub.csv';

lambda = 1000;
p = 3;

kern = @( x1, x2 )( (x1 * x2' + 1 )^p );
ytest = kernridgereg(X,y,X_test, kern, lambda);
res = [indices, ytest];

fid = fopen(filename, 'w');
fprintf(fid, 'Id,y\n');
fclose(fid);
dlmwrite(filename,res,'-append','precision','%.4f');

