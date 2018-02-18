n = 50;
h = 3*n-2;
L1 = lik1(n);
L2 = lik2(n);

D1 = delsq(L1);
D2 = delsq(L2);

[v1,vr1]=eigs(D1,5,'SM');
[v2,vr2]=eigs(D2,5,'SM');

B1 = L1;
B2 = L2;
B1(L1>0) = v1(:,1);
B2(L2>0) = v2(:,1);

figure;
mesh(B1)
figure;
mesh(B2)

razlika = v1(end-5:end)-v2(end-5:end);