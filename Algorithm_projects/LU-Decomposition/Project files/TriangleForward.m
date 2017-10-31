function C=TriangleForward(L,b)
%Forward Substitution

% b in this case is a nx1 vector

s=length(b);
C=zeros(s,1);
C(1)=b(1)/L(1,1);
for j=2:s
    C(j)=(b(j) -sum(L(j,1:j-1)'.*C(1:j-1)))/L(j,j);
end
