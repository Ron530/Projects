function [x, u] = finite_difference_full(f, a, b, ua, ub, N)

h = (b-a)/(N+1);
x = a:h:b;

% extract interior node, make into column vector
x = x(2:end-1)';

% create right hand side
frhs = f(x');

% apply boundary conditions
frhs(1) = frhs(1) + ua/h^2;
frhs(end) = frhs(end) + ub/h^2;

% preallocate full array for A
A = zeros(N,N);

% loop over rows of A
for i = 1:N
    
% loop over columns of A
for j = 1:N
if (i == j)
A(i,j) = 2;
else
if abs(i-j)==1
A(i,j) = -1;
end
end
end
end
A = A/h^2;

% solve system
u = A\frhs;


end

