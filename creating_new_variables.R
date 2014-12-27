## creating sequences
s1 <- seq(1,10,by=2); s1
s2 <- seq(1,10,length=3); s2
x <- c(1,3,8,25,100); seq(along=x)

## subsetting variables
restData <- read.csv("./data/restaurants.csv")
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

## creating binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)

## creating categorical variables


