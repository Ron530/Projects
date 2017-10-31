weight0 = runif(170,150,190)
age0 = runif(170, 35,57)

weight= rnorm(weight0, 170,15)
age= rnorm(age0, 45,8)

df= data.frame(weight, age)
colnames(df)
plot(df$age,df$weight,xlab="age",ylab="weight", main= "weight vs. age analysis")

hist(weight, main= "Histogram of weight")

