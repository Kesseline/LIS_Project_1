function [B] = extend2Quad(A)
% takes a monomial input matrix and returns a matrix that also holds the
% the quadratic entries.
[m,n] = size(A);
% assume the matrix A has an entry for the constant.
o = nchoosek(n+1,2);
% create the new matrix that will hold all perms as entries.
B = zeros(m,o);

% those two matrices are needed for the loop.
Mat = zeros(n,n);
Mat2 = zeros(1,o);

% the following loop construct builds the X matrix needed for quadratic
% regression.
% (THE IMPLEMENTATION IS SURELY NOT VERY WELL MADE IN TERMS OF COMPLEXITY)
for j = 1:m
    for i = 1:n
        for k = 1:n
            Mat(i,k) = A(j,i)*A(j,k);
        end
    end
    
    k = 1;
    for p = 1:n
        for q = 1:n
            if (p<=q)
                Mat2(1,k) = Mat(p,q);
                k = k+1;
            end
        end
    end
    B(j,:) = Mat2;
end
end

