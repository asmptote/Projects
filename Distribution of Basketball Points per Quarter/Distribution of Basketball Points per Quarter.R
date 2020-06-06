
#data from: https://github.com/harvardnlp/boxscore-data
#Challenges in Data-to-Document Generation (Wiseman, Shieber, Rush; EMNLP 2017)
#Using the Rotowire "test" set of NBA games between 1/1/2014 and 3/29/2017
#pts scored per quarter

# Find Whether points per quarter in basketball games are uniformly distributed.

# Dataset needs to be read in from JSON
#install.packages("rjson")
library("rjson")

#load and extract data
Roto<-fromJSON(file="./Data/rotowire/test.json")
head(Roto)

visQtr1<-sapply(Roto,function(x) x[['vis_line']][['TEAM-PTS_QTR1']]);length(visQtr1) #[[x]][[6]][[3]]
head(VisQtr1)
visQtr2<-sapply(Roto,function(x) x[['vis_line']][['TEAM-PTS_QTR2']]);length(visQtr2)
visQtr3<-sapply(Roto,function(x) x[['vis_line']][['TEAM-PTS_QTR3']]);length(visQtr3)
visQtr4<-sapply(Roto,function(x) x[['vis_line']][['TEAM-PTS_QTR4']]);length(visQtr4)

HmQtr1<-sapply(Roto,function(x) x[['home_line']][['TEAM-PTS_QTR1']]);length(HmQtr1)
head(HmQtr1)
HmQtr2<-sapply(Roto,function(x) x[['home_line']][['TEAM-PTS_QTR2']]);length(HmQtr2) 
HmQtr3<-sapply(Roto,function(x) x[['home_line']][['TEAM-PTS_QTR3']]) ;length(HmQtr3)
HmQtr4<-sapply(Roto,function(x) x[['home_line']][['TEAM-PTS_QTR4']]) ;length(HmQtr4)

Q1<-as.integer(visQtr1)+as.integer(HmQtr1)
Q2<-as.integer(visQtr2)+as.integer(HmQtr2)
Q3<-as.integer(visQtr3)+as.integer(HmQtr3)
Q4<-as.integer(visQtr4)+as.integer(HmQtr4)

#reformat so that each row represents a point and write to csv 
Qs<-c(rep("Q1",sum(Q1)),rep("Q2",sum(Q2)),rep("Q3",sum(Q3)),rep("Q4",sum(Q4)))
length(Qs)
write.csv(Qs,"./Data/PointQtrs.csv")


# Now perform Chi Square test for uniformity

#create contingency tables
Obs<-table(Qs);Obs
Exp<- rep(sum(Obs)/length(Obs),length(Obs)); Exp

#R chi sq test
chisq.test(Obs) #4.7753, p=0.189

#19% chance observation arose from a Uniform process. Inconclusive but not enough evidence to say that points aren't
#uniformly distributed over quarters

# calculate chi sq with my own function
ChiSq <-function(Ob,Ex){
  sum((Ob-Ex)^2/Ex)
}

CSq <- ChiSq(Obs, Exp); CSq 
pchisq(CSq, df = 3, lower.tail = FALSE)
#same result as above




