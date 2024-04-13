weight<-databank$weight
weight_kg<-weight*0.4536

library("aplpack")
stem.leaf(weight_kg,na.rm=T,trim.outliers=F)

stem.leaf(weight_kg,na.rm=T,trim.outliers=F,m=1)
