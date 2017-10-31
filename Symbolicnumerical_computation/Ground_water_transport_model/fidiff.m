%% Date: October 13, 2015            LAB #2
% Ronney Aovida

% In this assignment i am to 

% 



function fidiff(x)
%fidiff first order finite-difference approximation to d/dx of exp(x)

%Synopsis: fidiff(x)
% 
%Input: x = value at which the derivative is to be evaluated 

% 
%Output: a table and plot to show how the error varies with stepsize
%       
 fp= sin(x);
 h= logspace(-12,0,13)';
 fpfd= (sin(x)- sin(x-h) )./h;
 erel= abs(fpfd - fp)./fp;
 
 fprintf('   h   fp   fpfd   erel\n');
 for k=1:length(h)
     fprintf('%10.1e %9.5f %9.5f %12.2e\n',h(k),fp,fpfd(k),erel(k));
 end
 




end