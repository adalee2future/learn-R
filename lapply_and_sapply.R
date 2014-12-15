my_matrix <- matrix(1:20, 4, 5)

patients <- c("Bill", "Gina", "Kelly", "Sean")
my_data <- data.frame(patients, my_matrix)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
my_data
my_list = lapply(my_data, class)
class(my_list)
my_character <- sapply(my_data, class)
class(my_character)
sum(my_data$age)

nums = my_data[, 2:6]
lapply(nums, sum)
sapply(nums, sum)
sapply(nums, mean)
lapply(nums, range)
nums_mat <- sapply(nums, range)
class(nums_mat)

unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(nums, unique)

lapply(unique_vals, function(elem) elem[2])

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x = 1:4
lapply(x, runif)

x = 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))

x <- matrix(1:6, 2, 3)
sapply(x, function(y) y + 100)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean)

