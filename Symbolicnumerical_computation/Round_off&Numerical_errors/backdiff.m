%% Date: October 21, 2015            LAB #3
% Ronney Aovida

% In this assignment i am to use the taylor series to analytically derive
% the order of truncation error of the backward difference, write MATLAB
% function to eveluate the abckward difference for x=1 and determine the
% error by comparing with built-in function cos(x) and to plot the
% magnitude of the error.




function backdiff(x)
%backdiff first order finite-difference approximation to d/dx of exp(x)

%Synopsis: backdiff(x)
% 
%Input: x = value at which the derivative is to be evaluated 

% 
%Output: a table and plot to show how the error varies with stepsize
%
% default value if no input is put in
if nargin<1
    x=1;
end

% initializing the variables where 
%fp= exact value of fprime
%h= column vector of stepsize
% fpfd = vectorized calculation of fd approximation

 fp= cos(x);
 h= logspace(-12,0,13)';
 fpfd= (sin(x)- sin(x-h) )./h;
 relerror= abs(fpfd - fp)./fp;
 
 % prints to output
  fprintf('   h         fp         fpfd         relerror\n');
 for k=1:length(h)
     fprintf('%10.1e %9.5f %9.5f %12.2e\n',h(k),fp,fpfd(k),relerror(k));
 end
 % prints out a graph representing the relative error
 loglog(h,relerror,'+')
 xlabel('stepsize, h'); ylabel('relative error');
 
 % this for loop is used to find alpha using the function of h at
 % 1/2,1/4,1/8...
 for n= [2 4 8 16 32 64 128 256]
     
 relold= relerror;
 hhold= h;
 fp= cos(x);
 h= 1/n;
 fpfd= (sin(x)- sin(x-h) )./h;
 relerror= abs(fpfd - fp)./fp;
 
 if n>2
 fprintf(' %8.5f\n', log(relerror/relold)/log(h/hhold));
 else 
     fprintf('\n');
 end

 % according to the ouput the derived order of truncation error is
 % approaching 1 as n increases or h decreases, hence proving that is is
 % correct.
 
 end


 

 
 




end