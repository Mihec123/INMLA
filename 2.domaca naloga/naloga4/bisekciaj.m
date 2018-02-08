function [ y,it,flag ] = bisekciaj(funkcija,a,b,maxit,eps)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

i=0;
y = 0;
flag = 0;
while i < maxit
    s = (a+b)/2;
    vr = funkcija(s);
    if vr == 0 || abs(a-s) < eps
        y = s;
        flag = 1;
        break
    else
        if funkcija(a)*funkcija(s) > 0
            a = s;
        else
            b=s;
        end
        i = i+1;
        y =s;
    end
end
it =i;


end

