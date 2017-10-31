function [x, u] = finite_difference_sparse(f, a, b, N)
% set up grid, determine spacing
h = (b-a)/(N+1);
x = a:h:b;
% extract interior node, make into column vector
x = x(1:end -1)';
% create right hand side
frhs = f(x)*(h^2);

% create the three diagonals
d = (2+(h^2))*ones(N+1,1);
dp1 = -1*ones(N+1,1);
dm1 = -1*ones(N+1,1);
A=spdiags ([dm1, d, dp1], [-1, 0, 1], N+1, N+1);
A(1,end)=-1;
A(end,1)=-1;
u=A\frhs;



end
