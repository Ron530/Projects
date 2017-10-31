runif(1000,2,1024)
test = runif(1000,2,1024)
test= round(test)

  
for (i in 1:length(test)){
  
  if(test[i]%%2 ==0){
    
  }
  if (test[i] %%2 ==1){
    
    test[i]=test[i]+1
  }
}
count=0
vector1=test
vector2= c()
for (i in 1:length(vector1)){
  
  if(test[i] < 500){
    
    vector2[count] = vector1[i]
    count= count+1
    
  }
  
}

count1=0
vector3=c()
for (i in 1:length(vector1)){
  
  if (test[i] < 380 || test[i] > 882){
    vector3[count1]= vector1[i]
  count1= count1 + 1
}}

vector2
mean(vector2)
vector3
mean(vector3)
sd(vector3)
var(vector3)

