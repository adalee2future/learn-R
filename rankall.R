rankall <- function(outcome, num = "best") {
  
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that outcome is valid
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (sum(valid_outcomes == outcome) == 0){
      stop("invalid outcome")
    }
    
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
    
    ## get sorted states
    valid_states <- outcome_data$State
    states <- valid_states[!duplicated(valid_states)]
    states <- sort(states)
    rank_hospitals <- c()
    
    current_num <- num
    if (num == "best") current_num <- 1
    
    for (state in states){
      
      need_index <- (valid_states == state) & (!is.na(death_rate))
      sorted_rate <- sort(death_rate[need_index])
      
      if (num == "worst") current_num <- length(sorted_rate)
      res_index <- need_index & death_rate == sorted_rate[current_num]
      
      n <- sum(sorted_rate < sorted_rate[current_num])
      res <- sort(hospitals[res_index])
      rank_hospitals <- c(rank_hospitals, res[current_num - n])
      
    }
    
  
    data.frame(hospital = rank_hospitals, state = states)
  
  
}