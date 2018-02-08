function [G] = lik1(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

G = zeros(3*n-2);
st=1;
for i = 1:n
    for j = 2:n      
        if j<i
            G(i,n+1-j) = st;
            st = st+1;
        end
    end
end

for i = 2:n
    for j = 1:n      
        if i<j
            G(n+i-1,j) = st;
            st = st+1;
        end
    end
end

for i = 2:n-1
    for j = 1:2*n-3      
        G(n+i-1,n+j) = st;
        st = st+1;
    end
end


for i = 1:n
    for j = 3:n
        if i<j-1
            G(2*n+i-2,3*n-j) = st;
            st = st+1;
        end
    end
end



end

