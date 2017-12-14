function [L,U,P] = ludelni(A) 

% LU razcep matrike A z delnim pivotiranjem
n = size(A,2);
p = 1:n;
for j = 1 : n-1 
   % poiscemo pivotni element
   [maxel, ind]= max(abs(A(j:n,j)));
   % zamenjamo ustrezne vrstice in stolpce
   ind = ind+j-1 ;
   A([j ind],:)=A([ind j],:);
   p([j ind])=p([ind j]);
   for i = j+1 : min(j+2,n)
      A(i,j) = A (i,j)/A(j,j);
      for k = j+1 : min(j+2,n)
         A(i,k)=A(i,k)-A(i,j)*A(j,k);
      end
   end
end   
U = triu(A);
L = eye(n)+tril(A,-1);
P = eye(n); P=P(p,:);
end