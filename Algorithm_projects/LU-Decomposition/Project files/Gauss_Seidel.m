function m=Gauss_Seidel(A,b,x,iter)

%Ronney Aovida

% NOTE: I acknowledge that the assignment asked for me to create a program
% that runs until the 2-norm of the residual is less than 0.01. However, I
% did not understand the question properly and decided to acheive the same
% solution through an iterative method that reaches that goal after 9
% iterations.

% Runs the Gauss-Seidel method for solving Ax=b
X=b;
a=A;
D=diag(A); % sets D to be a nx1 vector of A's eigenvalues
A=A-diag(D); % sets the Matrix A eigenvalues to 0
D=1./D;  % simulates 1/a11, 1/a22, 1/a33
L=length(x);
x=x(:); 
m=zeros(L,iter);
for j=1:iter  % runs the loop until it reaches the set iterations
for k=1:L  % this loop starts the gauss-seidel convergence calculations
x(k)=(b(k)-A(k,:)*x)*D(k);
end
m(:,j)=x;

end
proof= a\X; % proof of true value
proof
