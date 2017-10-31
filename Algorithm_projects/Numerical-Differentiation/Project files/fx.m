%work done by: Ronney Aovida
%Homework 2. Part of Question 2
% fx in question two is correlated to this function

function [z] = fx(x)


    if  x==0
       x=1;
    end

    z= sqrt(x)*log10(x);
end
