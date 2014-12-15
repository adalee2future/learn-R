pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## translate num to filename
  num2file <- function(num){
    file <- ""
    if (num < 10) file <- paste(directory, "/", "00", num, ".csv", sep = "")
    else if (num < 100) file <- paste(directory, "/", "0", num, ".csv", sep = "")
    else file <- paste(directory, "/", num, ".csv", sep = "")
    file
  }
  
  datas <-c()
  
  for (num in id){
    file <- num2file(num)
    read_data <- read.csv(file)
    need_data <- read_data[pollutant][!is.na(read_data[pollutant])]
    datas <- c(datas, need_data)
  }
  
  mean(datas)
  
}
