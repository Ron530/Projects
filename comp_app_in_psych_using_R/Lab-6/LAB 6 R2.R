#Ronney Aovida, LAB 6, ISC 4244, part 2


data("WorldPhones")
as.data.frame(WorldPhones)
w= data.frame(WorldPhones)

for (i in 1:length(w)){
x= c(w$N.Amer[i],w$Europe[i],w$Asia[i],w$S.Amer[i],w$Oceania[i],w$Africa[i],w$Mid.Amer[i])
plot(x,ylim=c(1,80000), xlim=c(1,7),ylab="number of of phones",xlab="countries", main="plots of phones 1951-1961 per continent")
par(new=TRUE)
}
par(new=FALSE)
years=c()
for (i in 1:length(w)){
  
year1= sum(w$N.Amer[i],w$Europe[i],w$Asia[i],w$S.Amer[i],w$Oceania[i],w$Africa[i],w$Mid.Amer[i])
years[i]= year1
}
plot(years,ylim=c(1,150000),xlim=c(1,7),xlab="years",ylab="number of phones",main="total phones around world")



