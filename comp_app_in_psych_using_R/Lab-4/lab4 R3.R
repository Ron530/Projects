randomplot <- function(x){
  randd= runif(x)
  sqr= randd^2
  cube= randd^3
 plot(randd,sqr, col="blue")
par(new=TRUE) 
 plot(cube,col="red")
  return()
}

randomplot(10)
randomplot(100)
randomplot(1000)