%% Date: October 1, 2015            HW#2
% Ronney Aovida

% In this assignment i am to write a function called newtsqrt. this
% function will compute the square root of x when input through iteration.
% but the main procedure is to debugg this function to make sure any errors
% found are corrected.

%% Questions 1 & 2

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

%% QUESTION 3 & 4

%{
newtsqrt(4)

ans =

    2.0000

newtsqrt(400)

ans =

    20

newtsqrt(4e-16)


ans =

   4.0000e-16

newtsqrt(4e-16,5e-9)


ans =

   4.0000e-16

newtsqrt(4e-16,5e-12)


ans =

   4.0000e-16

newtsqrt(4e-16,5e-16)


ans =

   4.0000e-16

newtsqrt(4e-16,5e-24)


ans =

   3.4147e-08

newtsqrt(4e-16,5e-24,30)

ans =

   2.0000e-08

% I beleive the problem is being caused by x being such a low number that
when it is run through the loop in the formula it is not being run the
correct amount of times. In the while loop it is only being run as long as
r-rold is greater than the tolerance and as long as the iterations are run
enough times to approach the limit. Newtons equation is a formula where it
runs x multiple tiems throught he same formula multiple times attaining
different results as r and rold become different values every run, the
solution is found as the solutions approach a certain number and once that
number no longer changes by much more than 0.00001 or so. By changing the
tolerance and iterations to the correct values then the loop will run the
correct amount of times in order to acheive its most accurate value.
%}

%% QUESTION 5 
%{
%this will check to see if the value is correct and if not will reccomend
% how to append the problem.


if r~= sqrt(x)
    disp('try adjusting the tolerance to a lower value or the iteration to a higher value ');
end
%}

%% QUESTION 6
%{

%this loop will run newtons method for finding the root of x but as a for
loops rather than a while.

for it = 0:maxit-1 
if abs(rold-r) <= delta 
break
end 
rold=r; 
r= 0.5*(rold + x/rold); 
end
%}