function [verj] = pu(i,j,m)

if abs(i-j) > 1
    verj = 0;
else
    verj=1-pd(i,j,m);
end