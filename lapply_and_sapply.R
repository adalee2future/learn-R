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

