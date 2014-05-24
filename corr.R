corr <- function(directory, threshold = 0){
    cor_vec <- vector()
    for(i in 1:length(dir(directory))){
        filename <- paste(directory, formatC(i, width=3, flag=0), ".csv", sep="")
        temp <- read.csv(filename)
        f <- complete.cases(temp)
        nob <- sum(f)
        if(nob > threshold){
            temp.good <- subset(temp,f)
            val <- round(cor(temp.good$sulfate,temp.good$nitrate),digits=5)
            cor_vec <- append(cor_vec, val)
        }
    }
    cor_vec
}