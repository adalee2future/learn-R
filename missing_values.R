x <- c(44, NA, 5, NA)
x * 3
 
y <- rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y, z), 100)
is.na(my_data)
my_na <- is.na(my_data)
sum(my_na)

0 / 0
NaN
Inf - Inf
