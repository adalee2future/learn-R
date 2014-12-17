best <- function(state, outcome){
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that the state and outcome are valid
  valid_states <- outcome_data$State
  if (sum(valid_states == state) == 0) {
    stop("invalid state")
  }
  
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (sum(valid_outcomes == outcome) == 0){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 3--day death
  ## rate
  
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
  best_rate <- min(death_rate[need_index])
  res_index <- need_index & death_rate == best_rate
  
  hospitals[res_index]
}
