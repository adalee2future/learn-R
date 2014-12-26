## swirl, Getting and Cleaning Data, Dates and Times with lubridate

library(lubridate)

## today's date
this_day <- today()
this_day  ## [1] "2014-12-26"

## some functions on date
year(this_day)
month(this_day)
day(this_day)
wday(this_day)  ## week day, 1 = Sunday, 2 = Monday, ...
wday(this_day, label = TRUE) ## [1] Fri

## the date-time representing this exact moment in time
this_moment <- now()
this_moment  ## [1] "2014-12-26 08:48:26 CST"

## some functions on date-time
hour(this_moment)
minute(this_moment)
second(this_moment)

## ymd() took a character string as input and returned an object of class POSIXct
my_date <- ymd("1989-05-17")
my_date
class(my_date)  ## [1] "POSIXct" "POSIXt"

## lubridate is 'smart' enough to figure out many different date-time formats
mdy("March 12, 1975") 
dmy(25081985) ## [1] "1985-08-25 UTC"
ymd("1920/1/2") ## [1] "1920-01-02 UTC"

##
dt1 <- this_moment
ymd_hms(dt1)
hms("03:22:14")

dt2 <- c("2014-05-14", "2014-09-22", "2014-07-11")
ymd(dt2)

## update one or more components of a date-time
update(this_moment, hours = 8, minutes = 34, seconds = 55)
## It's important to recognize that the previous command does not 
## alter this_moment unless we reassign the result to this_moment
this_moment 
this_moment <- update(this_moment, hours = hour(now()), minutes = minute(now()))

## time zone
nyc <- now(tzone = "America/New_York")
nyc

## add two days to nyc
depart <- nyc + days(2)
depart
depart <- update(depart, hours = 17, minutes = 34)
depart
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(arrive, "Asia/Hong_Kong")
arrive
last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
how_long <- new_interval(last_time, arrive)
as.period(how_long)

 

