## Even though it’s legal, messing around with the order of the arguments too much
## is not recommended, since it can lead to some confusion.
my_data <- rnorm(100)
sd(my_data)
sd(x = my_data)
sd(x = my_data, na.rm = FALSE)
sd(na.rm = FALSE, x = my_data)
sd(na.rm = FALSE, my_data)