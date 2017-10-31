function [x,i] = gaussSeidel2(A,b,x0,tol)
x2 = x0;
count = 0;
D = diag(diag(A));
U = triu(A-D);
disp(U);
L = tril(A-D);
disp(L);
C = diag(diag(A));
disp(C);
Inv = inv(C+D);
error = inf;
      while error>tol
          x1 = x2;
          x2 = Inv*(b-(U*x1));
          error = max(abs(x2-x1)/abs(x1));
          count = count + 1;
      end
x = x2;
i = count;
end