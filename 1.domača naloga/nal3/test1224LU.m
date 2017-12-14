function [casi,ost,koraki,konvergenca] = test1224LU(alfa,napaka,N)
%UNTITLED Summary of this function goes here
% simetricna

load('1224')
A = Problem.A;
b = Problem.b;

tic;
setup.type ='nofill';
setup.droptol = alfa;
[L,U] = ilu(A,setup);
caslu = toc;

n = 4;
ost = zeros(n,1);
casi = zeros(n,1);
koraki = zeros(n,1);
konvergenca = zeros(n,1);
tic;
[X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[],napaka,N,L,U);
cas =toc;
casi(1) = cas;
koraki(1) = ITER1(2);
ost(1) = RELRES1;
konvergenca(1) = FLAG1;

tic;
[X2,FLAG2,RELRES2,ITER2] = qmr(A,b,napaka,N,L,U);
cas = toc;
casi(2) = cas;
koraki(2) = ITER2;
ost(2) = RELRES2;
konvergenca(2) = FLAG2;

tic;
[X3,FLAG3,RELRES3,ITER3] = bicgstab(A,b,napaka,N,L,U);
cas = toc;
casi(3) = cas;
koraki(3) = ITER3;
ost(3) = RELRES3;
konvergenca(3) = FLAG3;

tic;
[X4,FLAG4,RELRES4,ITER4] = bicg(A,b,napaka,N,L,U);
cas = toc;
casi(4) = cas;
koraki(4) = ITER4;
ost(4) = RELRES4;
konvergenca(4) = FLAG4;


casi = casi + caslu;

disp('[gmres(0),qmr,bicgstab, bicg]')



end

