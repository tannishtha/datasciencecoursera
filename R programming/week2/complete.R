complete <- function(directory, id=1:332){
    
    #make the id names in the three digit format with leading zeros
    modified_id <- formatC(id, width=3, flag="0")
    
    #get the names of the files
    files <- paste (modified_id, ".csv", sep = "")
    
    #store the complete cases for each file
    complete_file <- numeric(length(files))
    
    for(i in 1:length(files)){
        name <- paste(directory, "/", files[i], sep = "")
        data <- read.csv(name)
        complete_file[i] <- sum(complete.cases(data))
    }
    
    data.frame(id = id, nobs = complete_file )
    
}
