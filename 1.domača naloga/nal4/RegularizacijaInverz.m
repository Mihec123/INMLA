function [Pr,ostanek] = RegularizacijaInverz(B,test,N,razlika,maxIT,T)
%B funkcija mnozenja z matriko, katere sistem hocemo resiti. T*T' je
%matrika katere inverz nas zanima in jo uporabljamo za izracun napake.
%Matrika test je matrika s katero hocemo izracunati produkt test'*B^-1*test
%   Detailed explanation goes here

temp = zeros(size(test,2),N);
racunaj = 0;
if nargout == 2 && nargin ==6
    racunaj = 1;
    ostanek = -Inf;
end
tic;
for i = 1:N
    e1 = zeros(N,1);
    e1(i) = 1;
    [a1,flag,res,maxit] = pcg(B,e1,razlika,maxIT);
    if racunaj
        temp_ostanek = norm(T*(T'*a1)-e1,Inf);
        if temp_ostanek > ostanek
            ostanek = temp_ostanek;
        end
    end
    temp(:,i) = test'*a1;
    if mod(i,1000) == 0
        toc
        i
    end
end

Pr = temp * test;


end

