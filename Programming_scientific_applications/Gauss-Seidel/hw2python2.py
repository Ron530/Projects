# Ronney Aovida, LUdecomposition, Homework 2 part 2, 2/21/16

#The first half of this script is the assignment with the numpy module
#and the second half is without the use of the numpy module.

from numpy import dot
import numpy as np


a= np.matrix('-4.143 1 0;1 -4.143 1;0 1 -4.143')
print a
b= np.matrix('-25.7726;-17.5726;-21.1726')
print b



def LUdecom(a):
    n = len(a)
    for k in range(0,n-1):
        for i in range(k+1,n):
           if abs(a[i,k]) > 1.0e-9:
               temp = a [i,k]/a[k,k]
               a[i,k+1:n] = a[i,k+1:n] - temp*a[k,k+1:n]
               a[i,k] = temp
    return a

print LUdecom(a)

def LUsolution(a,b):
    n = len(a)
    for k in range(1,n):
        b[k] = b[k] - dot(a[k,0:k],b[0:k])
    b[n-1] = b[n-1]/a[n-1,n-1]    
    for k in range(n-2,-1,-1):
       b[k] = (b[k] - dot(a[k,k+1:n],b[k+1:n]))/a[k,k]
    return b

print LUsolution(a,b)






# Below is my "attempt" at getting the solution without the use of the numpy module



matrix= [[0]*3 for i in range(3)]
A= matrix

A[0][0]= -4.14300
A[0][1]= 1
A[1][0]= 1
A[1][1]= -4.14300
A[1][2]= 1
A[2][1]= 1
A[2][2]= -4.14300


B= [[0]*1 for i in range(3)]

B[0]= -25.7726
B[1]= -17.5726
B[2]= -21.1726

def LUdeco(A):
    n = len(A)
    for k in range(0,n-1):
        for i in range(k+1,n):
           if abs(A[i][k]) > 1.0e-9:
               temp = A[i][k]/A[k][k]
               for x in range(k+1,n):
                   A[i][x] = A[i][x] - temp*A[k][x]
                   
               A[i][k] = temp
    return A

print LUdeco(A)


def LUsolut(A,B):
    n = len(A)
    for k in range(1,n):
        for x in range(0,k):
            B[k] = B[k] - (A[k][x]*B[x])
    B[n-1] = B[n-1]/A[n-1][n-1]    

    for k in range(n-2,-1,-1):
        for x1 in range(k+1,n):
            here=(A[k][x1]*B[x1])
            
        B[k] = (B[k] - here)/A[k][k]
    return B

print LUsolut(A,B)

