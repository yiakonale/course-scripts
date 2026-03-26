lnhic<-log(crash$hic)
crash<-cbind(crash,lnhic)

qqnorm(lnhic,pch=19,col="blue",datax=T)
qqline(lnhic,col="green",datax=T)

library("nortest")
ad.test(lnhic)
