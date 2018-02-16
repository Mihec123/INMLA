function [y] = mnozenjeSfunkcijoA(x,alfa,n,Q)
%mnozenje s funkcijo A poteka tako da, podamo parameter
%alfa in Q kjer je Q matrika uporabljena pri mnozenju z A
%zaradi enostavnosti podamo še parameter n, ki pove veliksot matrike A
e = ones(1,n);
stolpec_nicel = ~any(Q);
indeksi = find(stolpec_nicel);
d = zeros(n,1);
d(indeksi) = 1;

mnozenjeP = @(x) Q*x + (1/n)*e*d*x;
mnozenjeA = @(x,alfa) alfa*mnozenjeP(x) + (1/n)*(1-alfa)*e*e'*x;

y = mnozenjeA(x,alfa);


end

