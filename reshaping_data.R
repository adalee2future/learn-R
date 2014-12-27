## starting with reshaping
library(reshape2)
head(mtcars)

## melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

## casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

## averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

## another way - split
spIns = split(InsectSprays$count,InsectSprays$spray)
spIns

## another way - apply
sprCount = lapply(spIns,sum)
sprCount

## another way - combine
unlist(sprCount)
sapply(spIns,sum)

## another way - plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))