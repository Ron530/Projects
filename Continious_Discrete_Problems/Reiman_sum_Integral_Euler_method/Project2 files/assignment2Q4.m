%Ronney Aovida    Lab 2   Question 4      part D and E


exact=@(t) exp(t)/(1+exp(t)); %exact solution
y=1/2;
dt=1/8;
t=0;
i=1;
temp=zeros(1,5);
temp2=zeros(1,5);
error=zeros(1,5);
while t<6
   
    t=t+dt; 
    
    y=eulerstep(y,dt);  % uses newton method to solve the non-linear equations next time step
    y=y(end);
    temp2(i)=exact(t);
    temp(i)=y;
    error(i)=abs(temp(i)-temp2(i)); % calculates the error for the newton method
    i=i+1;

end
fprintf ('Crank-nicolson\n')
disp(temp(1:15))
fprintf ('Exact solution\n')
disp(temp2(1:15))
fprintf ('Error\n')
disp(error(1:15))
fprintf ('the order of conergence is still of order 2. these reults have the same convergence rate at problem #3\n\n') % answer to part E
