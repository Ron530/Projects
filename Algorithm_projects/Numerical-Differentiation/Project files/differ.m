%work done by: Ronney Aovida
%Homework 2. Question 1

function [error,error1] = differ(x)

if nargin==0
x=pi/3;
end

h=[10^-15, 10^-14,10^-13,10^-12,10^-11,10^-10,10^-9,10^-8,10^-7,10^-6,10^-5,10^-4,10^-3,10^-2,10^-1];
x1=sin(x);
tru= 0.5;
fxf=zeros(15);
error=zeros(15);
for i=1:length(h)

fx=sin(x+h(i));
fxf(i)= (fx-x1)/ h(i);
error(i)= abs(tru-fxf(i));
end
fxc=zeros(15);
error1=zeros(15);
for i=1:length(h)
fh= (sin(x-h(i)));
fxc(i)= (fx-fh)/(2*h(i));
error1(i)= abs(tru-fxc(i));
end




loglog(h,error1)
hold on
loglog(h,error)

end

