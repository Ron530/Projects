% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 2 part 3


function [ xopt,fopt,nopt,grad] = steepDescent ( x0 , tol)
x = x0 ;
k = 0 ;
while ( norm(gradf(x)) > tol && k<100) 
s = -gradf(x) ; 
falpha = @(alpha) f( x + alpha*s) ;
alpha = fminsearch(falpha , 1) ; 
x = x + alpha*s ; 
k = k + 1 ; 
s


end

xopt = x ; fopt = f(x) ; nopt = k ;grad=gradf(x);
end
function Z = f(x)
Z=(1-x(1)).^2 + 100.*(x(2)-x(1).^2).^2;
end


function Z = gradf(x) 
Z = [-400.*x(1).*(-x(1).^2+x(2))+2.*x(1)-2; -200.*x(1).^2+200.*x(2) ];
end

