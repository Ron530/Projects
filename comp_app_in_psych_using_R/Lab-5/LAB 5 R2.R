data("USJudgeRatings")
datta= data.frame(USJudgeRatings)
class(USJudgeRatings)
sapply(USJudgeratings, typeof)
str(USJudgeRatings)
ncol(USJudgeRatings)
nrow(USJudgeRatings)
y=nrow(USJudgeRatings)
names(USJudgeRatings)

integrity= datta$INTG
intgmean= mean(integrity)
diligence= datta$DILG
dilgmean= mean(diligence)

count=0
temp= c()
temp1=c()
count1=0

for (i in 1:y){
  
  
  if (diligence[i] > dilgmean){
    
    temp[count]= integrity[i]
    count= count + 1
  }   
  
  
  
  if (diligence[i] < dilgmean){
    
    temp1[count1]= integrity[i]
    count1= count1 + 1
  }   
  
  
}
mean(temp)
sd(temp)
mean(temp1)
sd(temp1)

# From This information I have concluded that 
#Judges with higher diligence on average tend to 
#have a higher integrity on average versus those 
#judges with low diligence since the mean of their 
#integrity turned out to be lower as compared to 
#the for loop that analyzed the average of judges
#with a higher average of diligence verus the ones 
#with a lower average. In result i would say that 
#judges with a higher average of diligence tend to 
#have a higher average of integrity as well.The 
#standard deviation of the means are very close
#and therfore do not affect the results on this 
#computation. 

fam= datta$FAMI
oral= datta$ORAL
oralmean= mean(oral)
fammean= mean(fam)

count2=0
temp2= c()
temp3=c()
count3=0

for (i in 1:y){
  
  
  if (oral[i] > oralmean){
    
    temp2[count2]= fam[i]
    count2= count2 + 1
  }   
  
  
  
  if (oral[i] < oralmean){
    
    temp3[count3]= fam[i]
    count3= count3 + 1
  }   
  
  
}
mean(temp2)
sd(temp2)
mean(temp3)
sd(temp3)

#This conclusion is very similiar to the previous
#results acheived in the last step. 
# From This information I have concluded that 
#Judges with higher sound oral rulings on average tend to 
#have a higher familiarity with the law on average versus those 
#judges with low sound oral rulings since the mean of their 
#familiarity with the law turned out to be lower as compared to 
#the for loop that analyzed the average of judges
#with a higher average of diligence verus the ones 
#with a lower average. In result i would say that 
#judges with a higher average of sound oral rulings tend to 
#have a higher average of familiarity with the law as well.The 
#standard deviation of the means are very close as well just as before, and
#therfore do not affect the results on this 
#computation. 
