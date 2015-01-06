# pm25_data
## pm0
pm0 <- read.table("RD_501_88101_1999-0.txt", comment.char = "#", header = FALSE, 
                  sep = "|", na.strings = "")
dim(pm0)
head(pm0)
cnames <- readLines("RD_501_88101_1999-0.txt", 1)
cnames
cnames <- strsplit(cnames, "|", fixed = "TRUE")
names(pm0) <- make.names(cnames[[1]])
head(pm0)

x0 <- pm0$Sample.Value
class(x0)
str(x0)
summary(x0)
mean(is.na(x0))

## pm1
pm1 <- read.table("RD_501_88101_2012-0.txt", comment.char = "#", header = FALSE, 
                  sep = "|", na.strings = "")
dim(pm1)
names(pm1) <- make.names(cnames[[1]])
head(pm1)
x1 <- pm1$Sample.Value
str(x1)
summary(x1)
summary(x0)
mean(is.na(x1))

