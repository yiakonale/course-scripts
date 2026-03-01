chestdecel<-crash$chest.decel
chestdecel<-chestdecel[!is.na(chestdecel)]
n<-length(chestdecel)
n

xbar<-mean(chestdecel)
s<-sd(chestdecel)
cbind(n,xbar,s)

alpha<-.02
tval<-qt(1-alpha/2,n-1)
tval

se<-s/sqrt(n)
c(xbar-tval*se,xbar+tval*se)

t.test(chestdecel,conf.level=.98)
