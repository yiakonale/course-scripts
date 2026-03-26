lnhic<-log(crash$hic)
crash<-cbind(crash,lnhic)

t.test(lnhic~size,data=crash,alt="two.sided",
       conf.level=.95,var.equal=FALSE,na.action="na.omit",
       subset=(size == "comp" | size == "med"))
