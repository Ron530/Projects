import time
from numpy import *
t0=time.time()
a=0
b=1000
n=100

h=(b-a)/n

def fun(x):
    x=1+2*x
    return x


summ=0
for i in range(1,n):
    count= fun(a+i*h)
    summ= summ + count
    
fx= (h/2)*fun(a)+(h/2)*fun(b)+h*(summ)

t1=time.time()
t3=t1-t0
print t3
print fx

tt=time.time()
i= range(1,n)

fx2=(h/2)*fun(a)+(h/2)*fun(b)+h* sum(fun(a+array(i)*h))
tt2=time.time()
tt3=tt2-tt
print fx2
print tt3

