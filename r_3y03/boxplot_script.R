bplot<-boxplot(weight~gender,data=databank,main=
                 "Boxplot of WEIGHT by GENDER",
               xlab="GENDER",ylab="WEIGHT",col="lightslateblue")

stats<-bplot$stats
stats

rownames(stats)<-c("a2","Q1","Q2","Q3","a1")
colnames(stats)<-bplot$names
stats

bplot$out

weight<-databank$weight
gender<-databank$gender

mean<-tapply(weight,gender,mean,na.rm=T)
sd<-tapply(weight,gender,sd,na.rm=T)
n<-tapply(weight,gender,length)

cbind(n,mean,sd)
