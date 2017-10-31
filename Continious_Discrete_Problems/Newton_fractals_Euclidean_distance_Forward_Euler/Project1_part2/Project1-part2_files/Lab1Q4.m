%Question 4, Lab 1.   Ronney Aovida

%part a)
dt=[1/4,1/8,1/16,1/32,1/64];
FYT=@(y0,t0) (t0^3)*y0;
Y0=0.5;
T0=0;
TF=1;
exact=@(t) .5*exp((t^4)/4);
finalval=zeros(5,1);
exactsol=zeros(5,1);
fprintf ('DT    approx solution     exact solution       error\n');
for i=1:5
[sol,time]=forward_euler(FYT,Y0,T0,dt(i),TF);
finalval(i)= sol(end);
exactsol(i)=exact(time(end));
fprintf ('%.2f      %.4f             %.4f            %.4f\n',dt(i),finalval(i),exactsol(i),abs(finalval(i)-exactsol(i)));
end



 
%part b)
exact1=@(t) -7*exp(-2*t) + 10*exp(-t);
fyt=@(y0,t0) [y0(2);-3*y0(2)-2*y0(1)];
finalval1=zeros(5,1);
exactsol1=zeros(5,1);
error=zeros(5,1);
y(1)=3;
w(1)=4;
y0=[y(1);w(1)];
t0=0;
Tf=1;
fprintf ('DT    approx solution     exact solution       error\n');
for i=1:5
[sol1,time1]=forward_euler(fyt,y0,t0, dt(i), Tf);
finalval1(i)=sol1(1,end);
exactsol1(i)=exact1(time1(end));
error(i)=abs(finalval1(i)-exactsol1(i));
fprintf ('%.2f      %.4f             %.4f            %.4f\n',dt(i),finalval1(i),exactsol1(i),error(i));

end


loglog(dt,error,'b')

% note: I cannot prove if the solution does indeed agree with the expected
% rate of convergence because I am not certain about proving ODE's.
