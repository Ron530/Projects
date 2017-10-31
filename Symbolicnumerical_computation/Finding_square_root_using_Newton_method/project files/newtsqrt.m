%% FUNCTION FOR HOMEWORK 2

function [r]= newtsqrt(x,delta,maxit )
%Summary: the function newtsqrt will take in 3 user inputs x,delta and maxit and run
%it through a loop that calculates the square root of x according to
%newtons equation.

% synopsis: r=newtsqrt(x,delta,maxit)

%Input: x is the value being evaluated, delta is the tolerance used to
%calculate the root and maxit is the maximum iterations to run the code
%through.

%Output: r is the value of x squared depending on other variables such as
%delta and maxit.

% these if statements mak sure to set a default value for maxit/delta
% incase the user does  not provide an value for them.
if nargin< 3
   maxit= 25;
end
if nargin< 2
   delta= 5.0e-6;
end
if nargin <1
    return
end


% if x is negative it will display an error message and go no further from
% this part of the program.
if x<0 
    disp('this value is invalid, try entering a value that is not negative');
    return
end
it=0;
r=x;
rold=2*r;

%this while loop will run if the absolute value of rold-r is greater than
%delta and if the iterations is less than the max input. the loop will then
%calculate the square root of x according to the user inputs provided.
while abs(rold-r) > delta && it<maxit
    rold=r;
    r= 0.5*(rold + x/rold);
    it= it + 1;
end


if r~= sqrt(x)
    disp('try adjusting the tolerance to a lower value or the iteration to a higher value ');
end

end

