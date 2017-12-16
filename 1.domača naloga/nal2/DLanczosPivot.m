function [x,res] = DLanczosPivot(A,b,x0,tol,maxit)

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

pivot = 0;
prejsni = 0;
d = zeros(maxit,1);

% korak j=1 naredimo lo?eno, ker v Matlabu nimamo indeksov 0
w = A*vz;
a(1) = vz'*w;
w = w - a(1)*vz;
b(1) = norm(w);
u(1) = a(1);
z(1) = norm(r0);
p = 1/u(1)*vz; % p = zadnji vektor iz matrike p
x = x + z(1)*p;
res(1) = b(1)*abs(z (1)/u(1));
if res(1)<tol 
    return
end;
vp = vz; % vp = predzadnji vektor iz matrike V
vz = w/b(1);

% zanka za korake j>1
for j = 2:maxit
    if pivot ~=0
        w = A*vz - d(j-1)*vp;
    else
        w = A*vz - b(j-1)*vp;
    end
    a(j) = vz'*w;
    w = w - a(j)*vz;
    b(j) = norm(w);
    if u(j-1) < b(j-1)
        pivot = pivot +1;
    else
        if pivot~=0
            prejsni = pivot+1;
        else
            prejsni = pivot;
        end
        pivot = 0;
    end
    
    if pivot == 0
        if prejsni ~= 0
            l(j) = spodnjib/u(j-1);
            prejsni = 0;
        else
            l(j) = b(j-1)/u(j-1);
        end
        u(j) = a(j) - l(j)*b(j-1);
        z(j) = -sum(l(j-prejsni:j).*z(j-1-prejsni:j-1));
        temppz = p;
        if j>2
            p = 1/u(j)*(vz - b(j-1)*p - d(j-2)*pz);
        else
            p = 1/u(j)*(vz - b(j-1)*p);
        end
        pz = temppz;
        %x = x + z(j)*p;
        res(j) = b(j)*abs(z (j)/u(j));
        if res(j)<tol 
            return
        end;
        vp = vz;
        vz = w/b(j);
    else
        display('pivotiranje')
        tempu = u(j-1);
        tempb = b(j-1);
        u(j-1) = b(j-1);
        b(j-1) = a(j);
        d(j) = b(j);
        l(j) = tempu/u(j-1);
        u(j) = tempb - l(j)*b(j-1);
        spodnjib = b(j);
        b(j) = d(j-1) - l(j)*d(j);
        d(j-1) = d(j);
        z(j-1) = 0;
        z(j) = -sum(l(j-pivot:j).*z(j-1-pivot:j-1));
        p = 1/u(j-1)*(vp - b(j-2)*pz);
        pztemp = p;
        p = 1/u(j)*(vz - b(j-1)*p - d(j-2)*pz);
        pz = pztemp;
        vp = vz;
        vz = w/d(j);
    end
    if j >2
        x = x + z(j-1)*pz;
    end
end
if length(z) > 1
    x = x + z(end)*p;
end
end