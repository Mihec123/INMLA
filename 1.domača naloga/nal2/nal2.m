%naloga2

napaka = 1e-10;
maxit = 200;

load('DL1.mat');
A = Problem.A;
b = Problem.b;

[x1,res1] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);

% load('DL2.mat');
% A = Problem.A;
% b = Problem.b;
% 
% [x2,res2] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);

% load('DL3.mat');
% A = Problem.A;
% b = Problem.b;
% 
% [x3,res3] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);

load('DL4.mat');
A = Problem.A;
b = Problem.b;

[x4,res4] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);