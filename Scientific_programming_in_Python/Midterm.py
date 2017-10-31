#Midterm Exam
#The following 4 questions are all given equal weight; feel free to use any of the course resources as well as any online resourcse available. Obviously, you are not to colloborate with anyone else (classmate or not) for these questions, nor should you seek help on them through online forums like stack exchange. If you use any prexisting code, please provide a reference to where you found it.

#Section 1: Algorithm Analysis
#Part A
#In this problem we want to investigate the efficiency of an algorithm in terms of its work. Complete the following table for various n. Some numbers may be too large to work with so just enter ∞ for those. Use the table to order the #growth rates
#n	n3n3	2n2n	nlognnlog⁡n	n!n!	n!!n!!	log10nlog⁡10n	4n4n	n2lognn2log⁡n	log2nlog⁡2n
#1010	1000	20	10	3628800	Inf	2	40	100	1.301
#102102	10000	200	200	Inf	Inf	3	400	20000	2.301
#103103	100000	2000	3000	Inf	Inf	4	4000	3000000	3.301
#105105	10000000	200000	500000	Inf	Inf	6	400000	5 x 10^10	5.301
#Part B
#Supercomputing centers work by allocating a certain amount of CPU time (measured in hours) on there machines to each user. Once a user uses up all of his allocated time, he must wait until his allocation is renewed to run more #simulations. Assume you have been given an allocation of 100 CPU hours at a supercomputing center; pick 4 of the above algorithm efficiencies and compute the maximum problem size that you can solve with this allocation for each of the #4 algorithm effeciencies; Assume performance of 1 tera-FLOPS.

import math
x=(100*60*60)*10**12
x0= 27**(1.0/3.0)
x1=x/2
x2= x/4
x3= math.log10(2/10)
x33=10**x3

#I chose: n**3,2n,4n,log10n

#Part C
#Pick a modern academic article from your field of choice and compare the problem size ( nn ) used for simulations in this paper and compare it to the maximum solvable sizes you used above. Could you solve the problem with this allocation?
#http://www.motherearthnews.com/natural-health/nutrition/gmo-safety-zmgz13amzsto.aspx
#the problem size in this article is only 10 male and 10 female mice. if i used the allocation of n**3,2n,4n or log10n for the sample size the results will be much more accurate. if 1,000 mice were tested instead of the measly 10 to start with then we could acheive a result of a much more different magnitude. for example: if they tested 1,000 mice and found that 70% of the female mice still had tumors, their research will be much more credible rather than the 7/10 mice that could have easily been judged to just been a coincidence or random mutation rather than a constant that occured among hundreds of mice.

#Section 2: Random Walks
#Part A
#Consider the drunken sailors problem once again. Through either simulation or calculation, compute the fraction of sailors who walk off the edges 20 meters in either direction after 120 steps. If you opt for calculation, show your workings and justify your answer. If you opt for simulation, choose your parameters and justify your result in the end.

import numpy as np
import random
import matplotlib.pyplot as plt
n = 120
nsailors = 100

walks = np.random.rand(nsailors,n)
b = walks >= 0.5 
walks[b] = 1
walks[~b] = -1 

location = np.cumsum(walks, 1 )
count=0
for i in location[:,n-1]:
    if i>20 or i<(-20):
        count=count+1

t = plt.hist(location[:,n-1])
print (count/len(location[:,n-1])) #this print statement provides the percentage of drunks that fell off the edge of 20 meters
plt.show()

#Part B
#Write a short program that simulates and plots the movement of a particle in 2-D that is undergoing Brownian motion. It should be written in such a way as so it can take the number of steps for the particle as an argument. Plot the first steps it takes using a shade of blue, and the last steps it takes as a shade of red, with the steps in between transitioning smoothly between the two.

import numpy as np
import matplotlib.pyplot as plt
import random

def bubblesort(arr):
    n = len(arr)
    for i in range(0,n-1):
        for j in range(0,n-(i+1)):
            if(arr[j+1] < arr[j]):
                arrbigger = arr[j+1]
                arr[j+1] = arr[j]
                arr[j] = arrbigger
            
    return arr


def randomwalk(length):
    x=0
    y =0
    walkx=[x]
    walky = [y]
    for i in range(length):

        new = random.randint(0,3)
        if new == 0:
            x += 1
        elif new == 1:
            y += 1
        elif new ==2 :
            x += -1
        else :
            y += -1
        walkx.append(x)
        walky.append(y)
    
    return [walkx,walky]

walk = randomwalk(1000)




plt.plot(walk[0],walk[1],'b',color='b')
plt.axis([-50,50,-50,50])
plt.show()

#Section 4: Clustering
#Conisder the points {(1, 2),(−4, −2),(3, 3),(5, 6),(−3, −1),(−5, −3),(5, 4),(6, 8),(−5, −2),(−1, −2)}
#Part A
#Cluster these points using single linkage heirachical clustering using the  l2l2 -norm, and draw a dendrogram of the results.

from matplotlib import pyplot as plt
from scipy.cluster.hierarchy import dendrogram, linkage
import numpy as np
%matplotlib inline
np.set_printoptions(precision=5, suppress=True) 
a = [[1,2], [-4,-2], [3,3], [5,6], [-3,-1], [-5,-3], [5,4], [6,8], [-5,-2], [-1,-2]]

a = np.asarray(a)
plt.scatter(a[:,0], a[:,1])
plt.show()
Z = linkage(a, 'single', 'euclidean')
plt.title('Hierarchical Clustering Dendrogram')
plt.xlabel('sample index')
plt.ylabel('distance')
t = dendrogram(
    Z,
    leaf_rotation=90.,  # rotates the x axis labels
    leaf_font_size=8.,  # font size for the x axis labels
)

#Part B
#Cluster these points using complete linkage heirarchical clustering and the  l1l1 -norm, and draw a dendogram of the results. Compare with your dendogram in part A.

Z = linkage(a, 'complete', 'euclidean')
plt.title('Hierarchical Clustering Dendrogram')
plt.xlabel('sample index')
plt.ylabel('distance')
t = dendrogram(
    Z,
    leaf_rotation=90.,  # rotates the x axis labels
    leaf_font_size=8.,  # font size for the x axis labels
)
