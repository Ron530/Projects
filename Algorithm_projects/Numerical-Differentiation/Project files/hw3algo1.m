%work done by: Ronney Aovida
%Homework 2. Question 2
%Romberg equation and trapezoidal


index=[0,0,0]';
sum=0;
true= -4/9;

for k=1:3
 n=[1,2,4,8];  
 n=n(k);
    
 for i=1:n
  
    x= linspace(0,1,n+1);
    
    h= 1/n;
    
    I= h* (fx(x(i+1))+fx(x(i)))/2;
    
    sum= I+sum;
   
    index(i)=sum;
    
    abserror= abs(I-true)
    relerror= abserror/true
 end
 
 for v=1:n-1

%romberg
II=  index(v+1)+((index(v+1)-index((v))))/3;
    
end
 
end










