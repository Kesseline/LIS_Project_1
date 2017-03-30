% Submission leads to error of 17.09

load('../data/train.mat');
load('../data/test.mat');
load('../data/indices.mat');
addpath(genpath('..'));
filename = 'gausspolykern.csv';

h = 6.1;
lambda = 10; %0.01 best for RBF
p = 3;
c = 1;
c1 = 0.82;
c2 = 0.008;

kern = @( x1, x2 )( c1*exp(-(norm(x1-x2)^2)/(h^2)) + c2*(x1 * x2' + c )^p);
ytest = kernridgereg(X,y,X_test, kern, lambda);
res = [indices, ytest];

fid = fopen(filename, 'w');
fprintf(fid, 'Id,y\n');
fclose(fid);
dlmwrite(filename,res,'-append','precision','%.4f');

