function [ostanki,koraki,cas] = ocena(A,b,alfa,razlika,N)
%funkcija izra?una x za posamezne alfa podane v funkciji A
%Kot rezultat dobimo casovno zahtevnost, stevilo korakov, velikost ostanka
%od resitve norm(A(x,0)-b,Inf)
n = length(alfa);
ostanki = zeros(n,1);
koraki = zeros(n,1);
cas = zeros(n,1);

C = @(x) A(x,0);

for i=1:length(alfa)
    B=@(x) A(x,alfa(i));
    tic;
    [x,flag,ostanek,stevilo] = pcg(B,b,razlika,N);
    cas1 = toc;
    ostanki(i)=norm(C(x)-b,Inf);
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

