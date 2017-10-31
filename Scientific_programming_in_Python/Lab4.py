#Lab 4: Dijkstra's algorithm for maze solving
#Djistra's algorithm is useful for finding the shortest path from one node to another in a connected graph. It is not however terribly useful for finding the shortest path through a maze, if soley because a maze is not typically given #as a graph theory problem. Your assigment is to solve the for the shortest path from the very top-left corner white pixel to the very bottom-right corner pixel in the maze below.

#As you don't know any maze-solving algorithms, your best bet for solving this problem is to first convert this maze shown above into a graph, and then using Djistra's algorithm to solve for the shortest path.
#In your career as a computational scientist you will often encounter problems posed in ways that you can't answer; your job will be to think about how to transform such a problem into one you know how to answer. This exercise will #help you somewhat in that regard.

from scipy.misc import imread
%matplotlib inline
import matplotlib
import numpy as np
from scipy.ndimage.interpolation import zoom
import matplotlib.pyplot as plt
maze = imread("TrumanEatsLunch.jpg", mode="L")
maze = zoom(maze, 0.25)
t = plt.pcolormesh(np.flipud(maze))
plt.imshow(maze)
np.savetxt('file.txt', maze)
print (maze[3])
print (maze[3][3])
print (np.transpose(maze[3]))


#Task 1
#In the cell below, write a function that takes in as an argument an array of values corresponding to the pixel map of the maze, and outputs a node list for the maze and variable containing adjacency information (adjacency matrix/#structure/edge list, what have you.) Then go ahead and execute it on the maze variable generated above. Bonus (5pts): Use a python package to to display the resultant graph (if it's too large, display a subset of it)

import numpy
import matplotlib
import scipy.sparse as sps

def nodes(maze):
    ylen= (len(maze))
    node=[]
    xlist=[]
    ylist=[]
    coord=[]
    yaxis=0
    count=0
    xlen= len(maze[0])

    
    for n in maze:
        yaxis=yaxis+1
        xaxis=0
        for i in n:
            xaxis=xaxis+1
            if i>1:
                count=count+1  
                node.append(count)
                coord.append([xaxis,yaxis])
                
    coord2=[]
    xcoord=4
    ycoord=4
    coord2=[]
    thearray = numpy.zeros([len(node),len(node)])
    for m in coord:
        xcoord=xcoord+1
        ycoord=ycoord+1
        n = coord.index(m)
        upcoord= [m[0],m[1]-1]
        downcoord=[m[0],m[1]+1]
        rightcoord=[m[0]+1,m[1]]
        leftcoord=[m[0]-1,m[1]]
        up = coord.index(upcoord) if upcoord in coord else 0
        down= coord.index(downcoord) if downcoord in coord else 0
        right=coord.index(rightcoord) if rightcoord in coord else 0
        left=coord.index(leftcoord) if leftcoord in coord else 0
        if up != 0:    
            thearray[up,n]=1
            thearray[n,up]=1
        if down != 0:
            thearray[down,n]=1
            thearray[n,down]=1
        if right != 0:
            thearray[right,n]=1
            thearray[n,right]=1
        if left != 0:
            thearray[left,n]=1
            thearray[n,left]=1
    np.fill_diagonal(thearray, 0)
    M = sps.csr_matrix(thearray)
    plt.spy(M)
    plt.show()
    


            
    
    
    
    for k in range(0,len(coord)):
        xlist.append(coord[k][0])
        
    for l in range(0,len(coord)):
        ylist.append(coord[l][1])
    #distancex=[]
    #for j in range(0,len(coord)-1):
        #distancex.append(((coord[j+1][0]-coord[j][0])**2+(coord[j+1][1]-coord[j][1])**2)**.5)    
    plt.axis([0, 250, 0, 125])
    plt.plot(xlist,ylist,'ro')
    plt.show
                           
                           
    return 0




        
nodes(maze)
