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

top_counts <- filter(pack_sum, count > 679)
## If we only want to see the first 20, we can use the head function
head(top_counts, 20)

## We want the packages with the highest number of downloads at the top
arrange(top_counts, desc(count))

## Perhaps we're more interested in the number of *unique* downloads on this particular day
quantile(pack_sum$unique, probs = 0.99)

## select all rows corresponding to values of 'unique' that are strictly greater than 465
top_unique <- filter(pack_sum, unique > 465)

arrange(top_unique, desc(unique))

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)
# Print the results to the console.
print(result1)

## We'd like to accomplish the same result as the last script, but avoid saving our intermediate results.
## This requires embedding function calls within one another
result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)

## The benefit of %>% is that it allows us to chain the
## function calls in a linear fashion. The code to the right of %>% operates on the result from the code
## to the left of %>%
result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size/2^20)
  
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>% filter(size_mb <= 0.5) %>% print
  
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>% arrange(desc(size_mb)) %>% print

