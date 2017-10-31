%% Ronney Aovida Novemeber 17, 2015  Homework 4


% Question 4 is partially wrong since it does not provide the correct
% answer, i would like to review with you what i did wrong once this is
% graded.

%% question 1

% The error is occuring due to an error in brackplot not fx ( it is not a 
%bug,it just needs a better search interval). what needs to
% be changed in the boolean statement sign(f(k))~=sign(f(k+1)). It is
% because of this that only 2 of the 4 brackets are being found since it
% will only mark a bracket at the point of the sign changes from positive to
% negative from one iteration to the next. from 0 to 2 fx is always
% negative so the boolean statement will ignore it although it is still
% considered a root since it is close to 0. My proof of this boolean
% statement being the problem is:  to run the program checking that if
% there is a root near 0 but not past it as well it will still mark it by
% adding the following to the if statement:

%    proof=  sin((f(k))^2)+(f(k)^2)-(2*f(k))-0.09;
%   if  sign(f(k))~=sign(f(k+1))|| proof < .3 && proof > 0
 
 brackplot('fx',-1,3)
 
 
 %% question 2
 
 % the following code verifies that g'(x)<1, g(x) is between a and b and
 % for all x it is larger or equal to a and smaller or equal to b.
 
 % According to 6.2.1 if -1 < g'(x)<0, the iterations oscillate while
 % converging and if 0 < g'(x) < 1, the iterations converge monotonically.
 % The results of the below code show that it does not oscillate, hence
 % proving that 0 < g'(x) < 1.
 
 old= 1;
 for i=1:10
     old= gx;
     gx= ((old+12)/12)^3;
     
     disp(gx);
     
 end
 
 
%% question 3
% The estimated root after 5 iterations at 5 radians is -743.61972519304754
newton(5,5)
% At 9 iterations of initial guess of pi f(x) = 8.984e-09
newton(pi,9)
% At initial guess of 3*pi/2 it Diverges.
newton(3*pi/2)
% At 5 iterations of initial guess of 2*pi f(x)= 2.847e-10 
newton(2*pi,5)
% The estimated root after 5 iterations at 5 radians is -743.61972519304754
newton2('fx2',5)
% At 9 iterations of initial guess of pi f(x) = 8.984e-09
newton2('fx2',pi)
% At initial guess of 3*pi/2 it diverges.
newton2('fx2',3*pi/2)
% At 5 iterations of initial guess of 2*pi f(x)= 2.847e-10 
newton2('fx2',2*pi)

%% question 4

% After 10 iterations are performed x converges on to 3.521379706805.

% However my program does not show this result due to an error i could not
% find..

secant('fx3',10)




