D=diag(A);
A=A-diag(D);
D=1./D; %We need the inverses
n=length(x);
x=x(:); %Make sure x is a column vector
y=zeros(n,NumIters);
for j=1:NumIters
for k=1:n
x(k)=(b(k)-A(k,:)*x)*D(k);
end
y(:,j)=x;
end
