


function result2 = logar2(ia,P)

% this function is used to calculate the interest rate over time.

l= 100000;
n= 180;
result2 = ((l*(ia/12)*((1+ia/12)^n)) / (((1+ia/12)^n)-1))-P;



% ANSWER TO QUESTION NUMBER 2: 

% As the value of P increases the maximum interest rate also increases
% approx. by 1% to 2%




end

