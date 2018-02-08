function [ A] = A(L,B,C,Du,Dv,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = 2*n^2;
A = zeros(N);
h = 1/(n+1);

%odvodi u_ij
odvodUi1 = (Du/L^2)*(1/h^2); %odvod po u_i-1,j in odvod u_i+1,j,u_i,j-1,u_i,j+1
odvodUi2 = (Du/L^2)*(-4/h^2)-(B+1)+2*B; %odvod po u_i,j
odvodUi3 = C^2; %odvod po v_i,j


%odvodi v_ij
odvodVi1 = (Dv/L^2)*(1/h^2); %odvod po v_i-1,j in odvod v_i+1,j,v_i,j-1,v_i,j+1
odvodVi2 = (Dv/L^2)*(-4/h^2)-C^2; %odvod po v_i,j
odvodVi3 = -B; %odvod po u_i,j

odvodi = [odvodUi1,odvodUi2,odvodUi3,odvodVi1,odvodVi2,odvodVi3];

stolpec1 = [odvodUi1;0;odvodUi2;odvodVi3;odvodUi1];
stolpec2 = [odvodVi1;odvodUi3;odvodVi2;0;odvodVi1];
Blok = zeros(2*n);
for i = 3:2*n-2
    if mod(i,2) ~= 0
        Blok(i-2:i+2,i) = stolpec1;
    else
        Blok(i-2:i+2,i) = stolpec2;
    end
end
Blok(1:3,1) = stolpec1(3:5);
Blok(1:4,2) = stolpec2(2:5);
Blok(2*n-3:2*n,2*n-1) = stolpec1(1:4); 
Blok(2*n-2:2*n,2*n) = stolpec2(1:3);         
        
Ar = repmat(Blok, 1, n);                                   % Repeat Matrix
Ac = mat2cell(Ar, size(Blok,1), repmat(size(Blok,2),1,n));    % Create Cell Array Of Orignal Repeated Matrix
A = blkdiag(Ac{:});

poddiagonala = ones(1,N-2*n);
poddiagonala([1:2:N-2*n]) = odvodUi1;
poddiagonala([2:2:N-2*n]) = odvodVi1;
A= A +diag(poddiagonala,2*n)+diag(poddiagonala,-2*n);

end

