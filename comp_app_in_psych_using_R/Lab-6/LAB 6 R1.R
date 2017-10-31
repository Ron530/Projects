#Ronney Aovida, LAB 6, ISC 4244, part 1


read.csv("/Users/ronneyaovida/Desktop/Maze_UniversityOfIllinois.csv")
data=read.csv("/Users/ronneyaovida/Desktop/Maze_UniversityOfIllinois.csv")

dataFemale= subset(data, data$Gender =='F')
dataMale= subset(data, data$Gender == 'M')

dataFemale$Gender
dataMale$Gender

malemeantime= mean(dataMale$T15T)
malegoodmeantime = mean(dataMale$T15T[dataMale$T5T < 10.0])
malemeantime
malegoodmeantime
malemeanerror= mean(dataMale$T15E)
malegoodmeanerror = mean(dataMale$T15E[dataMale$T5T < 10.0])
malemeanerror
malegoodmeanerror
femalemeantime= mean(dataFemale$T15T)
femalegoodmeantime = mean(dataFemale$T15T[dataFemale$T5T < 10.0])
femalemeantime
femalegoodmeantime
femalemeanerror= mean(dataFemale$T15E)
femalegoodmeanerror = mean(dataFemale$T15E[dataFemale$T5T < 10.0])
femalemeanerror
femalegoodmeanerror

Mage= as.factor(dataMale$Age)
Fage= as.factor(dataFemale$Age)
plot(Mage, dataMale$T10T)
plot(Fage, dataFemale$T10T)


par(mfrow= c(1,2))
plot(Mage, dataMale$T10T)
plot(Fage, dataFemale$T10T)

