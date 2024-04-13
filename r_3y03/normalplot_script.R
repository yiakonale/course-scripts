data<-c(43,16,12,15,14,71,4,4,27,52,7,7,23,18,9)

qqnorm(data,pch=19,col="blue",datax=T)
qqline(data,col="green",datax=T)

library("nortest")
ad.test(data)
