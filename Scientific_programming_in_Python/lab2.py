#Monte Carlo Simulations
#In this lab assignment, we'll look at using Monte Carlo Simulations to gain insight into problems that may prove intuitively difficult. First we #consider the Monty Hall Problem, and next we consider the Three-Person Duel problem from the lecture.
#Monty Hall Problem
#The Monty Hall problem is named for the original host of the television game show Let's Make a Deal. The problem is presented a thus. A contestant is #presented with three doors. Behind two of the doors, there is nothing, but behind one of the doors is a fabulous prize.

#The contestant picks one of these doors, and the host then opens one of the other doors, revealing it to be one of the doors containing nothing. The #contestant is then given the option to switch their selection to the remaining unopened door. After they either switches doors or keeps his original #selection, they receive the prize behind the door they currently hold.

#Task 1A)
#Write program that simulates the Monty Hall problem a number very large number of times. You'll randomly initialize 3 doors (two losers, and one #winner) and then have a contestant randomly select one of those doors. Discard one of (or the only) losing door the player does not. select In this #task, you'll have the contestant never switch doors. Keep track of the percentage of time the contestant wins or losses and estimate his probability #of winning using the never-switch stragety and output it.

from random import randrange


iterations=1000

def montyhall(selection,switching=False):
    count=3
    doors= [False] *count
    notselected=doors
    doors[randrange(count)]= True
    selected= doors[selection]
    del notselected[selection]
    
    switchedoor= True in notselected
    
    if switching==True:
        return switchedoor
    else:
        return selected
    
    

#Task 1B)
#Conduct the exact same expiriment as above, but in this case, modify your code so that the contestant always switches doors from his original #selection. Estimate the probability of winning using this strategy and ouput it.


print ("iterations: ", iterations, "\n")
print ("not switching:" , (sum(montyhall(randrange(3))for x in range(iterations))))

print ("iterations: ", iterations, "\n")
print ("Now with switching:", sum(montyhall(randrange(3), switching=True)
          for x in range(iterations)))


#Three Person Duel
#We now consider ourself in the siutation of being the least skilled competitor in a dueling game. Your two competitors have accuracy of 3/4 and 2/3, #while your accurancy is only 3/10. During each players turn, they attempt to hit an opponent, and if succesful, the hit opponent is eliminated from #the game. You go last, and you know that your other two competitors will always attempt to target their biggest threat (the most accurate of their #opponents).
#Task 2
#Write a simulation for this dueling game and carry out a number of numerical experiments to determine you probability of winning the duel for each of #the following strategies.
#You target your most accurate remaining opponent every turn
#You target you least accurate remaining opponent every turn
#You randomly taget an opponent every turn
#You intentionally miss until you have only one opponent left, who you then target.



#below is the code for randomly targeting a opponent every turn

import random
from random import randrange


population = range(0,60)


x=random.sample(population,60)

player1=45
    
player2=40
    
me=18

switchA=True
switchB=True
switchC=True
shootersA= [player2,me]
shootersB= [player1,me]
shootersC= [player1,player2]






