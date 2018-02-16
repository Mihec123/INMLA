function [A] = matrika(m)
%Generiramo matriko kjer so elementi po vrsti v stolpcu oblike (0,0),....
%(0,m-1),(1,0),....,(1,m-2),....,(i,j) kjer velja i+j<m
stevec = 1;
A = zeros(0.5*m*(m+1),2);
for i = 0:m-1
j= 0;
while i+j <m
A(stevec,1) = i;
A(stevec,2) = j;
stevec = stevec +1;
j = j+1;
end
end

end

