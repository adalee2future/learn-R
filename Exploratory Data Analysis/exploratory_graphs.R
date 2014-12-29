## data
pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character",
        "factor", "numeric", "numeric"))
head(pollution)

## five number summary
summary(pollution$pm25)

## histogram
hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

## multiple boxplots
boxplot(pm25 ~ region, data = pollution, col = "red")

## overlaying features
boxplot(pollution$pm25, col = "blue")
abline(h = 12)  ## 12 is default

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

## barplot
barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each region")