while ((switchA) and (switchB)) or ((switchA) and (switchC)) or ((switchB) and (switchC)):

    A= shootersA[randrange(2)]
    if (A==40 and switchA==True):
        
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit player 2! ")
                switchB=False
    if (A==18 and switchA==True):
       
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit me! ")
                switchC=False
    B=shootersB[randrange(2)]
    
    if (B==45 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit player 1! ")
                switchA=False
    if (B==18 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit me! ")
                switchC=False
    C=shootersC[randrange(2)]
    
    if (C==40 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 2! ")
                switchB=False
    if (C==45 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 1! ")
                switchA=False
    if switchA:
        print ("player1 is still alive")
    if switchB:
        print("player2 is still alive")
    if switchC:
        print("I am still alive!")


# below is the code for me to targeting the LEAST accurate player left

import random
from random import randrange


population = range(0,60)


x=random.sample(population,60)

player1=45
    
player2=40
    
me=18

switchA=True
switchB=True
switchC=True
shootersA= [player2,me]
shootersB= [player1,me]
shootersC= [player1,player2]






while ((switchA) and (switchB)) or ((switchA) and (switchC)) or ((switchB) and (switchC)):

    A= shootersA[randrange(2)]
    if (A==40 and switchA==True):
        
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit player 2! ")
                switchB=False
    if (A==18 and switchA==True):
       
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit me! ")
                switchC=False
    B=shootersB[randrange(2)]
    
    if (B==45 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit player 1! ")
                switchA=False
    if (B==18 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit me! ")
                switchC=False
    if switchB:
        C=shootersC[2]                     #this if else statement will determine who i shoot 
                                            #depending on who is alive, prioritizing the least accurate
    else:
        C=shootersC[1]

    
    if (C==40 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 2! ")
                switchB=False
    if (C==45 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 1! ")
                switchA=False
    if switchA:
        print ("player1 is still alive")
    if switchB:
        print("player2 is still alive")
    if switchC:
        print("I am still alive!")

# below is the code for me to targeting the MOST accurate player left

import random
from random import randrange


population = range(0,60)


x=random.sample(population,60)

player1=45
    
player2=40
    
me=18

switchA=True
switchB=True
switchC=True
shootersA= [player2,me]
shootersB= [player1,me]
shootersC= [player1,player2]






while ((switchA) and (switchB)) or ((switchA) and (switchC)) or ((switchB) and (switchC)):

    A= shootersA[randrange(2)]
    if (A==40 and switchA==True):
        
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit player 2! ")
                switchB=False
    if (A==18 and switchA==True):
       
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit me! ")
                switchC=False
    B=shootersB[randrange(2)]
    
    if (B==45 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit player 1! ")
                switchA=False
    if (B==18 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit me! ")
                switchC=False
    if switchA:
        C=shootersC[1]                     #this if else statement will determine who i shoot 
                                            #depending on who is alive, prioritizing the most accurate
    else:
        C=shootersC[2]
    
    if (C==40 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 2! ")
                switchB=False
    if (C==45 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 1! ")
                switchA=False
    if switchA:
        print ("player1 is still alive")
    if switchB:
        print("player2 is still alive")
    if switchC:
        print("I am still alive!")


# below is the code for me to miss until only one is left
import random
from random import randrange


population = range(0,60)


x=random.sample(population,60)

player1=45
    
player2=40
    
me=18

switchA=True
switchB=True
switchC=True
shootersA= [player2,me]
shootersB= [player1,me]
shootersC= [player1,player2]






while ((switchA) and (switchB)) or ((switchA) and (switchC)) or ((switchB) and (switchC)):

    A= shootersA[randrange(2)]
    if (A==40 and switchA==True):
        
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit player 2! ")
                switchB=False
    if (A==18 and switchA==True):
       
        for i in range(1,A):
            temp=x[i]
            
            if temp==1:
                print ("player1 hit me! ")
                switchC=False
    B=shootersB[randrange(2)]
    
    if (B==45 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit player 1! ")
                switchA=False
    if (B==18 and switchB==True):
        
        for i in range(1,B):
            temp=x[i]
            
            if temp==1:
                print ("player 2 hit me! ")
                switchC=False
    if switchA and switchB:
        C=0                                 #this if else statement will determine who i shoot 
                                            #depending on whoever is left alive
    else:
        if switchA:
            C= shootersC[1]
        if switchB:
            C=shootersC[2]
    
    if (C==40 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 2! ")
                switchB=False
    if (C==45 and switchC==True):
        
        for i in range(1,C):
            temp=x[i]
            
            if temp==1:
                print ("i hit player 1! ")
                switchA=False
    if switchA:
        print ("player1 is still alive")
    if switchB:
        print("player2 is still alive")
    if switchC:
        print("I am still alive!")
