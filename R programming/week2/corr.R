corr <- function(directory, threshold=0){
    data_files <- list.files(directory)
    corr_vector <- c()
    for (i in 1:length(data_files)){
        obs <- complete(directory,i)
        if( obs$nobs > threshold){
            file_rel <- paste (directory, "/", data_files[i], sep = "")
            current <- read.csv(file_rel)
            corr_vector <- c(corr_vector, cor(current$sulfate, current$nitrate, use = "complete.obs"))
        }
    }
    corr_vector
}
