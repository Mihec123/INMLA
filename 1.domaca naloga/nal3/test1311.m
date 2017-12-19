function [casi,ost,koraki,konvergenca] = test1311(napaka,N)
%Funkcija izracuna priblizek x za sistem A*x=b za A je gridgena z metodami
%gmres(0),minres,bicg,qmr,symmlq,pcg,bicgstab, ter vnre njihove casovne
%zahtevnosti, stevilo korakov, ostanke in ali je metoda skonvergirala

load('1311')
A = Problem.A;
b = A*ones(length(A),1);

n = 7;
ost = zeros(n,1);
casi = zeros(n,1);
koraki = zeros(n,1);
konvergenca = zeros(n,1);

tic;
[X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[],napaka,N);
cas =toc;
casi(1) = cas;
koraki(1) = ITER1(2);
ost(1) = RELRES1;
konvergenca(1) = FLAG1;
tic;
[X2,FLAG2,RELRES2,ITER2] = minres(A,b,napaka,N);
cas = toc;
casi(2) = cas;
koraki(2) = ITER2;
ost(2) = RELRES2;
konvergenca(2) = FLAG2;
tic;
[X3,FLAG3,RELRES3,ITER3] = bicg(A,b,napaka,N);
cas = toc;
casi(3) = cas;
koraki(3) = ITER3;
ost(3) = RELRES3;
konvergenca(3) = FLAG3;
tic;
[X4,FLAG4,RELRES4,ITER4] = qmr(A,b,napaka,N);
cas = toc;
casi(4) = cas;
koraki(4) = ITER4;
ost(4) = RELRES4;
konvergenca(4) = FLAG4;
tic;
[X5,FLAG5,RELRES5,ITER5] = symmlq(A,b,napaka,N);
cas = toc;
casi(5) = cas;
koraki(5) = ITER5;
ost(5) = RELRES5;
konvergenca(5) = FLAG5;

tic;
[X6,FLAG6,RELRES6,ITER6] = pcg(A,b,napaka,N);
cas = toc;
casi(6) = cas;
koraki(6) = ITER5;
ost(6) = RELRES5;
konvergenca(6) = FLAG5;

tic;
[X7,FLAG7,RELRES7,ITER7] = bicgstab(A,b,napaka,N);
cas = toc;
casi(7) = cas;
koraki(7) = ITER7;
ost(7) = RELRES7;
konvergenca(7) = FLAG7;


disp('[gmres(0),minres,bicg,qmr,symmlq,pcg,bicgstab]')



end

