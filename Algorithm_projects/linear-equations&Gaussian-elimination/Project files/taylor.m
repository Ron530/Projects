function [pi] = taylor(n,x)
%This function will take in two inputs that will simulate the taylor series
%of arctan and output one variable.
newpie=0;
i=0;
count=0;

% This while loop will run the arctan taylor series until its iterations
% are equal to the size of n
while n>count
count= count +1;
i= i+1;
pie=( (-1)^(i-1))* (x^(2*i-1)) / (2*i-1);

newpie= newpie+ pie;



end

pi=newpie;
