function [V,H,k]=Arnoldi(A,r0,k,delta)

% [V,H]=Arnoldi(A,r0,k,eps) naredi k korakov osnovnega Arnoldijevega
% algoritma z zacetnim vektorjem r0 in vrne ortonormirano bazo za 
% podprostor Krilova K_k(A,r0).
%
% Ce se izvede do konca, vrne matriki V in H, da je A*V(:,1:k) = V*H,
% kjer je V matrika s (k+1) stolpci, matrika H pa je zgornja Hessenbergova 
% matrika velikosti (k+1) x k.
% 
% Ce pride do prekinitve, dobimo matriki V in H, da je V'*A*V = H. Pogoj za
% prekinitev je, da je norma pod delta. Privzeta vrednost je delta=0.

% Bor Plestenjak 2011

% Ce argumenta delta ne podamo, je privzeta vrednost 0
if nargin<4, delta=0; end

V(:,1) = r0/norm(r0);
for j = 1:k
    z = A(V(:,j));
    for i = 1:j
        H(i,j) = V(:,i)'*z;
        z = z-H(i,j)*V(:,i);
    end
    t = norm(z);
    if t <= delta
        return
    end
    H(j+1,j) = t;
    V(:,j+1) = z/H(j+1,j);
end
end



