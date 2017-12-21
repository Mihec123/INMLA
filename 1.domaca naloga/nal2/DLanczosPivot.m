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

maxit=min(maxit,length(b));

r0 = b - A*x0;
vz = r0/norm(r0);  % vz = zadnji vektor iz matrike V
x = x0;

pivot = 0;
d = zeros(maxit,1);

% korak j=1 naredimo loceno, ker v Matlabu nimamo indeksov 0
w = A*vz;
a(1) = vz'*w;
w = w - a(1)*vz;
b(1) = norm(w);
u(1) = a(1);
z(1) = norm(r0);

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

    if abs(u(j-1)) < abs(starib)
        pivot = pivot +1;
    else
        pivot = 0;
    end
    
    if pivot == 0
        l(j) = starib/u(j-1);
        u(j) = a(j) - l(j)*b(j-1);
        z(j) = -l(j).*z(j-1);
        res(j-1) = starib*abs(z(j-1)/u(j-1));
        starib = b(j);
        if res(j-1)<tol 
            return
        end;
    else
        display('pivotiranje')
        tempu = u(j-1);
        tempb = b(j-1);  
        b(j-1) = a(j);
        d(j-1)=b(j);
        d(j) = 0;
        l(j) = tempu/starib;
        u(j) = tempb - l(j)*a(j);
        u(j-1) = starib;     
        b(j) = - l(j)*b(j);
        z(j-1) = 0;
        if j > 2
            z(j) = -sum(l(max(j-pivot,2):j).*z(max(j-1-pivot,1):j-1));
        else        
            z(j) = norm(r0);
        end
        res(j-1) = starib*abs(z(j-1)/u(j-1));
        starib = d(j-1);
    end
    
    if j >3
        tempp=p;
        p = 1/u(j-1)*(vp - b(j-2)*p-d(j-3)*pz);
        pz=tempp;
        x = x + z(j-1)*p;
    elseif j > 2
        tempp=p;
        p = 1/u(j-1)*(vp - b(j-2)*p);
        pz=tempp;
        x = x + z(j-1)*p;
    else
        p = 1/u(1)*vp;
        x = x + z(1)*p;
        pz=p;
    end
    vp = vz;
    vz = w/starib;
    
end
if length(z) > 1
    p = 1/u(j)*(vp - b(j-1)*p-d(j-2)*pz);
    x = x + z(end)*p;
end
end