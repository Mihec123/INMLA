function [A] = matrika(m)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

