function [verj] = pd(i,j,m)

if abs(i-j) > 1
    verj = 0;
else
    verj = (i+j)/m
end