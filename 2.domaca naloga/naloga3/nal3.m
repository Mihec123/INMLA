[G1,M1] = Prehodna(10);
[v1,lv1] =eigs(G1',1,1);

vr1 = max(G1(find(G1)));
indeksi = find(G1 == vr1);
m = length(indeksi);
maxvr1 = zeros(m,4);
for i = 1:m
    [x,y] = indeks(indeksi(i),length(M1));
    maxvr1(i,1:2) = M1(x,:);
    maxvr1(i,3:4) = M1(y,:);
end

figure;
mesh(G1);

[G2,M2] = Prehodna(100);
[v2,lv2] =eigs(G2',1,1);

vr2 = max(G2(find(G2)));
indeksi = find(G2 == vr2);
m = length(indeksi);
maxvr2 = zeros(m,4);
for i = 1:m
    [x,y] = indeks(indeksi(i),length(M2));
    maxvr2(i,1:2) = M2(x,:);
    maxvr2(i,3:4) = M2(y,:);
end

[G,M] = Prehodna(1000);% rezultat tega shranjen v matrika1000ok.mat
%load('matrika1000ok.mat')
[v3,lv3] =eigs(G',1,1);

vr3 = max(G(find(G)));
indeksi = find(G == vr3);
m = length(indeksi);
maxvr3 = zeros(m,4);
for i = 1:m
    [x,y] = indeks(indeksi(i),length(M));
    maxvr3(i,1:2) = M(x,:);
    maxvr3(i,3:4) = M(y,:);
end