function [x] =newton(x0,n)
% newton    newton method to find a root of the scalar equation f(x) = 0
%
% Synopsis:  x= newton(x0,n)
%            x= newton(x0,n)
%           
%
% Input:  x0    = initial guess
%         n     = max iterations
%         
%
%  Output:  x = the root of the function


if nargin<2, n=6; end
x=x0;

fprintf('  k        f(x)         dfdx         x(k+1)\n');
for k=1:n
    f= cos(x)-x;
    dfdx= -sin(x)-1;
    x= x- f/dfdx;
    fprintf('%3d %12.3e %12.3e %18.15f\n',k-1,f,dfdx,x);

   
       
    
end
 
