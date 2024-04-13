IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
n<-length(IQ)
n

xbar<-mean(IQ)
s<-sd(IQ)
cbind(n,xbar,s)

alpha<-.02
tval<-qt(1-alpha/2,n-1)
tval

se<-s/sqrt(n)
c(xbar-tval*se,xbar+tval*se)

t.test(IQ,conf.level=.98)
