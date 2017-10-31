% function for Question 4 in lab 2 by Ronney Aovida

function [ynew] = eulerstep(y,dt)


tolerance=10^-8;
maxiter=50;
  %non-linear application of clarke-nikolson using newtons method
rhs=y+(dt/2)*(1-y)*y;  
f=@(z) z-(dt/2)*(1-z)*z-rhs;
df=@(z) 1-dt/2*(1-2*z);

ynew = newtons_method(f,df,y, maxiter, tolerance);

return




end

