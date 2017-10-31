#Ronney Aovida, implicit Backward Euler method, Lab 5,scientific programming1, 2/21/16
import copy
import pylab as pl

matrix= [[0]*3 for i in range(3)]
A= matrix

A[0][0]= -4.14300
A[0][1]= 1
A[1][0]= 1
A[1][1]= -4.14300
A[1][2]= 1
A[2][1]= 1
A[2][2]= -4.14300

iterr= 10



x1= [[0]*1 for i in range(3)]
x= [[0]*1 for i in range(3)]

x1[0]= 8.2
x1[1]= 8.2
x1[2]= 8.2

B= [[0]*1 for i in range(3)]

B[0]= -2.143*(x1[0])-8.2
B[1]= -2.143*(x1[1])
B[2]= -2.143*(x1[2])-3.6





relerror= [1,1,1]

def gauss(A,B,x1,relerror,x):
    n= len(A)
    
    while max(relerror) > .001:
    
            x=copy.deepcopy(x1)
            for i in range(0,n):
                
                s= sum(-A[i][j] * x1[j] for j in range(0,n) if i != j)
                x1[i]= (B[i] + s)/A[i][i]
                for v in range(0,n):
                    relerror[v] = (x[v]-x1[v])/x1[v]
                    
            
            
    return x1
s=0
ofile= open('ronneyofile', 'w')
ofile.write("               H1           H2                   H3              H4                H5\n")

boundary1= [str(8.2)]
boundary2= [str(3.6)]

for i in range(0,23):

    x1= gauss(A,B,x1,[1,1,1],x)
    
    B[0]= -2.143*(x1[0])-8.2
    B[1]= -2.143*(x1[1])
    B[2]= -2.143*(x1[2])-3.6

    print x1
    s=s+1

    k = x1
    ", ".join(str(e) for e in k)
   
    
    ofile.write("Time Step: %s " % s)
    ofile.write("%s%s%s\n" % (boundary1,k,boundary2))
ofile.close()

pl.xlim(0, 15)
pl.ylim(3.5,8.5)
y1=x1[1]      
y2=x1[2]
y3=x1[3]
y4=x1[23]
pl.plot(y1, 'r-', label='time step 1')              
pl.hold('on')
pl.plot(y2, 'bo',label='time step 2')
pl.hold('on')
pl.plot(y3, 'y:',label='time step 3' )
pl.hold('on')
pl.plot(y4, 'k--',label='time step 4' )
pl.xlim(0, 15)
pl.ylim(3.5,8.5)
pl.xlabel('Head(ft)')
pl.ylabel('Y coordinates(ft)')
pl.legend(loc='upper right')
pl.title('Plotting 4 curves in the same plot')
pl.savefig("Eulerplot.png")
pl.show()


    
   

   








    









    





    


