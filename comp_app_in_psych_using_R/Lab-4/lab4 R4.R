read.data = function(){
# returns a data.frame
  data(USArrests)
  arr= (USArrests)
  df= arr[ , c("Murder", "Assault", "Rape", "UrbanPop")]
  return(df)
  
}

x= read.data()


my.plot = function(){
  
  plot(x$UrbanPop,x$Murder, col="red",ylim=c(1,200), xlab="Population",ylab= "#events",main="Murder(red),Assault(blue),Rape(green)")
   
  points(x$UrbanPop,x$Assault,col="blue")
  
  points(x$UrbanPop,x$Rape,col="green")
  return()

  
}

my.plot()


 