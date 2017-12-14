function [x] = luDelniTri(A,b) 

% LU razcep tridiagonalne matrike A z delnim pivotiranjem
n = size(A,2);
pivotiranje = false;
for j = 1 : n-1 
   % poiscemo pivotni element
   if A(j,j) < A(min(j+1,n),j)
       pivotiranje = true;
   end
   if pivotiranje
       %zamenjamo ustrezni vrstici
       A([j j+1],:)=A([j+1 j],:);
       b([j j+1]) = b([j+1 j]);
       for i = j+1 : min(j+2,n)
          A(i,j) = A (i,j)/A(j,j);
          for k = j+1 : min(j+2,n)
             A(i,k)=A(i,k)-A(i,j)*A(j,k);
          end
       end
   else
      for i = j+1 : min(j+2,n)
          A(i,j) = A (i,j)/A(j,j);
          for k = j+1 : min(j+2,n)
             A(i,k)=A(i,k)-A(i,j)*A(j,k);
          end
      end
       
   end
end   
U = triu(A);
L = eye(n)+tril(A,-1);
y = L\b;
x = U\y;
end