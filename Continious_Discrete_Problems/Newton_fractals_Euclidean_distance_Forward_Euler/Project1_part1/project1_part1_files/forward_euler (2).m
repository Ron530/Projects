function [Y, T] = forward_euler(y0, t0, tf, dt, fnc)
%% Forward Euler method for approximating an IVP y' = f(y,t)
% inputs:
% y0         - column vector (or scalar) containing intial condition
% t0         - initial time
% tf         - final time
% dt         - time step
% fnc        - handle to function f(y,t)
%
% outputs:
% Y          - vector/matrix containing approximate solution at all time steps
%                 column i contains approximation at time step i
% T          - vector containing time steps

% get T, preallocate Y
T = t0:dt:tf;
Y = zeros(length(y0),length(T));

% save initial condition in first column
Y(:,1) = y0;

% loop over all time steps
for i = 2:length(T)    
    Y(:,i) = euler_step(Y(:,i-1), T(i-1), dt, fnc);
end

end

function Y1 = euler_step(Y0, t0, dt, fnc)
%% take a single Euler step
Y1 = Y0 + dt*fnc(Y0,t0);

end
