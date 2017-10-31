#Lab 6: Discrete Optimization with the Simplex Method
#The Simplex method is very powerful technique for solving optimization of linear programming problems. In this lab, you will walk through one of the examples by hand, and then write a subfunction that takes a linear programming #problem setup and reconfigures it to be more amenable to solution via the simplex method.
#Part 1: Simplex Tableaus by Hand
#Consider the LP problem of maximizing
#x1+2x2=z
#x1+2x2=z
 
#Subject to the constraints  x1+x2≤1.5x1+x2≤1.5 ,  x1≤1x1≤1 ,  x2≤1x2≤1 
#Write out (either on paper by hand or in this LateX document) the tableau at each step for the solution of this problem, marking the departing variable, entering variable, and pivot element at each step. Continue until you converge to #the optimal solution, and indicate how you know you have converged.


x3=1.5-x1-x2 >= 0


    x1 x2  x3 x4 x5 z
    
x3   1  1  1  0  0  0   1.5
x4   1  0  0  1  0  0   1
x5   0  1  0  0  1  0   1

    -1 -2  0  0  0  1   0

iteration:2
    x1 x2  x3 x4 x5 z
    
x3   1  0  1  0  -1  0  1/2
x4   1  0  0  1  0   0   1
x2   0  1  0  0  1   0   1

    -1  0  0  0  2   1   2
    
iteration:3
    x1 x2  x3 x4 x5 z
    
x1   1  0  1   0  -1   0   1/2
x4   0  0 -1   1   1   0   1/2
x2   0  1  0   0   1   0   1

     0  0  1   0   1   1   5/2
    
    
    
z-1x(1)-2x(2)


#Part 2: Converting LP problems into matrix form.
#In the space below, write a function that takes in a vector of coefficients for you objective function, and a matrix of coefficients for your inequality constraints, and returns a vector of coefficients for your objection functions and a matrix of coefficients for equality constraints. Test this function out on an LP problem from the notes.

import numpy as np


vector=np.array([(-1,-2,0,0,0)])                  
matrix=np.array([(1,1),(1,0),(0,1)])
def simplex(Imatrix,Ivector):
    print (Imatrix)
    x=len(Imatrix)
    for i in range(len(Imatrix)):
        temp=np.array([(0),(0),(0)])
        Imatrix=np.column_stack((Imatrix,temp))
        Imatrix[i][i+x-1]=1
        
    
    
    return Imatrix,Ivector


simplex(matrix,vector)

#Cell 2.

import numpy as np

x=np.array([(1,0),(1,0),(1,0)])
y= np.array([(1),(2),(3)])
m=np.column_stack((x,y))
print (m)

