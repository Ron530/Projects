% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 1 part 1 and 2
function [gc] = yeast(x)
% This is the given function for growth rate of yeast

if nargin <1
x=linspace(-25,25,1000);
end

gc= 2.*x./(4+0.8.*x+x.^2+0.2.*x.^3);

plot(x,gc);








end

