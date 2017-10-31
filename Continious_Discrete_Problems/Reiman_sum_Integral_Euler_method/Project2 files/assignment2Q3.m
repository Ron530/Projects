%Ronney Aovida Lab2    Question 3
% This is to prove Part D of question 3
% The  global discretization error is as I expected

nicolson=@(dt,y) (y-((dt/2)*y)+dt)/(1+dt/2);
exact=1-exp(-1);
dt=[1/4,1/8,1/16,1/32,1/64,1/128,1/256];
temp=zeros(1,length(dt));
error=zeros(1,length(dt));
t=0;
y=0;
tf=1;
for i=1:length(dt)
    while t<tf
    y=nicolson(dt(i),temp(i));
    t=t+dt(i);
    temp(i)=y;
    end
    error(i)=abs(exact-temp(i));
    t=0;
end
loglog(dt,error,'b')