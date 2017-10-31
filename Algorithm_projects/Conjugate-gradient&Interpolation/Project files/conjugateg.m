% Ronney Aovida, Question 1 Lab 5
function [ xopt , resid ] = conjugateg (A, b , x0 , tol )
x = x0 ;
k = 0 ;
resid = b-A*x ;
s = resid ;
fprintf('iter: %4d resid: %e \n ',k, norm(resid));
while ( norm(resid) > tol )
alpha = resid' * resid / (s' *A*s ) ; 
xnew = x + alpha*s ; 
resid_new = b-A*xnew ; 
beta = resid_new' * resid_new / (resid' * resid ) ; 
s = resid_new + beta *s ; 
resid = resid_new ;
x = xnew ;
k = k + 1 ;
fprintf ( ' iter: %4d resid: %e\n ' ,k , norm(resid_new ) ) ;
end
xopt = x ;
end