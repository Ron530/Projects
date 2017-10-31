function Z = gradf (x,xx,yy )
Z=[0;0];
for i = 1:length(xx)
sum = [-1*(2*xx(i)*(-yy(i)+2*exp(xx(i)*x(2))+x(1)*xx(i))); -1*(4*exp(xx(i)*x(2)) * xx(i)*(-yy(i)+2*exp(xx(i)*x(2))+x(1)*xx(i)))];
Z= sum+ Z
end
end