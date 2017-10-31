from numpy import *


A= matrix([[1,2,3],[4,5,6],[7,8,10]])

b= matrix([[-3],[-2],[-1]])

c= dot(A,b)   #the dot function is the function that computes the standard matrix-vector product

xtract= A[1:,1:]

B= matrix([[1,2],[3,4]])

addi= add(xtract,B)

C= matrix([[-1,-2],[-3,-4]])

multy= dot(addi,C)


A[0:2,0:2]=multy

print A

