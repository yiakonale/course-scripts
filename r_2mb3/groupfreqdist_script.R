hic<-crash$hic
hic<-hic[!is.na(hic)]
hic

range(hic)

group=cut(hic,breaks=c(0,400,800,1200,1600,4500),right=FALSE)
group

count<-table(group)
count

n<-length(hic)
percent<-count/n*100
percent

cumpct<-cumsum(percent)
cumpct

cbind(count,percent,cumpct)
