t.test(systolic~gender,data=databank,alt="two.sided",
       conf.level=.95,var.equal=FALSE,na.action="na.omit")
