## fixing character vector - tolower(), toupper
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
tolower(names(cameraData))
toupper(names(cameraData))

## fixing character vectors - strsplit()
splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

## quick aside - lists
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist[[1]]
mylist$letters

## fixing character vvectors - sapply()
splitNames[[6]][1]
firstElem <- function(x){x[1]}
sapply(splitNames, firstElem)

## fixing character vectors - sub()
reviews = read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
names(reviews)
sub("_","",names(reviews),)

## fixing character vectors - gsub()
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

## finding values - grep(), grepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

## more on grep()
grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

## more useful string functions
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff      ")




