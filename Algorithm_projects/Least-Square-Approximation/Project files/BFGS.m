%Ronney Aovida, Lab 8 second/third part of part 2

% NOTE: for the Gradient just look at the gradf function for my solution to
% part 2 of question 2 for lab 8.

function [ xopt ,fopt ,nopt,gradient ] = BFGS( x0 , tol, xx, yy)
x = x0 ; 
n = length(x) ; % problem size
B = eye(n) ; % identity matrix
k = 0 ;
fprintf('  k     xopt    fopt\n');
while (norm(gradf(x,xx,yy)) > tol) % Need to make grad f ˜ 0
df = gradf(x,xx,yy) ; % calculate gradient
s = B\(-df) ; % solve the linear system B s = ?d f ,
% using the \ operator
x = x + s ; % use a stepsize of one .
y = gradf(x,xx,yy)-df ; % calculate gradient change
B = B + ( y*y')/(y'*s)-(B*(s *s')*B)/(s'*B*s ) ; % this is the displacement vector
k = k + 1 ;

fprintf('%3d    %3d    %8.3d\n',k,x,f(x,xx,yy));
%fprintf('            %4d', f(x,xx,yy));
end

gradient= norm(gradf(x,xx,yy));
xopt = x ;
fopt = f(x,xx,yy) ;
nopt = k ;
end
function Z = f(x,xx,yy )
for i =1:length(xx)
Z = (yy(i)-(x(1)*xx(i)+2*exp(x(2)*xx(i))));
end
end
function Z = gradf (x,xx,yy )
Z=[0;0];
for i = 1:length(xx)
sum = [-1*(2*xx(i)*(-yy(i)+2*exp(xx(i)*x(2))+x(1)*xx(i))); -1*(4*exp(xx(i)*x(2)) * xx(i)*(-yy(i)+2*exp(xx(i)*x(2))+x(1)*xx(i)))];
Z= sum+ Z;
end
end
