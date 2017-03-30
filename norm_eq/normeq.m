function w = normeq(X,y)
%NORMEQ Summary of this function goes here
%   Detailed explanation goes here

H = X'*X;
if rank(H) < size(H,1) 
    error('Irregular matrix');
end
w = H\(X'*y);

end

