%Question 1, Lab 1.   Ronney Aovida
%convergenece study for question 1
h=[1/2, 1/4, 1/8, 1/16, 1/32,1/64];

f0=@(h) exp(-h)* (-h/(2*h^2)) + exp(h)* h/(2*h^2);

var=zeros(length(h),1);

for i=1:length(h)
var(i)=abs(f0(h(i))-1);
disp (abs(f0(h(i))-1));


end

loglog(h,var,'b');

