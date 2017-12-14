function [ostanki,koraki,cas] = ocena(X,A,b,alfa,razlika,N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n = length(alfa);
ostanki = zeros(n,1);
koraki = zeros(n,1);
cas = zeros(n,1);

T = X*X';
y = T\b;
display('konec racunanja tocne resitve')


for i=1:length(alfa)
    B=@(x) A(x,alfa(i));
    tic;
    [x,flag,ostanek,stevilo] = pcg(B,b,razlika,N);
    cas1 = toc;
    ostanki(i)=norm(y-x,Inf);
    koraki(i)=stevilo;
    cas(i) = cas1;
end
figure;
plot(alfa,ostanki);
title('graf ostankov v odvisnosti od alfa')

figure;
plot(alfa,koraki);
title('graf korakov v odvisnosti od alfa')

figure;
plot(alfa,cas);
title('graf casa v odvisnosti od alfa')


end

