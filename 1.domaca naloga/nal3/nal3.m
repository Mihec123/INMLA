%naloga3

ponovni = [1:1:30];
N=500;
napaka = 1e-6;
alfa = 0.1;

%matrika 1224
[casi,ost,koraki,konvergenca] = test1224(napaka,N)
pause;
[casi,ost,koraki,konvergenca]=test1224LU(alfa,napaka,N)
pause;
load('1224.mat')
A = Problem.A;
b = Problem.b;
[iteracije,ost,cas,konvergenca] = gmresPonovni(A,b,napaka,N,ponovni,alfa)
pause;

%matrika 1311
[casi,ost,koraki,konvergenca]=test1311(napaka,N)
pause;
load('1311.mat')
A = Problem.A;
b = A*ones(length(A),1);
[iteracije,ost,cas,konvergenca] = gmresPonovni(A,b,napaka,N,ponovni)
pause;

%matrika 1374
[casi,ost,koraki,konvergenca]=test1374(napaka,N)
pause;
load('1374.mat')
A = Problem.A;
b = A*ones(length(A),1);
[iteracije,ost,cas,konvergenca] = gmresPonovni(A,b,napaka,N,ponovni)
pause;