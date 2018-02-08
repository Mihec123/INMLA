function A=loadStanfordMatrix;

load stanford-web.dat;
A=spconvert(stanford_web);
% make the matrix square
n=max(size(A));
A(n,n)=0;
% take the transpose A^T (which is what we multiply by)
A=A';