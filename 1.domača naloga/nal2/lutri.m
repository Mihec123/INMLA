function [L,U,P,Q] = lucomplete(A) 

% LU razcep matrike A s kompletnim pivotiranjem
%
% pred testi vkljuci: feature accel off

n = size(A,2);
p = 1:n;
q = 1:n;
for j = 1 : n-1 
   % poiscemo pivotni element
   [maxel, indj]= max(abs(A(j:n,j)));
   % zamenjamo ustrezne vrstice in stolpce
   A([j indj],:)=A([indj j],:);
   p([j indj])=p([indj j]);
   for i = j+1 : n
      A(i,j) = A (i,j)/A(j,j);
      for k = j+1 : n
         A(i,k)=A(i,k)-A(i,j)*A(j,k);
      end
   end
end   
U = triu(A);
L = eye(n)+tril(A,-1);
P = eye(n); P=P(p,:);
Q = eye(n); Q=Q(:,q);
end