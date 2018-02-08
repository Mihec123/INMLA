Q=loadStanfordMatrix;
%n = size(Q,1); % to je v tem primeru 281903, zaradi hitrosti ne racunamo
%vsakic
c1 = 2;
c2 = 0;
c3=4;
c4 = 6;
V = (6*c1*c2+c3*c4+20)/1000;
n = 281903;
koraki = 50;
napaka = 1e-6;
vrednosti = [V,0.01,0.04,0.1,0.3,0.5,0.8,0.95];

potencnavr = zeros(length(vrednosti),2);
arnoldijeva = zeros(length(vrednosti),2);

x0 = rand(n,1);
for h = 1:length(vrednosti)
    [e,x,k,lambda] = potencna(@(x) mnozenjeSfunkcijoA(x,vrednosti(h),n,Q),x0,napaka,koraki);
    potencnavr(h,1) = e;
    potencnavr(h,2) = k;
    [V,H]=Arnoldi(@(x) mnozenjeSfunkcijoA(x,vrednosti(h),n,Q),x0,koraki,napaka);
    ro = zeros(1,koraki);
    for l= 1:koraki
        T = H(1:l,1:l);
        ro(l) = max(abs(eig(T)));     
    end
    arnoldijeva(h,1) = ro(end);
    arnoldijeva(h,2) = koraki;
end



% tic
% [y] = mnozenjeSfunkcijoA(rand(n,1),V,n,Q);
% toc;
% x0 = rand(n,1);

% tic
% [vektor,lv] = eigs(@(x) mnozenjeSfunkcijoA(x,V,n,Q),n,1);
% toc;


%OPTS.maxit = 10;
%[vektor,lv] = eigs(@(x) mnozenjeSfunkcijoA(x,V,n,Q),n,1,'LM',OPTS);