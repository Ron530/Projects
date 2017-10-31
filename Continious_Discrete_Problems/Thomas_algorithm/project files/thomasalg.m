function [x] = thomasalg(a,b,c,d,n)


for i=1:n
    
    if i==1
c(i)= c(i)/b(i);
    end
    
    if i>1
c(i)=c(i)/(b(i)-a(i)*c(i-1));
    end
    
    if i==1
d(i)=d(i)/b(i);
    end
    
    if i>1
d(i)=(d(i)-a(i)*d(i-1))/(b(i)-a(i)*c(i-1));
    end
     
end

x(n)= d(n);

for i=n-1:-1:1
x(i)=d(i)-c(i)*x(i+1);
end
%time=toc;

end

