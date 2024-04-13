weight<-databank$weight
gender<-databank$gender

female_weight<-weight[gender=="F"]
male_weight<-weight[gender=="M"]

#We first use the c() function to combine the cutpoints into a vector
cutpoints<-c(90,110,130,150,170,190,210,230,250)

#we use the xaxt="n" option to supress the tickmarks on the x-axis
#and the right=FALSE option so that right endpoints are not included
#in the intervals
hist(female_weight,breaks=cutpoints,labels=TRUE,right=FALSE,col="green",
     xaxt="n",main="Weights of Females",xlab="Weight")

#then we specify that the tickmarks on the x-axis be at the cutpoints
axis(side=1,at=cutpoints)

hist(male_weight,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Weights of Males",xlab="Weight")
axis(side=1,at=cutpoints)
