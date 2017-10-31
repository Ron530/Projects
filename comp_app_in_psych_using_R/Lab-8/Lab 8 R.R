#Ronney Aovida lab 8

x=read.table("~/documents/class_scoring.Rdata")

females= x[x$Gender== "F",]
female2=females[,-c(2:12)]
table2= write.table(female2,"female2.Rdata")
read.table("female2.Rdata") -> scores
t.test(scores$mean_scores~scores$Group)


males= x[x$Gender== "M",]
male2=males[,-c(2:12)]
mtable2= write.table(male2,"male2.Rdata")
read.table("male2.Rdata") -> scores2
t.test(scores2$mean_scores~scores2$Group)


# Data analysis: according to the data of trustworthiness between 
#good/bad men and women i found that there was a distinct difference 
#that both the sexes shared, trustworthiness of good images was much 
#higher than that of the "bad" images. both the sexes shared a standard
#deviation of one between the good and bad averages. the average of trust 
#for bad to good women respectively is 1.7248 to 2.7523, where as for men
#it is 1.5099 to 2.5751. Both these averages remarkably have the same
#standard deviation, however overall, women were proven to be slightly more trusted than men.



