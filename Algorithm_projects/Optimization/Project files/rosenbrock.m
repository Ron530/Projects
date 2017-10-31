% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 2 part 1
function [x1x2] = rosenbrock(x,x1)

% This plots the function using the meshc function

if nargin<1
x=linspace(-2,2,100);
x1=linspace(-1,3,100);
end

x1x2=zeros(100);

for i= 1:length(x)
    X=x(i);
    for k= 1:length(x1)
        X1=x1(k);
        x1x2(i,k)= (1-X).^2 + 100.*(X1-X.^2).^2;
        
    end
end

meshc(x,x1,x1x2);

end