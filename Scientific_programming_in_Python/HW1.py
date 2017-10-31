#Homework 1
#Suppose you are given a "loaded" die whose six sides have the faces
#[1,2,3,4,5,6]
#With the respective associated probabilites
#[ 7113,13113,9113,19113,14113,511137113,13113,9113,19113,14113,51113 ]
#Task 1.
#In the cell below, generate (seperate) plots of the discrete CDF #and PDF of this die.

import numpy as np
import time
import matplotlib.pyplot as plt

#PDF
die= [1,2,3,4,5,6]
prob= [7/113, 13/113, 9/113, 19/113, 14/113, 51/113]
y_pos= np.arange(len(prob))


plt.bar(die,prob, align='center', alpha=0.5)
plt.xticks(y_pos, die)

plt.title('PDF')
 
plt.show()


#CDF
prob2= [prob[0], prob[0]+prob[1],prob[0]+prob[1]+prob[2],prob[0]+prob[1]+prob[2]+prob[3],
        prob[0]+prob[1]+prob[2]+prob[3]+prob[4],prob[0]+prob[1]+prob[2]+prob[3]+prob[4]+prob[5]] 
y_pos2= np.arange(len(prob2))
plt.bar(die,prob2, align='center', alpha=0.5)
plt.xticks(y_pos2, die)

plt.title('CDF')

plt.show()


#Task 2
#Calculate the mean, variance and standard deviation, either in code or by hand. If done by hand, work out each step explicitly. Do not use calls to #functions such as np.mean or the like.

meanPDF= (prob[0]+prob[1]+prob[2]+prob[3]+prob[4]+prob[5])/len(die)
meanCDF= (prob2[0]+prob2[1]+prob2[2]+prob2[3]+prob2[4]+prob2[5])/len(die)

varpdf= [(prob[0]-meanPDF)**2,(prob[1]-meanPDF)**2,(prob[2]-meanPDF)**2,
              (prob[3]-meanPDF)**2,(prob[4]-meanPDF)**2,(prob[5]-meanPDF)**2]
variancePDF= (varpdf[0]+varpdf[1]+varpdf[2]+varpdf[3]+varpdf[4]+varpdf[5])/(len(die)-1)

varcdf= [(prob2[0]-meanCDF)**2,(prob2[1]-meanCDF)**2,(prob2[2]-meanCDF)**2,
              (prob2[3]-meanCDF)**2,(prob2[4]-meanCDF)**2,(prob2[5]-meanCDF)**2]
varianceCDF= (varcdf[0]+varcdf[1]+varcdf[2]+varcdf[3]+varcdf[4]+varcdf[5])/(len(die)-1)

standardPDF= (variancePDF)**.5
standardCDF= (varianceCDF)**.5

print (standardPDF)
print (standardCDF)

#Task 3
#In the cell below, Write a program to that simulates the above die model. The program should utilize a named function that takes as arguments the #number of die rolls you want to simulate as well as the discrete CDF. The function should the plot the observed CDF and estimated PDF (once again, #seperately) and return the observed average, mean, and standard deviation. Execute you function for N=1000 die rolls.

import random

def task3(n,xdf):
     die= [1,2,3,4,5,6]
    prob= [7/113, 13/113, 9/113, 19/113, 14/113, 51/113]
    y_pos= np.arange(len(prob))
    if xdf=="PDF":
   
        for i in range(0, n):
            dieroll=random.randint(1,6)
        
       
    
    plt.bar(die,prob, align='center', alpha=0.5)
    plt.xticks(y_pos, die)

    plt.title('PDF')
 
    plt.show()

trial2 = np.random.randint(1,7,[10000,0])
trial5 = np.random.randint(1,7,[10000,2])
trial20 = np.random.randint(1,7, [10000,3])


plt.figure(figsize=(15, 5))
plt.subplot(131)
a = plt.hist(np.sum(trial2,axis=1), range(2,14),align='left')
plt.subplot(132)
b = plt.hist(np.sum(trial5,axis=1),range(5,37),align='left')
plt.subplot(133)
c = plt.hist(np.sum(trial20,axis=1),range(20,121),align='left')
plt.show()

trial10000 = np.random.randint(1,7,[10000])
d6probs = [7/113, 13/113, 9/113, 19/113, 14/113, 51/113]
d6freqs = np.bincount(trial10000)
print (d6probs)
print (d6freqs)
