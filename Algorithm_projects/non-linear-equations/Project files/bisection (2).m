%% Date: January 21, 2016            LAB #1
% Ronney Aovida

% In this assignment i am to create a function that simulates the bisection
% method that finds a value very close to the absolute roots of a
% function.


function [ xst,erra,iter]  = bisection(func,a,b,tol)





%this if statement will test to see if the values from the lower and upper 
%bounds into the given function are
%above or below 0 and will not run if its false.
if func(a)*func(b)<0

% if the value of the higher bound is less than 0 then a is set equal to b
% and b is set equal to a's previous value
    if func(a)<0
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
if func(xst)<0
    b= xst;
    xst= (a+b)/2;
% this if statement sets the value of a to (a+b)/2 if the functions output 
%is negative
elseif func(xst)>0
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
