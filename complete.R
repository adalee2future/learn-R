complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## translate num to filename
  num2file <- function(num){
    file <- ""
    if (num < 10) file <- paste(directory, "/", "00", num, ".csv", sep = "")
    else if (num < 100) file <- paste(directory, "/", "0", num, ".csv", sep = "")
    else file <- paste(directory, "/", num, ".csv", sep = "")
    file
  }
  
  nobs <- c()
  
  for (num in id){
    file <- num2file(num)
    read_data <- read.csv(file)
    need_data <- (!is.na(read_data$sulfate)) & (!is.na(read_data$nitrate))
    nobs <- c(nobs, sum(need_data))
    
  }
  
  data.frame(id = id, nobs = nobs)
}
