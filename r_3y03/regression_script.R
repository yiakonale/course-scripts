reg<-lm(systolic ~ weight,data=databank)
summary(reg)
anova(reg)

plot(reg,2,pch=19,col="blue")

plot(reg,1,pch=19,col="red")
