%Question 3, Lab 1.   Ronney Aovida

fnc=@(theta)  (-1*(cos(theta)-2)*sin(theta))+((sin(theta)-1)*cos(theta))+((theta-2)*1);
fnc_deriv=@(theta) 2*cos(theta)+ (1*sin(theta)+1);

% part(d)

[TEMP,iter]=newtons_method(fnc,fnc_deriv,0,1000,.00001);

plot (linspace(0,iter,iter),TEMP,'b-')

%part (e)
x0= linspace(-4,4,1000);

y=zeros(length(x0),1);
for i=1:length(x0)
    
 [x,y(i)]= newtons_method(fnc,fnc_deriv,x0(i),1000,.00001);
    
end

plot(x0,y,'k')

%part (f)

% Acording to the graph in part (e) I have found the basin of attraction is
% from the range of -0.75 to 2. my estimated interval would be [-0.75,2].
