function [x] = ResitevLanczos(A,b,k)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

x0 = zeros(length(A),1);
r0 = b-A*x0;
[V,T]=Lanczos(A,r0,k);
e1 = zeros(length(A),1);
e1(1) = 1;
y = luDelniTri(T,norm(r0)*e1);
x = V*y;



end

