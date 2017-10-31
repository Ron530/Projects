function [x, iter] = newtons_method(x0, f, df, max_iter, tol)
%% Newton's method for finding a root of a function
% inputs:
% x0         - initial guess 
% f          - handle to function
% df         - handle to function's derivative
% max_iter   - maximum number of iteration
% tol        - tolerance
%
% outputs:
% x          - vector containing all Newton iterates
% iter       - number of iterations (starting at 0)

% preallocate x, the maximum size of x is max_iter
x = zeros(max_iter,1);

x(1) = x0;
iter = 1;

% iteration loop
while ((abs(f(x0)) > tol && iter < max_iter) || iter == 1)
   
   x(iter+1) = newton_step(x(iter), f, df);
   
   % check if two successive iterations are close to each other
   if abs(x(iter) - x(iter+1)) < tol
       break;
   end
   
   iter = iter+1;
end

x = x(1:iter); % extract nonzero entries
iter = iter - 1; % correction for 1 based starting index in Matlab
end

function xnew = newton_step(xold, f, df)
%% take a single Newton step
xnew = xold - f(xold)/df(xold);

end


