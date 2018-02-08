function [e,x,k,lambda] = potencna(A,x0,tol,N)
% Opis:
%  potencna izracuna priblizek za dominantni lastni par matrike A
%
% Definicija:
%  [e,x,k] = potencna(A,x0,tol,N)
%
% Vhodni podatki:
%  A    kvadratna matrika ali mnozenje z matriko A,
%  x0   zacetni priblizek za dominantni lastni vektor matrike A
%  tol  toleranca napake priblizka za dominantni lastni par (privzeta
%       vrednost je 1e-10),
%  N    maksimalno stevilo korakov iteracije (privzeta vrednost je 200)
%
% Izhodni podatki:
%  e    priblizek za dominantno lastno vrednost (Rayleighjev kvocient
%       priblizka za lastni vektor),
%  x    priblizek za dominantni lastni vektor,
%  k    stevilo opravljenih korakov iteracije

if nargin < 4, N = 200; end
if nargin < 3, tol = 1e-10; end

if ~isa(A,'function_handle')
    A = @(x) A*x;
    if nargin < 2, x0 = rand(size(A,1),1); end
end
lambda = zeros(1,N);
x0 = x0/norm(x0);
x = A(x0);
e = x0'*x;
k = 0;
while norm(x-e*x0) >= tol && k < N
    x0 = x/norm(x);
    x = A(x0);
    e = x0'*x;
    lambda(k+1) = e;
    k = k+1;
end
x = x/norm(x);

end