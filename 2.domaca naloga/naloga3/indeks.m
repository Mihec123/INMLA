function [i,j] = indeks(dol,m)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

j = max(1,floor(dol/m));
i = dol-j*m;
j = j+1;
if i == 0
    i = m;
    j = j-1;
end



end

