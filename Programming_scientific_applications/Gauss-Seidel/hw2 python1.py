#Ronney Aovida, Gauss-seidel method, homework 2 prog1, 2/21/16


matrix= [[0]*3 for i in range(3)]
A= matrix

A[0][0]= -4.14300
A[0][1]= 1
A[1][0]= 1
A[1][1]= -4.14300
A[1][2]= 1
A[2][1]= 1
A[2][2]= -4.14300

iter= 10

B= [[0]*1 for i in range(3)]

B[0]= -25.7726
B[1]= -17.5726
B[2]= -21.1726

x1= [[0]*1 for i in range(3)]

x1[0]= 8.13
x1[1]= 7.90
x1[2]= 7.02


n= len(A)

for k in range(0,iter):
    
    for i in range(0,n):
        
        s= sum(-A[i][j] * x1[j] for j in range(0,n) if i != j)
        x1[i]= (B[i] + s)/A[i][i]


print x1
    


