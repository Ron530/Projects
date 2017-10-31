% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 1 part 3
function [gc] = yeast2(x)
%This is the given function for yeasts derivative form for the bisection
%method to determine the max of the nonlinear equation

if nargin <1
x=linspace(-25,25,1000);
end

gc= (-20.*x.^3-50.*x.^2+200)./(x.^3+5.*x.^2+4.*x+20).^2;

plot(x,gc);








end
