function [casi,ost,koraki,konvergenca] = test1374(napaka,N)
%UNTITLED Summary of this function goes here
% brez posebne oblike

load('1374')
A = Problem.A;
b = A*ones(length(A),1);

n = 4;
ost = zeros(n,1);
casi = zeros(n,1);
koraki = zeros(n,1);
konvergenca = zeros(n,1);

tic;
[X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[25],napaka,N);
cas =toc;
casi(1) = cas;
koraki(1) = ITER1(2);
ost(1) = RELRES1;
konvergenca(1) = FLAG1;
tic;

[X2,FLAG2,RELRES2,ITER2] = bicg(A,b,napaka,N);
cas = toc;
casi(2) = cas;
koraki(2) = ITER2;
ost(2) = RELRES2;
konvergenca(2) = FLAG2;
tic;

[X3,FLAG3,RELRES3,ITER3] = qmr(A,b,napaka,N);
cas = toc;
casi(3) = cas;
koraki(3) = ITER3;
ost(3) = RELRES3;
konvergenca(3) = FLAG3;
tic;

tic;
[X4,FLAG4,RELRES4,ITER4] = bicgstab(A,b,napaka,N);
cas=toc;
casi(4) = cas;
koraki(4) = ITER4;
ost(4) = RELRES4;
konvergenca(4) = FLAG4;


disp('[gmres(0),bicg,qmr,bicgstab]')



end

