function [ y ] = meja(funkcija,L)
%funkcija meja vrne 1 ce je najvecja realna vrednost matrike podane s
%funkcijo funkcija in parametrom L vecja kot 0. V nasprotnem primeru vrne
%meja -1.

[v,d] = eigs(funkcija(L),1,'LR');

if real(d) < 0
    y = -1;
else
    y = 1;
end

end

