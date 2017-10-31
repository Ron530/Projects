from numpy import *

m=7

def fun(x):
    n=0.5
    fx= 0.5**(1+1/n) -(0.5-x)**(1+1/n)
    fx2= 0.5**(1+1/n) -(x-0.5)**(1+1/n)
    return where(x>=0.5,fx,fx2)




def fun2(m):
    
    x=linspace(0,1,m)

    x2=fun(x)
 
    return x2






    
