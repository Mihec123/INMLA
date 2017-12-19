function [x,res]=ArnoldiFOM(A,b,x0,tol,maxit)

% [x,res]=ArnoldiFOM(A,b,x0,tol,maxit) uporabi FOM metodo 
% za resevanje linearnega sistema Ax=b. Pri tej varianti
% Arnoldijeva metoda ne uporablja RGS, temve� le MGS.
% 
% Kot resitev vrne 
% x : vektor x_k iz zadnjega koraka
% res : vektor norm ostankov ||b-Ax_j|| za j=1,...,k  
%
% Algoritem se kon�a, ko je norma ostanka pod tol ali ko prese�emo 
% maksimalno podano �tevilo korakov 

% Bor Plestenjak 2013

%n = size(A,1);
%V = zeros(n,maxit);
%H = zeros(n,n);

r0 = b - A*x0;
nr0 = norm(r0);
V(:,1) = r0/nr0;
for j = 1:maxit
    z = A*V(:,j);
    for i = 1:j
        H(i,j) = V(:,i)'*z;
        z = z-H(i,j)*V(:,i);
    end
    t = norm(z);
    tmp = nr0*eye(j,1);
    y = H(1:j,1:j)\tmp;
    res(j) = t*abs(y(j));
    if res(j) <= tol  % test konvergence
        x = x0 + V*y;
        return
    end
    H(j+1,j) = t;
    V(:,j+1) = z/H(j+1,j);
end

% �e se je zanka kon�ala brez konvergence, vrnemo zadnji pribli�ek
x = x0 + V(:,1:j)*y;




