N = 1000;
napaka = 1e-6;

%matrika c-63
%matrika je simetricna in ni pozitivno definitna
load('1224')
A = Problem.A;
b = Problem.b;
x0 = zeros(length(A),1);
%konvergenca pocasna

setup.type ='nofill';
setup.droptol = 0.1;
[L,U] = ilu(A,setup);

% opcije.type = 'ict';
% opcije.droptol = 0.005;
% L1 = ichol(A,opcije);


%1000 korakov gmres brez ponovnega zagona ostanek se vedno 0.01
% ponovni= [5:5:50];
% n = length(ponovni);
% iteracije = zeros(n,1);
% ost = zeros(n,1);
% cas = zeros(n,1);
% 
% 
% for i=1:n
%     tic;
%     [X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[ponovni(i)],napaka,N,L,U);
%     trajanje = toc;
%     iteracije(i) = ITER1(1) * ITER1(2);
%     ost(i) = RELRES1;
%     cas(i) = trajanje;
% end
%[X2,FLAG2,RELRES2,ITER2] = minres(A,b,napaka,N);
%matrika ni pozitivno definitna
%[X3,FLAG3,RELRES3,ITER3] = pcg(A,b,napaka,N);
%[X4,FLAG4,RELRES4,ITER4] = bicg(A,b,napaka,N);
%[X5,FLAG5,RELRES5,ITER5] = qmr(A,b,napaka,N,L,U);
%[X6,FLAG6,RELRES6,ITER6] = symmlq(A,b,napaka,N);
%matrika ni pozitivno definitna
%[X7,FLAG7,RELRES7,ITER7] = bicgstab(A,b,napaka,N);


% %matrika gridgena
% %matrika je simetricna in pozitivno definitna
% load('1311')
% A = Problem.A;
% b = A*ones(length(A),1);
% [X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[],1e-10,100);
% [X2,FLAG2,RELRES2,ITER2] = minres(A,b,napaka,N);
%[X3,FLAG3,RELRES3,ITER3] = pcg(A,b,napaka,N,L,U);
% [X4,FLAG4,RELRES4,ITER4] = bicg(A,b,napaka,N);
% [X5,FLAG5,RELRES5,ITER5] = qmr(A,b,napaka,N);
% [X6,FLAG6,RELRES6,ITER6] = symmlq(A,b,napaka,N);
% [X7,FLAG7,RELRES7,ITER7] = bicgstab(A,b,napaka,N);


% %matrika rajat25
% %matrika ni simetricna in ni pozitivno definitna
% load('1374')
% A = Problem.A;
% b = A*ones(length(A),1);
% [X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[],napaka,N);
% [X2,FLAG2,RELRES2,ITER2] = minres(A,b,napaka,N);
% %[X3,FLAG3,RELRES3,ITER3] = pcg(A,b,napaka,N);
% %[X4,FLAG4,RELRES4,ITER4] = bicg(A,b,napaka,N);
% [X5,FLAG5,RELRES5,ITER5] = qmr(A,b,napaka,N);
% %[X6,FLAG6,RELRES6,ITER6] = symmlq(A,b,napaka,N);
% %[X7,FLAG7,RELRES7,ITER7] = bicgstab(A,b,napaka,N);