% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 2 part 4

function [ xopt,fopt,nopt,grad] = newnewton( x0 , tol)

 
% INPUT: newnewton([-1;1],0.01)


x = x0 ;
k = 0 ;
while ( norm(gradf(x)) > tol && k<100) 
s = heiss(x)\-gradf(x) ; 
falpha = @(alpha) f( x + alpha*s) ;
alpha = fminsearch(falpha , 0.1) ; 
x = x + alpha*s ; 
k = k + 1 ; 
s


end
xopt = x ; fopt = f(x) ; nopt = k ;grad=gradf(x);
end
function Z = f(x)
Z=(1-x(1)).^2 + 100.*(x(2)-x(1).^2).^2;
end

function Z= heiss(x)

Z=zeros(2);


xx= 2.*(600.*x(1).^2-200.*x(2)+1);

yy= 200;

xy= -400.*x(1);

Z(1)= xx;
Z(2)= xy;
Z(3)=xy;
Z(4)=yy;



end

function Z = gradf(x) 
Z = [-400.*x(1).*(-x(1).^2+x(2))+2.*x(1)-2; -200.*x(1).^2+200.*x(2) ] ;
end

