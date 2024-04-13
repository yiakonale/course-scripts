iq_data<-c(120,108,98,96,105,110,123,132,102,90)

t.test(iq_data,mu=100,alt="two.sided",conf.level=.95)

xbar<-mean(iq_data)
s<-sd(iq_data)
n<-length(iq_data)
cbind(n,xbar,s)

mu0<-100
tval<-(xbar-mu0)/(s/sqrt(n))
tval

pval=2*(1-pt(abs(tval),n-1))
pval
