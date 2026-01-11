leftfemur<-crash$l.leg
protection<-crash$protection

left_manbelt<-leftfemur[protection=="manual belts"]
left_motbelt<-leftfemur[protection=="Motorized belts"]
left_passbelt<-leftfemur[protection=="passive belts"]
left_dairbag<-leftfemur[protection=="d airbag"]
left_dpairbag<-leftfemur[protection=="d&p airbag"]

#We first use the c() function to combine the cutpoints into a vector
cutpoints<-c(0,500,1000,1500,2000,2500,3000,3500)

#we use the xaxt="n" option to supress the tickmarks on the x-axis
#and the right=FALSE option so that right endpoints are not included
#in the intervals
hist(left_manbelt,breaks=cutpoints,labels=TRUE,right=FALSE,col="green",
     xaxt="n",main="Manual Belts",xlab="Weight")

#then we specify that the tickmarks on the x-axis be at the cutpoints
axis(side=1,at=cutpoints)

hist(left_motbelt,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Motorized Belts",xlab="Weight")
axis(side=1,at=cutpoints)

hist(left_passbelt,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Passive Belts",xlab="Weight")
axis(side=1,at=cutpoints)

hist(left_dairbag,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Driver Airbag",xlab="Weight")
axis(side=1,at=cutpoints)

hist(left_dpairbag,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Driver & Passenger Airbag",xlab="Weight")
axis(side=1,at=cutpoints)