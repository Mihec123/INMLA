function [V,T]=Lanczos(A,r0,k)

% [V,T]=Lanczos(A,r0,k,eps) naredi k korakov osnovnega Lanczosevega
% algoritma z zacetnim vektorjem r0 in vrne ortonormirano bazo za 
% podprostor Krilova K_k (A,r0). Matrika A mora biti simetricna.
%
% Ce se izvede do konca, vrne matriki V in T, da je A*V(:,1:k) = V*T,
% kjer je V matrika s (k+1) stolpci, matrika T pa je tridiagonalna 
% matrika velikosti (k+1) x k.
% 
% Ce pride do prekinitve, dobimo matriki V in T, da je V'*A*V = T. Pogoj za
% prekinitev je, da je norma pod delta. Privzeta vrednost je delta=0.

% Bor Plestenjak 2011

% Ce argumenta delta ne podamo, je privzeta vrednost 0
if nargin<4, delta=0; end

V(:,1) = r0/norm(r0);
% j=1
z = A*V(:,1);
a(1) = V (:,1)'*z;
z = z - a(1)*V(:,1);
t = norm(z);
if t <= delta
    T = diag(a) + diag(b,-1) + diag(b,1);
    return
end
b(1) = t;
V(:,2) = z/b(1);
for j = 2:k
    z = A*V(:,j) - b(j-1)*V(:,j-1);
    a(j) = V (:,j)'*z;
    z = z - a(j)*V(:,j);
    t = norm(z);
    if t <= delta
        T = diag(a) + diag(b,-1) + diag(b,1);
        return
    end
    b(j) = t;
    V(:,j+1) = z/b(j);
end
T = diag(a) + diag(b(1:k-1),-1)+diag(b(1:k-1),1);
T(k+1,k) = b(k);