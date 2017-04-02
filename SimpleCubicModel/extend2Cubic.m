function [B] = extend2Cubic(A)
% takes a monomial input matrix and returns a matrix that also holds the
% the quadratic and cubic entries.
[m,n] = size(A);
% assume the matrix A has an entry for the constant.
o = nchoosek(n+2,3);
o = o - nchoosek(n+1,3);

% the following loop construct builds the X matrix needed for cubic
% regression.
C1 = extend2Quad(A);
A(:,1) = [];
C2 = zeros(m,o);
for i = 1:m
    x = 1;
    for j = 1:n-1
        for k = j:n-1
            for l = k:n-1
                C2(i,x) = A(i,j)*A(i,k)*A(i,l);
                x = x + 1;
            end
        end
    end
end

B = [C1, C2];

end

