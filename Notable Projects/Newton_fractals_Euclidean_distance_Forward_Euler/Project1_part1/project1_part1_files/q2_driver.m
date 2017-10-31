%% Creates a Newton fractal for the complex valued function z = z^3 - 1

% add src directory to path, this directory contains newtons_method.m
path(path, '../src'); 

% set Newton's method parameters
max_iter = 200;
tol = 1e-12;

% create grid of points on box [-2,2]x[-2,2]
N = 500;
x = linspace(-2,2,N);
y = linspace(-2,2,N);

[X,Y] = meshgrid(x,y);

% preallocate array for roots
roots = zeros(size(X));

% define function and its derivative
f = @(z) z^3 -1;
fp = @(z) 3*z^2;

% loop over all points in mesh, save root that comes from starting at that 
% mesh point
for n = 1:N
    for m = 1:N        
        [zstar, ~] = newtons_method(X(n,m) + 1i*Y(n,m), f, fp, max_iter, tol);
        
        roots(n,m) = zstar(end);        
    end
end

% do a surface plot of results, view from above
figure();
surf(X, Y, angle(roots));
view(2);
shading interp
axis equal
axis([-2 2 -2 2]);

xlabel('x');
ylabel('y');
title('Newton fractal for $f(z) = z^3 -1$', 'interpreter', 'latex');