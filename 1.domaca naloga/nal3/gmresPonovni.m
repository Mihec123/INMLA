function [iteracije,ost,cas,konvergenca] = gmresPonovni(A,b,napaka,N,ponovni,alfa)
%Funkcija poisce resitev sistema A*x=b za razlicne velikost podprostora gmres, kjer so
%mozni podrosoti podani v podatku ponovni. Ce je podan tudi alfa izvedemo
%LU predpogojevanje pri parametru alfa
lu = true;

if nargin <6
    lu = false;

end

if lu
    tic;
    setup.type ='nofill';
    setup.droptol = alfa;
    [L,U] = ilu(A,setup);
    caslu = toc;
end

n = length(ponovni);
iteracije = zeros(n,1);
ost = zeros(n,1);
cas = zeros(n,1);
konvergenca = zeros(n,1);


if lu
    for i=1:n
        tic;
        [X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[ponovni(i)],napaka,N,L,U);
        trajanje = toc;
        iteracije(i) = ITER1(1) * ITER1(2);
        ost(i) = RELRES1;
        cas(i) = trajanje;
        konvergenca(i) = FLAG1;
    end
    cas = cas+ caslu;
else
    for i=1:n
        tic;
        [X1,FLAG1,RELRES1,ITER1] = gmres(A,b,[ponovni(i)],napaka,N);
        trajanje = toc;
        iteracije(i) = ITER1(1) * ITER1(2);
        ost(i) = RELRES1;
        cas(i) = trajanje;
        konvergenca(i) = FLAG1;
    end
end

end

