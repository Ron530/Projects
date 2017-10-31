function [ xst,erra,iter]  = bisection2(func,P,a,b,tol)

% This function is the same as bisection.m, however this time it is to be
% used with the function logar2, this function requires an additional input
% in order to compute.



%this if statement will test to see if the values from the lower and upper 
%bounds into the given function are
%above or below 0 and will not run if its false.
if func(a,P)*func(b,P)<0

% if the value of the higher bound is less than 0 then a is set equal to b
% and b is set equal to a's previous value
    if func(a,P)<0
       temp=a;
       a=b;
       b=temp;
    end

end

xst= (a+b)/2;



erra= tol+1.0;
iter=0;
% this while loop will continue to run until the error is less than the
% tolerance input
while erra> tol
  
    
    xstold= xst;
    
    iter= iter+1;
% this if statement sets the value of b to (a+b)/2 if the functions output 
%is negative   
if func(xst,P)<0
    b= xst;
    xst= (a+b)/2;
% this if statement sets the value of a to (a+b)/2 if the functions output 
%is negative
elseif func(xst,P)>0
    a=xst;
    xst= (a+b)/2;
else
    break;
    
end

% this will calculate the error margin once all the values are found from
% the while loop.
erra = abs(((xst-xstold)/xst)*100); 
end
    
    

end


