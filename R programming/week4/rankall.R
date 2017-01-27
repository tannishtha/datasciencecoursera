# Author : Tannishtha Som
# Date : 01.26.2017

## This function finds out the hospitals in all the states with the requested rank

rankall <- function(outcome, num = "best"){
    ##Read the outcome data
    outcomeData <- read.csv("Week 4/outcome-of-care-measures.csv", colClasses = "character")
    
    ##Check if outcome is valid"
    outcomeNames <- c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% outcomeNames)){
        stop("Invalid Outcome")
    }
    
    ## For each state, find the hospital of the given rank
    if (outcome == "heart attack"){
        outcomeData[, 11] <- suppressWarnings(as.numeric(outcomeData[, 11]))
        rateData <- outcomeData[c(2,7,11)]
    }
    else if(outcome == "heart failure"){
        outcomeData[, 17] <- suppressWarnings(as.numeric(outcomeData[, 17]))
        rateData <- outcomeData[c(2,7,17)]
    }
    else if(outcome == "pneumonia"){
        outcomeData[, 23] <- suppressWarnings(as.numeric(outcomeData[, 23]))
        rateData <- outcomeData[c(2,7,23)]
    }
    colnames(rateData) <- c("Hospital", "State","Rate")
    sortedHospitals <- rateData[with(rateData, order(Rate, Hospital, State, na.last = NA)),]
    sortedHos_state <- split(sortedHospitals, sortedHospitals$State)
    i <- 1
    output <- data.frame(hospital=character(), state=character(), stringsAsFactors = FALSE)
    if (num == "best"){
        selectedHos <- lapply(sortedHos_state, function(x) x[1,1:2])
        for (state in names(selectedHos)){
           a <- unlist(selectedHos[[state]])
           output[i, ] <- a
           i <- i + 1
        }
         
    }
    else if (num == "worst"){
        selectedHos <- lapply(sortedHos_state, function(x) tail(x,1))
        for (state in names(selectedHos)){
            a <- unlist(selectedHos[[state]])
            output[i, ] <- a
            i <- i + 1
        }
        
    }
    else {
        for (state in names(sortedHos_state)){
            no_hos_state <- nrow(sortedHos_state[[state]])
            if( num > no_hos_state){
                output[i, ] <- c("NA", state)
                i <- i + 1
            }
            else{
                output[i, ] <- unlist(sortedHos_state[[state]][num,1:2])
                i <- i + 1
            }
        }
       
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    output
}
