#Ronney Aovida, LAB 6, ISC 4244, part 3

data("quakes")
data=data.frame(quakes)
?quakes

##This dataset is about: Locations of Earthquakes off Fiji

#The data set gives the locations of 1000 seismic 
#events of MB > 4.0. The events occurred in a cube
#near Fiji since 1964

#A data frame with 1000 observations on 5 variables.

#1.lat=Latitude of event
#2.long=Longitude
#3.depth=Depth (km)
#4.mag=Richter Magnitude
#5.stations=Number of stations reporting

#The details oriented towards this data set:
#There are two clear planes of seismic activity. 
#One is a major plate junction; the other is the Tonga 
#trench off New Zealand. These data constitute a subsample 
#from a larger dataset of containing 5000 observations.

#Source of above information:
#This is one of the Harvard PRIM-H project data sets. They in 
#turn obtained it from Dr. John Woodhouse, Dept. of Geophysics,
#Harvard University.

b=data$mag
as.factor(b)
#there are 22 repeating magnitudes 

lat=data$lat
long=data$long
vect1=c()
vect2=c()
vecty=c()
vecty2=c()
count=0
count1=0

for (i in 1:length(b)){
 
  if(b[i] < 5){
    count=count+1
   vect1[count]=lat[i] 
   vecty[count]=long[i]
  }
  if(b[i] >= 5){
    count1=count1+1
    vect2[count1]=lat[i] 
    vecty2[count1]=long[i]
  }
}
plot(vect1,vecty,col="red",xlim=c(-40,-10),ylim=c(165,190),xlab="lattitude",ylab="longitude",main="coordinates of earthquakes")
par(new=TRUE)
plot(vect2,vecty2,col="blue",xlim=c(-40,-10),ylim=c(165,190),xlab="lattitude",ylab="longitude")



