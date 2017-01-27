# Author : Tannishtha Som
# Date : 01.25.2017

##This function finds out the best hospital in a state for the given outcome

best <- function(state, outcome){
    ##Read the outcome data
    outcomeData <- read.csv("Week 4/outcome-of-care-measures.csv", colClasses = "character")
    
    ##Check that state is valid
    stateNames <- unique(outcomeData$State)
    if (!(state %in% stateNames)){
        stop("Invalid State")
    }
    
    ##Check if outcome is valid"
    outcomeNames <- c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% outcomeNames)){
        stop("Invalid Outcome")
    }
    
    
    ## Return hospital name in that state with lowest 30-day death rate
    if (outcome == "heart attack"){
        outcomeData[, 11] <- suppressWarnings(as.numeric(outcomeData[, 11]))
        rateData <- outcomeData[outcomeData$State == state, c(2,11)]
    }
    else if(outcome == "heart failure"){
        outcomeData[, 17] <- suppressWarnings(as.numeric(outcomeData[, 17]))
        rateData <- outcomeData[outcomeData$State == state, c(2,17)]
    }
    else if(outcome == "pneumonia"){
        outcomeData[, 23] <- suppressWarnings(as.numeric(outcomeData[, 23]))
        rateData <- outcomeData[outcomeData$State == state, c(2,23)]
    }
    colnames(rateData) <- c("Hospital", "Rate")
    hospitalNames <- sort(with(rateData, Hospital[Rate == min(Rate, na.rm = TRUE)]))
    hospitalNames[1]
    
}
