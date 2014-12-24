mydf <- read.csv(path2csv, stringsAsFactors=FALSE)
dim(mydf)

library(dplyr)
packageVersion("dplyr")

cran <- tbl_df(mydf)
rm("mydf") ## To avoid confusion and keep things running smoothly
cran

## select() help files for the other functions are accessible in the same way
select(cran, ip_id, package, country)

## Use select(cran, r_arch:country) to select all columns starting from r_arch and ending with country
select(cran, r_arch:country)

## We can also select the same columns in reverse order
select(cran, country:r_arch)

## Use select(cran, -time) to get rid of the time column
select(cran, -time)

## omit all columns from X through size
select(cran, -(X:size))

## select all rows for which the package variable is equal to "swirl"
filter(cran, package == "swirl")
## return all rows of cran corresponding to downloads from users in the US running R version 3.1.1
filter(cran, r_version == "3.1.1", country == "US")
## return rows corresponding to users in "IN" (India)
## running an R version that is less than or equal to "3.0.2"
filter(cran, r_version <= "3.0.2", country == "IN")

filter(cran, country == "US" | country == "IN")

filter(cran, size > 100500 , r_os == "linux-gnu")

filter(cran, !is.na(r_version))

cran2 <- select(cran, size:ip_id)

## order the ROWS of cran2 so that ip_id is in ascending order
arrange(cran2, ip_id)

## descending order
arrange(cran2, desc(ip_id))

arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version), ip_id)

cran3 <- select(cran, ip_id, package, size)
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
## create one new column that is equal to the original sizes plus 1000
mutate(cran3, correct_size = size + 1000)

summarize(cran, avg_bytes = mean(size))