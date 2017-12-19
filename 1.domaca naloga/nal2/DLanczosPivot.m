function [x,res] = DLanczosPivot(A,b,x0,tol,maxit)

% [x,res] = DLanczosPivot(A,b,x0,tol,maxit) uporabi metodo D-Lanczos
% z delnim pivotiranjem za resevanje sistema Ax=b. Matrika A mora
% biti simetricna. Pri tem pazi, da ne shranjuje vseh vektorjev,
% temvec le zadnja dva
%
% Kot resitev vrne 
% x : vektor x_k iz zadnjega koraka
% res : vektor norm ostankov ||b-Ax_j|| za j=1,...,k  
%
% Algoritem se konca, ko je norma ostanka pod tol ali ko presežemo 
% maksimalno podano število korakov 


r0 = b - A*x0;
vz = r0/norm(r0);  % vz = zadnji vektor iz matrike V
x = x0;

pivot = 0;
popravi=false;
d = zeros(maxit,1);

% korak j=1 naredimo loceno, ker v Matlabu nimamo indeksov 0
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
starib=b(1);

% zanka za korake j>1
for j = 2:maxit
    w = A*vz - starib*vp;
    a(j) = vz'*w;
    w = w - a(j)*vz;
    b(j) = norm(w);
    if u(j-1) < starib
        pivot = pivot +1;
    else
        pivot = 0;
    end
    
    if pivot == 0
        l(j) = starib/u(j-1);
        u(j) = a(j) - l(j)*b(j-1);
        z(j) = -l(j).*z(j-1);
        temppz = p;
        popravi = false;
        if j>2
            if d(j-2) ~=0
                popravi=true;
                pzz=pz;
            end
            p = 1/u(j)*(vz - b(j-1)*p - d(j-2)*pz);
        else
            p = 1/u(j)*(vz - b(j-1)*p);
        end
        pz = temppz;
        res(j) = b(j)*abs(z (j)/u(j));
        if res(j)<tol 
            return
        end;
        vp = vz;
        vz = w/b(j);
        starib = b(j);
    else
        display('pivotiranje')
        tempu = u(j-1);
        tempb = b(j-1);  
        b(j-1) = a(j);
        d(j-1)=b(j);
        d(j) = 0;
        l(j) = tempu/starib;
        u(j) = tempb - l(j)*b(j-1);
        
        b(j) = - l(j)*b(j);
        z(j-1) = 0;
        if j > 2                
            z(j) = -sum(l(max(j-pivot,2):j).*z(max(j-1-pivot,1):j-1));
            if popravi && j>3
                popravi=0;
                p = 1/starib*(vp - b(j-2)*pz-d(j-3)*pzz);
                pzz=0;
            else
                p = 1/starib*(vp - b(j-2)*pz);
            end
            pztemp = p;
            p = 1/u(j)*(vz - b(j-1)*p - d(j-2)*pz);
            pz = pztemp;   
        else
            z(j) = -l(j).*z(j-1);
            p = 1/starib*(vp);
            pztemp = p;
            p = 1/u(j)*(vz - b(j-1)*p);
            pz = pztemp;
        end   
        starib = d(j-1);
        vp = vz;
        vz = w/starib;
    end
    if j >2
        x = x + z(j-1)*pz;
    end
end
if length(z) > 1
    x = x + z(end)*p;
end
end