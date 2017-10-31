weight0 = runif(170,150,190)
age0 = runif(170, 35,57)
weight= rnorm(weight0, 170,15)
age= rnorm(age0, 45,8)

ageset= runif(130,35,57)
age2= rnorm(ageset,40,10)
df2= data.frame(age2)

df= data.frame(weight, age)


plot(1:170,df$age,type="l",col= "green", xlim=c(1,170),ylab="age",xlab="ID")
lines(1:130,df2$age2,type="l",col="red",xlim=c(1,130),ylab="age",xlab="ID")


x=hist(df$age)
y=hist(df2$age2)
plot(x, col="red")
lines(y,col="purple")