function C=Backward(U,b)
%Backward Substitution

% b in this case is a nx1 vector

s=length(b);
C=zeros(s,1);
C(s)=b(s)/U(s,s);
for j=(s-1):-1:1
    C(j)=(b(j) -sum(U(j,j+1:end)'.*C(j+1:end)))/U(j,j);
end

