a=0;
b=1;
N=[2^3,2^4,2^5,2^6,2^7,2^8];
f=@(x) (4*(pi^2)+1)*sin(2*pi*x);
exact=@(x) sin(2*pi*x);

error=zeros(length(N),1);


for i=1:length(N)


[x,u]=finite_difference_sparse(f, a, b,N(i));
error(i)=norm(u-exact(x))/sqrt(N(i));

end

loglog(N,error,'r')

% This converges at order 2. (slope is 2)