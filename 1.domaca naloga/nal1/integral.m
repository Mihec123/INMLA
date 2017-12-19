function [ int ] = integral( N,risi )
%funkcija izracuna integral dan pri prvi nalogi
%pri cemer kot vhodni podatek podamo le stevilo delilnih tock
%in parameter ali risemo ali ne

h = 1/(N-1);
G = numgridPlus(N);
A = delsq(G);
e1 = ones(length(A),1);
b=(2*h^2)*e1; 

u = A\b;
U = G;
U(G>0) = full(u(G(G>0)));
if risi
    x = linspace(0,1,N);
    surf(x,x,U);
end

%matrika trapezne metode
t = 2*ones(N,1);
t(1) = 1;
t(end) = 1;
T =(h^2/4)*t*t';
int = (4*pi/(5*(1/3)^2)^2)*sum(sum(T*U))/N;


end

