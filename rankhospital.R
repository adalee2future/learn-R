rankhospital <- function(state, outcome, num = "best") {
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  va## Read outcome data
  lid_states <- outcome_data$State
  if (sum(valid_states == state) == 0) {
    stop("invalid state")
  }
  
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (sum(valid_outcomes == outcome) == 0){
    stop("invalid outcome")
  }
  
    
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  ## get hospitals
  hospitals <- outcome_data$Hospital.Name
  
  ## get date rate
  if (outcome == "heart attack"){
    death_rate <- outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    
  }
  
  if (outcome == "heart failure") {
    death_rate <- outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  
  if (outcome == "pneumonia") {
    death_rate <- outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  
  death_rate <- as.numeric(death_rate)
  need_index <- (valid_states == state) & (!is.na(death_rate))
  sorted_rate <- sort(death_rate[need_index])
  if (num == "best") num <- 1
  if (num == "worst") num <- length(sorted_rate)
  res_index <- need_index & death_rate == sorted_rate[num]
  
  n <- sum(sorted_rate < sorted_rate[num])
  res <- sort(hospitals[res_index])
  res[num - n]
  
}