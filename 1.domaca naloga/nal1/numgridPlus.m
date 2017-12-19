function [G] = numgridPlus(N)
%  numgrid Number the grid points in a two dimensional region.
%     G = numgridPlus(N) numbers the points on an N-by-N grid in
%     the subregion of -1<=x<=1 and -1<=y<=1 determined by a plus sign.
n = (N-2)/3;
G = zeros(N);
G1 = numgrid('S',n+2);
%v G nastavimo prvi kvadrat
G(1:n+1,1+n+1:1+2*n) = G1(1:end-1,2:end-1);
G1(G1>0) = G1(G1>0) + n^2;

% v G nastavimo drugi kvadrat
G(1+n+1:1+2*n,1:n+1) = G1(2:end-1,1:end-1);
G1(G1>0) = G1(G1>0) + n^2;

% v G nastavimo tretji kvadrat
G(1+n+1:1+2*n,n+2:2*n+1)=G1(2:end-1,2:end-1);
G1(G1>0) = G1(G1>0) + n^2;

% v G nastavimo cetrti kvadrat
G(1+n+1:1+2*n,2*n+2:end) = G1(2:end-1,2:end);
G1(G1>0) = G1(G1>0) + n^2;

% v G nastavimo peti kvadrat
G(2*n+2:end,1+n+1:1+2*n) = G1(2:end,2:end-1);
end

