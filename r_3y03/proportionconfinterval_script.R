IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
n<-length(IQ)
n

successes<-IQ[IQ>=120]
successes

x<-length(successes)
x

alpha<-.01
zval<-qnorm(1-alpha/2)
zval

phat<-x/n
se<-sqrt(phat*(1-phat)/n)
c(phat-zval*se,phat+zval*se)
