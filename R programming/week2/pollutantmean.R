pollutantmean <- function(directory, pollutant, id=1:332){
    
    #make the id names in the three digit format with leading zeros
    modified_id <- formatC(id, width=3, flag="0")
    
    #get the names of the files
    files <- paste (modified_id, ".csv", sep = "")
    
    #particulate matter data of the individual files
    pm_data <- c()
    
    #calculate mean of individual files
    for(i in 1:length(files)){
        name <- paste(directory, "/", files[i], sep = "")
        data <- read.csv(name)
        #head(data)
        pm_data <- c(pm_data, data[,pollutant])
    }
    
    mean(pm_data, na.rm = TRUE)
    
}
