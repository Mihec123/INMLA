Q=loadStanfordMatrix;
%n = size(Q,1); % to je v tem primeru 281903, zaradi hitrosti ne racunamo
%vsakic
c1 = 2;
c2 = 0;
c3=4;
c4 = 6;
V = (6*c1*c2+c3*c4+20)/1000;
n = 281903;
koraki = 150;
napaka = 1e-3;
vrednosti = [V,0.01,0.04,0.1,0.3,0.5,0.8,0.95];

OPTS.maxit = 150;
OPTS.tol = 1e-3;

potencnavr = zeros(length(vrednosti),3);
arnoldijeva = zeros(length(vrednosti),3);
matlab = zeros(length(vrednosti),2);

x0 = rand(n,1);
for h = 1:length(vrednosti)
    tic;
    [e,x,k,lambda] = potencna(@(x) mnozenjeSfunkcijoA(x,vrednosti(h),n,Q),x0,napaka,koraki);
    cas = toc;
    potencnavr(h,1) = e;
    potencnavr(h,2) = k;
    potencnavr(h,3) = cas;
    
    ro = zeros(1,k);
    tic;
    [V,H,k]=Arnoldi(@(x) mnozenjeSfunkcijoA(x,vrednosti(h),n,Q),x0,koraki,napaka);   
    for l= 1:k
        T = H(1:l,1:l);
        ro(l) = max(abs(eig(T)));     
    end
    cas = toc;
    arnoldijeva(h,1) = ro(end);
    arnoldijeva(h,2) = koraki;
    arnoldijeva(h,3) = cas;
    
    tic;
    [vektor,lv] = eigs(@(x) mnozenjeSfunkcijoA(x,vrednosti(h),n,Q),n,1,'LM',OPTS);
    cas = toc;
    matlab(h,1) = lv;
    matlab(h,2) = cas;
end