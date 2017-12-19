%naloga2

napaka = 1e-20;
maxit = 200;

load('DL1.mat');
A = Problem.A;
b = Problem.b;
y1 = A\b;
[x1,res1] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
norm(x1-y1,Inf)
norm(A*x1-b,Inf)

load('DL2.mat');
A = Problem.A;
b = Problem.b;
y2 = A\b;
[x2,res2] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
norm(x2-y2,Inf)
norm(A*x2-b,Inf)

load('DL3.mat');
A = Problem.A;
b = Problem.b;
y3 = A\b;
[x3,res3] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
norm(x3-y3,Inf)
norm(A*x3-b,Inf)

load('DL4.mat');
A = Problem.A;
b = Problem.b;
y4 = A\b;
[x4,res4] = DLanczosPivot(A,b,zeros(length(b),1),napaka,maxit);
norm(x4-y4,Inf)
norm(A*x4-b,Inf)

%matrika kjer je potrebno pivotirati zapored
load('Test1.mat');
A = Problem.A;
b = Problem.b;
y5 = A\b;
[x5,res5] = DLanczosPivot(A,b,zeros(length(b),1),1e-20,4);
norm(x5-y5,Inf)
norm(A*x5-b,Inf)

%matrika kjer ne pivotiramo
load('Test2.mat');
A = Problem.A;
b = Problem.b;
y6 = A\b;
[x6,res6] = DLanczosPivot(A,b,zeros(length(b),1),1e-20,6);
norm(x6-y6,Inf)
norm(A*x6-b,Inf)