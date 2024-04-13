sample1<-c(17.5,16.2,16.9,17.4,19.2,18.3,17.6)
sample2<-c(15.8,17.3,18.2,17.1,17.8)
sample3<-c(15.9,16.2,15.8,14.7,18.3,17.2,16.2)
sample4<-c(16.2,16.8,15.7,14.9,16.2,17.1,15.8,15.4)

recovery.time<-c(sample1,sample2,sample3,sample4)
recovery.time

sample<-c(rep("1",7),rep("2",5),rep("3",7),rep("4",8))
sample

anova<-aov(recovery.time ~ sample)
plot(anova,2,pch=19,col="red")

plot(anova,1,pch=19,col="red")

library("nortest")
ad.test(anova$residuals)

bartlett.test(recovery.time ~ sample)

summary(anova)

pairwise.t.test(recovery.time, sample, p.adj = "bonf")
