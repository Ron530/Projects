%% Performs convergences studies for forward Euler

% add src directory to path, this directory contains forward_euler.m
path(path, '../src'); 


% create a vector of time steps
dt = 1./[4, 8, 16, 32, 64];

% define intitial and final times
t0 = 0;
tf = 1;

%% part a

% define f(y,t), exact solution
f = @(y,t) t^3*y;
y_exact = @(t) 0.5*exp(0.25*t^4);

% define intial condition
y0 = 0.5;

% preallocate vector for approximation errors
e = zeros(size(dt));

% loop over time steps, calculate error for each time step
for i = 1:length(dt)
    Y = forward_euler(y0, t0, tf, dt(i), f);
    e(i) = abs(Y(end) - y_exact(tf));
end

% plot error vs. dt on log-log plot, forward Euler is first order accurate
% meaning that the slope of the error vs. dt should be 1 on a log-log plot.
% Note that this means that halving dt reduces the error by a factor of 2.
figure();
loglog(dt, e);
hold on
loglog([dt(1), dt(3)], [0.5, 0.5/4], 'r'); % becomes line of slope 1 in log-log

title('Error in forward Euler approximation (a)');
xlabel('dt');
ylabel('error');

legend('forward Euler', 'line of slope 1');

%% part b

% split second order IVP into two first order IVPs:
% y' = w
% w' = -2y - 3w
% y(0) = 3
% w(0) = 4

% let u = [y;w] = [y;y']
% define f(u,t) and exact solution
f = @(u,t) [u(2); -2*u(1) - 3*u(2)];
u_exact = @(t) [10*exp(-t) - 7*exp(-2*t); -10*exp(-t) + 14*exp(-2*t)];

% define initial condition
u0 = [3;4];

% preallocate vector for approximation errors
e = zeros(length(u0),length(dt));

for i = 1:length(dt)
    U = forward_euler(u0, t0, tf, dt(i), f);
    e(:,i) = abs(U(:,end) - u_exact(tf));
end

% plot error vs. dt on log-log plot
figure();
loglog(dt, e);
hold on
loglog([dt(1), dt(3)], [1, 1/4], 'k'); % becomes line of slope 1 in log-log

title('Error in forward Euler approximation (b)');
xlabel('dt');
ylabel('error');

legend('forward Euler (y)', 'forward Euler (y'')', 'line of slope 1');