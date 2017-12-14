function [Pr,ostanek] = RegularizacijaInverz(B,T,test,N,razlika,maxIT)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

temp = zeros(size(test,2),N);
ostanek = -Inf;
tic;
for i = 1:N
    e1 = zeros(N,1);
    e1(i) = 1;
    [a1,flag,res,maxit] = pcg(B,e1,razlika,maxIT);
    temp_ostanek = norm(T*(T'*a1)-e1,Inf);
    if temp_ostanek > ostanek
        ostanek = temp_ostanek;
    end
    temp(:,i) = test'*a1;
    if mod(i,1000) == 0
        toc
        i
    end
end

Pr = temp * test;


end

