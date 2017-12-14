function [x,res,korak,P] = DLanczosPivot1(A,b,x0,tol,maxit)

% [x,res] = DLanczos(A,b,x0,tol,maxit) uporabi metodo D-Lanczos
% za resevanje sistema Ax=b. Matrika A mora biti simetricna. Pri 
% tem pazi, da ne shranjuje vseh vektorjev, temvec le zadnja dva
%
% Kot resitev vrne 
% x : vektor x_k iz zadnjega koraka
% res : vektor norm ostankov ||b-Ax_j|| za j=1,...,k  
%
% Algoritem se kon?a, ko je norma ostanka pod tol ali ko presežemo 
% maksimalno podano število korakov 

% Bor Plestenjak 2013
r0 = b - A*x0;
vz = r0/norm(r0);  % vz = zadnji vektor iz matrike V
x = x0;

korak = 0;
n = length(b);
pivot = false;
premesu = false;
per = 1:n;
% korak j=1 naredimo lo?eno, ker v Matlabu nimamo indeksov 0
w = A*vz;
a(1) = vz'*w;
w = w - a(1)*vz;
b(1) = norm(w);
u(1) = a(1);
z(1) = norm(r0);
p = 1/u(1)*vz; % p = zadnji vektor iz matrike p
pz = zeros(length(p),1); % predzadnji vekotr iz matrike P
x = x + z(1)*p;
res(1) = b(1)*abs(z (1)/u(1));
if res(1)<tol 
    return
end;
vp = vz; % vp = predzadnji vektor iz matrike V
vz = w/b(1);
% zanka za korake j>1
for j = 2:maxit
    w = A*vz - b(j-1)*vp;
    a(j) = vz'*w;
    w = w - a(j)*vz;
    b(j) = norm(w);
    if ~pivot
        l(j) = b (j-1)/u(j-1);
        u(j) = a(j) - l(j)*b(j-1);
        if u(j) < 1e-10
            pivot = true;
        end
        z(j) = -l(j)*z(j-1);
        res(j) = Inf;
        if ~pivot
            if ~premesu
                p = 1/u(j)*(vz - b(j-1)*p);
            else
                p = 1/u(j)*(vz - bnov*p - b(j-1)*pz);
                premesu = false;
            end
            x = x + z(j)*p;
            res(j) = b(j)*abs(z (j)/u(j));
        end

        if res(j)<tol 
            return
        end;
        vp = vz;
        vz = w/b(j);
    else
        l(j) = u(j-1)/b(j-1);
        u(j) = b(j-1) - l(j)*a(j);
        bnov = -l(j)*b(j);
        z(j) = -l(j)*z(j-1) -l(j-1)*z(j-2);
        pz = p;
        p = 1/u(j)*(vz - a(j)*p);
        %p([j-1 j]) = p([j j-1]);
        x = x + z(j)*p;
        per([j j+1]) = per([j+1 j]);
        res(j) = b(j)*abs(z (j)/u(j));
        premesu = true;
        if res(j)<tol 
            return
        end;
        vp = vz;
        vz = w/b(j);
        pivot = false;
    end
    korak = j;    
end

P = eye(n); P=P(per,:);
x = P*x;

end
