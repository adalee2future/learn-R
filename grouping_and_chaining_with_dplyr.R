libraty(dplyr)
cran <- tbl_df(mydf)
rm("mydf")

by_package <- group_by(cran, package)
summarize(by_package, mean(size))

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

##  give us the 0.99, or 99% sample quantile for the 'count' variable					  
quantile(pack_sum$count, probs = 0.99)

top_count <- filter(pack_sum, count > 679)