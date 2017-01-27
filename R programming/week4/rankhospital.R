# Author : Tannishtha Som
# Date : 01.25.2017

## This function finds out the hospitals in a state with the requested rank

rankhospital <- function(state, outcome, num = "best"){
    ## Read the outcome data
    outcomeData <- read.csv("Week 4/outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state is valid
    stateNames <- unique(outcomeData$State)
    if (!(state %in% stateNames)){
        stop("Invalid State")
    }
    
    ## Check if outcome is valid"
    outcomeNames <- c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% outcomeNames)){
        stop("Invalid Outcome")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if (outcome == "heart attack"){
        outcomeData[, 11] <- as.numeric(outcomeData[, 11])
        rateData <- outcomeData[outcomeData$State == state, c(2,11)]
    }
    else if(outcome == "heart failure"){
        outcomeData[, 17] <- as.numeric(outcomeData[, 17])
        rateData <- outcomeData[outcomeData$State == state, c(2,17)]
    }
    else if(outcome == "pneumonia"){
        outcomeData[, 23] <- as.numeric(outcomeData[, 23])
        rateData <- outcomeData[outcomeData$State == state, c(2,23)]
    }
    colnames(rateData) <- c("Hospital", "Rate")
    #Order has Hospital names as second argument for breaking ties
    sortedHospitals <- rateData[with(rateData, order(Rate, Hospital, na.last = NA)), ]
    if( num == "best"){
        sortedHospitals$Hospital[1]
    }
    else if (num == "worst"){
        tail(sortedHospitals$Hospital, 1)
    }
    else {
         
        if ( num > length(sortedHospitals$Hospital)){
            print("NA")
        }
        else{
            sortedHospitals$Hospital[num]
        }
    }
    
    
}
