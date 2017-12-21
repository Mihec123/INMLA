%naloga3

ponovni = [1:1:30];
ponovni1 = [1:1:15];
N=500;
napaka = 1e-6;
alfa = 0.1;

%matrika 1224
[casi1,ost1,koraki1,konvergenca1] = test1224(napaka,N)
pause;
[casi2,ost2,koraki2,konvergenca2]=test1224LU(alfa,napaka,N)
pause;
load('1224.mat')
A = Problem.A;
b = Problem.b;
[iteracije3,ost3,cas3,konvergenca3] = gmresPonovni(A,b,napaka,N,ponovni,alfa)
pause;

%matrika 1311
[casi4,ost4,koraki4,konvergenca4]=test1311(napaka,N)
pause;
load('1311.mat')
A = Problem.A;
b = A*ones(length(A),1);
[iteracije5,ost5,cas5,konvergenca5] = gmresPonovni(A,b,napaka,N,ponovni)
pause;

%matrika 1374
[casi6,ost6,koraki6,konvergenca6]=test1374(napaka,N)
pause;
load('1374.mat')
A = Problem.A;
b = A*ones(length(A),1);
[iteracije7,ost7,cas7,konvergenca7] = gmresPonovni(A,b,napaka,N,ponovni1)
pause;