IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
IQ

range(IQ)

group=cut(IQ,breaks=c(80,90,100,110,120,130,140),right=FALSE)
group

count<-table(group)
count

n<-length(IQ)
percent<-count/n*100
percent

cumpct<-cumsum(percent)
cumpct

cbind(count,percent,cumpct)