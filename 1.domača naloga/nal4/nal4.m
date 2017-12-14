c1=2;
c2=0;
c3=4;
c4=6;
V = 4*c1*c2+c3*c4;
load('mahalanobis.mat')
b = test(:,V);
A = @(x,alfa) (train)*(train' * ((1-alfa)*x)) + (alfa*x); %Mnozenje z matriko A
razlika = 1e-6;
N=150;
alfa = [0:0.05:1];

[ostanki,koraki,cas] = ocena(train,A,b,alfa,razlika,N);

%izberemo optimalen alfa

% alfa = 0.2;
% B = @(x) A(x,alfa);
% [Pr,ostanek] = RegularizacijaInverz(B,train,test,20489,razlika,100);


% n = size(train,1);
% IzbranAlfa = 0.3; 
% B=@(x) A(x,IzbranAlfa);
% temp = zeros(500,n);
% ostanek = -Inf;
% tic;
% for i = 1:n
%     e1 = zeros(n,1);
%     e1(i) = 1;
%     [a1,flag,res,maxit] = pcg(B,e1,razlika,N);
%     temp_ostanek = norm(train*(train'*a1)-e1,Inf);
%     if temp_ostanek > ostanek
%         ostanek = temp_ostanek;
%     end
%     temp(:,i) = test'*a1;
%     if mod(i,1000) == 0
%         toc
%         i
%     end
% end
% 
% H = temp * test;