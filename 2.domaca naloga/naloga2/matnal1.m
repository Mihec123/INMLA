function [A,M] = matnal1(k);

M = zeros(6*k+1);
del1 = reshape(1:(2*k-1)*2*k, 2*k,2*k-1);
M(2:2*k+1,2*k+2:4*k) = del1;
top = (2*k-1)*2*k;
del2 = reshape(1:(2*k-1)*(6*k-1), 2*k-1, 6*k-1);
M(2*k+2:4*k, 2:end-1) = del2 + top;
top = top + (2*k-1)*(6*k-1);
M(4*k+1:end-1,2*k+2:4*k) = del1 + top;
A = delsq(M);
end