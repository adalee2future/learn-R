## starting simple
d1 = date()
d1
class(d1)

## Date class
d2 = Sys.Date()
d2
class(d2)

## formatting dates
format(d2, "%a %b %d")

## creating dates
x = c("1jan1960", "2jan1960", "31mar1969", "30jul1969");
z = as.Date(x, "%d%b%Y")
z[1] - z[2]
as.numeric(z[1]-z[2])

## converting to Julian
weekdays(d2)
months(d2)
julian(d2)

## lubridate
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

## dealing with times
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

## some functions have slightly different syntax
x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1])
wday(x[1],label=TRUE)