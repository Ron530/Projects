%% LAB 2 for ISC 4220 ALGORITHMS 1

% RONNEY AOVIDA

% QUESTION 2: 

%Using intrinsic Matlab functions to solve the linear system, 
%experiment with various
%values of  especially those near mach. 

%For each value you try estimate the condition number of the matrix (again use Matlab
%to estimate it), and the relative error in each component of the solution. 

% How does the accuracy attained for each component compare with expectations based
%on the condition number of the matrix?

format long;

A= [1 1+sqrt(eps); 1-sqrt(eps) 1]
B= [1 sqrt(eps)]'

A2= [1 1+0.00001; 1-.00001 1]
B2= [1 0.00001]'

A3= [1 1+0.00000001; 1-.00000001 1]
B3= [1 0.00000001]'

X = linsolve(A,B)
X2= linsolve(A2,B2)
X3= linsolve(A3,B3)

C= cond(X)
C2= cond(X2)
C3= cond(X3)

relerror= (X-C)/X
relerror2= (X2-C2)/X2
relerror3= (X3-C3)/X3

%{
    The Relative error in relation to the condition number acquired from...
    each component proved to be much more accurate than i would have...
    presumed. although I presume this occured due to the condition number...
    not being a float but rather the integer one. This in result throws...
    off the accuracy by quite a bit. The farther away I got from the true...
    eps value the larger relative error i acquired.
%}


