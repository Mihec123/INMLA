c1=2;
c2=0;
c3=4;
c4=6;
V = 4*c1*c2+c3*c4;
load('mahalanobis.mat')
b = test(:,V);
A = @(x,alfa) (train)*(train' * ((1-alfa)*x)) + (alfa*x); % Mnozenje z matriko A
razlika = 1e-6;
N=150;
alfa = [0.05:0.05:1];

[ostanki,koraki,cas] = ocena(A,b,alfa,razlika,N);

% izberemo optimalen alfa

alfa = 0.7;
B = @(x) A(x,alfa);
[Pr,ostanek] = RegularizacijaInverz(B,test,20489,razlika,100,train);
