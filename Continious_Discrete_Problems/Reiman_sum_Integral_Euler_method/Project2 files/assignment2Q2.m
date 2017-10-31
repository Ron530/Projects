%Ronney Aovida, Lab2 Question 2

%func is a function handle to represent the IVP of the growth model

%func2 is a function handle to represent a logistic differential equation
%of the grwoth model

%fyt function handle represents p(t).

k=0.7885;
fyt=@(t) 0.25*exp(k*t);
func=@(fyt,t) k*fyt;
func2=@(fyt,t) k*(1-(fyt/25))*fyt;
p0=[.25,.55,1.1,2.25,7.5,16.25,19.5,22.75];
temp=zeros(1,5);
temp2=zeros(1,5);
temp3=zeros(1,5);
temp4=zeros(1,5);
run1=forward_euler(func,.25,0,1/4,10);
run2=forward_euler(func,.25,0,1/8,10);
run3=forward_euler(func2,.25,0,1/4,10);
run4=forward_euler(func2,.25,0,1/8,10);

for i=1:4
    temp(i)=run1(4*i-3);
    if i==4
        temp(5)=run1(21);
        temp(6)=run1(29);
        temp(7)=run1(33);
        temp(8)=run1(41);
    end
end

for i=1:4
    temp2(i)=run2(8*i-7);
    if i==4
       temp2(5)=run2(41);
        temp2(6)=run2(57);
        temp2(7)=run2(65);
        temp2(8)=run2(81);
    end
end

for i=1:4
    temp3(i)=run3(4*i-3);
    if i==4
        temp3(5)=run3(21);
        temp3(6)=run3(29);
        temp3(7)=run3(33);
        temp3(8)=run3(41);
    end
end

for i=1:4
    temp4(i)=run4(8*i-7);
    if i==4
        temp4(5)=run4(41);
        temp4(6)=run4(57);
        temp4(7)=run4(65);
        temp4(8)=run4(81);
    end
end
fprintf ('   dt=1/4 unbounded/exponential\n');
disp(temp)
fprintf ('   exact solution\n');
disp(p0)
fprintf ('   dt=1/8 unbounded/exponential\n');
disp(temp2)
fprintf ('   exact solution\n');
disp(p0)
fprintf ('   dt=1/4 bounded\n');
disp(temp3)
fprintf ('   exact solution\n');
disp(p0)
fprintf ('   dt=1/8 bounded\n');
disp(temp4)
fprintf ('   exact solution\n');
disp(p0)