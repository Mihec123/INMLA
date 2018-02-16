n = 50;
h = 3*n-2;
L1 = lik1(n);
L2 = lik2(n);

D1 = delsq(L1);
D2 = delsq(L2);

e1 = ones(length(D1),1);
b=e1; 

u1 = (D1-(2*h^2)*eye(length(D1)))\e1;
u2 = (D2-(2*h^2)*eye(length(D2)))\e1;

U1 = L1;
U1(L1>0) = full(u1(L1(L1>0)));

U2 = L2;
U2(L2>0) = full(u2(L2(L2>0)));

%[v1,vr1]=eigs(U1,5,'SM');
%[v2,vr2]=eigs(U2,5,'SM');

v1=eig(U1);
v2=eig(U2);

razlika = v1(end-5:end)-v2(end-5:end);