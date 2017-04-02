function [ ] = Regression( )
% compute the regression.
% (USE MATLAB'S CROSS VALIDATION.)

% Store the id and y from the training set into matrices.
IDs = csvread('train.csv',1,0,[1,0,900,0]);
Y = csvread('train.csv',1,1,[1,1,900,1]);

% Store the x values from the training set into a matrix.
X = csvread('train.csv',1,2,[1,2,900,16]);

% Add a one row to the X matrix.
Mat_Ones = ones(900,1);
X2 = [Mat_Ones X];

%----------------------------------------------------------------------
% FOURTH APPROACH: NON-LINEAR REGRESSION, CUBIC
%----------------------------------------------------------------------
% If we work with cubic functions, then we need (18 choose 3)=816
% parameters.
Extended_X = zeros(900,816);
Extended_X = extend2Cubic(X2);

% w2 = Extended_X \ Y;
% Compute w2 differently.
% RIDGE REGRESSION.
% I2 = eye(816,816);
% k = 200;
%w2 = (inv(Extended_X'*Extended_X + k*I2))*Extended_X'*Y;
w2 = inv(Extended_X'*Extended_X)*Extended_X'*Y;
% 
Y_prediction = Extended_X * w2;

RMSE = sqrt(mean((Y - Y_prediction).^2));
disp('Cubic least squares regression:');
disp(RMSE);
%----------------------------------------------------------------------
ID_test = csvread('test.csv',1,0,[1,0,2000,0]);
X = csvread('test.csv',1,1,[1,1,2000,15]);

Mat_Ones = ones(2000,1);
X2 = [Mat_Ones X];
Extended_X = extend2Cubic(X2);

Y_output = Extended_X * w2;

ret = [ID_test, Y_output];
csvwrite('oneinstance.csv',ret,1,0);

end

