%Homework 3 by Ronney Aovida. please us rk4.m with this driver code.  

% The assignment asked to conduct a convergence test for 2 IVP's, set the
% variable IVP to 1 for the first IVP and to 2 for the driver to run the
% code using the 2nd IVP.
IVP=2;

if IVP==1
f = @(y,t) 1-y^2;
ytrue = @(t) (exp(2*t)-1)/(exp(2*t)+1);
t0 = 0;
tf = 2;
y0 = 0;
C = 0.05;
end
if IVP==2
t0 = 0;
tf = 1;
y0 = 1;
ytrue = @(t) exp(-t^4);
f = @(y,t) -4*(t^3)*y;
C = 0.5;
end
dt = 1./[4, 8,16,32,64];
errors = zeros(size(dt));
s=[1,2,3,4];
A=logspace(-2,0);
figure();
for x=1:length(s)
for i = 1:length(dt)
[Y,T,yexact] = rk4(f,y0,t0,tf,dt(i),s(x),ytrue);
errors(i) = abs((Y(end)-yexact(end))/yexact(end));
end
B=C * A.^s(x);
loglog(A,B, '--')
hold on
loglog(dt, errors, 'o-');
hold on
end
if IVP==2
title('Graph of Second IVP')
else 
    title('Graph of First IVP')
end
legend('show');
legend('ref line1','s=1','ref line2','s=2','ref line3','s=3','ref line4','s=4','location','southeast')
xlabel('error');
ylabel('$\Delta t$', 'interpreter', 'latex');
