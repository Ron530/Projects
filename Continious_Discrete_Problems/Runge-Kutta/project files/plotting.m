% define problem parameters
f = @(y,t) sin(t);
t0 = 0;
tf = 1;
y0 = -1;
% define exact solution
y_exact = @(t) -cos(t);
% set up time step sizes
dt = 1./[4, 8,16,32,64];
errors = zeros(size(dt));
% loop over time step sizes
for i = 1:length(dt)
[Y,~] = rk4(f,y0,t0,tf,dt(i),2);
errors(i) = abs(Y(end)-y_exact(tf));
end
% calculate rate of convergence - this is the slope in the loglog plot
rates = zeros(length(errors)-1,1);
for i = 1:length(rates)
rates(i) = log(errors(i)/errors(i+1))/log(2);
end
% do a loglog plot of errors vs dt
figure();
loglog(dt, errors);
xlabel('error');
ylabel('$\Delta t$', 'interpreter', 'latex');