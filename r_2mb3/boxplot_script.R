bplot<-boxplot(hic~size,data=crash,main="Boxplot of HIC by SIZE",
               xlab="SIZE",ylab="HIC",col="lightslateblue")

stats<-bplot$stats
stats

rownames(stats)<-c("a2","Q1","Q2","Q3","a1")
colnames(stats)<-bplot$names
stats

bplot$out

size<-crash$size
hic<-crash$hic

mean<-tapply(hic,size,mean,na.rm=T)
sd<-tapply(hic,size,sd,na.rm=T)
n<-tapply(hic,size,length)

cbind(n,mean,sd)
