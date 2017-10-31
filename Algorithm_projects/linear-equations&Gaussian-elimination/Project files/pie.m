function [x] = pie(func,a,b,n)
% This function will take in the taylor function and caluclate a close
% approximation to pi



x= (16*func(n,a))-(4*(func(n,b)));

end

