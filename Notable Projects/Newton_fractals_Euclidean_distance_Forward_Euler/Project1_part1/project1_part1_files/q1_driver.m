%% Performs convergence study of centre_deriv.m

% add src directory to path, this directory contains centre_deriv.m
path(path, '../src'); 

% handle to function and exact derivative
f = @(x) exp(x);
df_exact = @(x) exp(x);

% create vector of h to loop over
h = 1./[2, 4, 8, 16, 32];

% preallocate vector for approximation error
e = zeros(size(h));

% loop over h and calculate approximation error for each h
for i = 1:length(h)
    e(i) = abs(df_exact(0) - centre_deriv(f, h(i)));
end

% create log-log plot of e vs h, note slope of line 2 means second order 
% accurate. This means that halving h decreases the error by a factor of 4.
figure();
loglog(h, e, 'b');
hold on
loglog([h(1), h(3)], [0.5, 0.5/16], 'r'); % becomes line of slope 2 in log-log

title('Error in centred difference approximation');
xlabel('h');
ylabel('error');

legend('centred difference', 'line of slope 2');