function [ y ] = meja(funkcija,L)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[v,d] = eigs(funkcija(L),1,'LR');

if real(d) < 0
    y = -1;
else
    y = 1;
end

end

