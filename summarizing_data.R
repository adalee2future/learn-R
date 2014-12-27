## getting the data from the web
if (!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")

## look a bit of the data
head(restData,n=3)
tail(restData,n=3)

## make summary
summary(restData)

## Mpre in depth information
str(restData)

## Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

## Make table
table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict,restData$zipCode)  ## two dimension

## check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(is.na(restData$councilDistrict))

## rows and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

## values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

## cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt

## flat tables
warpbreaks$replicate <- rep(1:9, len=54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt
ftable(xt)

## size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")

