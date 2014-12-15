corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  num2file <- function(num){
    file <- ""
    if (num < 10) file <- paste(directory, "/", "00", num, ".csv", sep = "")
    else if (num < 100) file <- paste(directory, "/", "0", num, ".csv", sep = "")
    else file <- paste(directory, "/", num, ".csv", sep = "")
    file
  }
  
  complete_res <- complete(directory)
  id <- complete_res$id[complete_res$nobs > threshold]
  cr <- c()
  
  for (num in id){
    file <- num2file(num)
    read_data <- read.csv(file)
    need_data <- (!is.na(read_data$sulfate)) & (!is.na(read_data$nitrate))
    sulfate <- read_data$sulfate[need_data]
    nitrate <- read_data$nitrate[need_data]
    cr <- c(cr, cor(sulfate, nitrate))
  }
  
  cr
}