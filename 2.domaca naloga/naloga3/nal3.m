seznam = [10,100];
for i = 1: length(seznam)
    [G,M] = A(seznam(i));
    [v,lv] =eigs(G,1,1);
    plot(M(:,1),M(:,2),'*');
    [i]=max(max(G));
end