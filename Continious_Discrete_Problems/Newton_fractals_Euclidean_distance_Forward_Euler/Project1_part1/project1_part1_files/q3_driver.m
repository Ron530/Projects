%% Uses Newton's method to find the close point to a helix, performs 
% tests of Newton's method

% add src directory to path, this directory contains newtons_method.m
path(path, '../src'); 

% define point (x,y,z), this needs to be done before we define our function
% handles, since we will use these constants in their definition
x = 2;
y = 1;
z = 2;

% we are trying to minimize the distance function; to do this we wish to 
% find a root of the derivative of the distance function. Newton's method
% requires us to pass this function (the derivative of distance) and its
% derivative (the second derivative of distance)

dp = @(t) -sin(t)*(cos(t) - x) + cos(t)*(sin(t) - y) + t - z;
ddp = @(t) -cos(t)*(cos(t) - x) + sin(t)^2 -sin(t)*(sin(t) - y) + ...
    cos(t)^2 + 1; % this can be simplified somewhat if desired

% set Newton's method parameters
t0 = 0;
tol = 1e-5;
max_iter = 1000;

%% part d - run Newton's method to find root starting from t0 = 0
[T, iter] = newtons_method(t0, dp, ddp, max_iter, tol);

% plot iterates
figure();
plot(0:iter, T);
xlabel('iteration #');
ylabel('t_k');
title('Newton iterates');

%% part e 

% generate starting points in [-4,4]
t0 = linspace(-4,4);

% preallocate array for iteration counts
iter = zeros(size(t0));

% loop over starting points
for i = 1:length(t0)
    [~,iter(i)] = newtons_method(t0(i), dp, ddp, max_iter, tol);
end

% plot iterations number vs starting point
figure
plot(t0, iter);

xlabel('t_0');
ylabel('iterations');
title('Attraction regions');

% from this graph, we can see that everything in the interval [-3, 2.4]
% (approximately) converges in less than 1000 iterations, while outside 
% that region the convergence is not guaranteed

            
            
