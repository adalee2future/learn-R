my_vector = 1: 20
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4, 5)
attributes(my_vector)
class(my_vector)
my_matrix <- matrix(1:20, 4, 5)

patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
my_data



