#Ronney Aovida

# myFunctions 

# Functions
# Compute and return mean of vector.
sumofsquare <- function(x) {
  x1= sum(x^2)
  return(x1)
}

sumofcubed <- function(x) {
  x1= sum(x^3)
  return(x1)
}

scattergraph <- function(x) {
x1= runif(c(x))
x2= x1^2
scatter= plot(x2,x1,xlab="x axis(abscissa)", ylab="y axis(ordinate)")
return(scatter)
}

standarddeviation <- function(x,y,z) {
  if (lengths(x) == lengths(y))
    x1= (x+y)/(sd(z))
    else
  return(x1)
}

evenodd <- function(m,n) {
  x= seq(m,n,2)
  
    return(x)
}



plotevenodd <- function() {
  source('/Users/ronneyaovida/Desktop/functions.r')
  plot(evenodd.r(x),1:length(evenodd.r(x), main="evenodd function plot", xlab= "the index numbers", ylab="even numbers"))
  
  return()
}



