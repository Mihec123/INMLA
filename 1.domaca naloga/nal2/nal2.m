%naloga2

napaka = 1e-10;
maxit = 5000;

load('DL1.mat');
A = Problem.A;
b = Problem.b;
y1 = A\b;
[x1,res1] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
x = [1:1:length(res1)];
ix = (res1==0);
res1(ix) = [];
x(ix) = [];
figure;
plot(x,log10(res1))
title('graf konvergence DlanczosPivot pri matriki DL1')

load('DL2.mat');
A = Problem.A;
b = Problem.b;
y2 = A\b;
[x2,res2] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
x = [1:1:length(res2)];
ix = (res2==0);
res2(ix) = [];
x(ix) = [];
figure;
plot(x,log10(res2))
title('graf konvergence DlanczosPivot pri matriki DL2')

load('DL3.mat');
A = Problem.A;
b = Problem.b;
y3 = A\b;
[x3,res3] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);


load('DL4.mat');
A = Problem.A;
b = Problem.b;
y4 = A\b;
[x4,res4] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
x = [1:1:length(res4)];
ix = (res4==0);
res4(ix) = [];
x(ix) = [];
figure;
plot(x,log10(res4))
title('graf konvergence DlanczosPivot pri matriki DL4')
