Mergedata <- function(dataset1, dataset2){
    dataset <- rbind(dataset1, dataset2)
    dataset
}

ExtractMeanStd <- function(dataset){
    cols <- grep("[M,m]ean|std", colnames(dataset))
    dataset[,cols]
}

MapColnames <- function(dataset, colname){
    colnames(dataset) <- colnames(colname)
    dataset
}

CreateTidyData <- function(dataset){
    
    subjects <- sort(unique(dataset.subject)[,1])
    ACTIVITIES <- activityLabels[,2]

    tidydata <- matrix(nrow= (length(subjects)*length(ACTIVITIES)), ncol= length(colnames(dataset)))
    index <- 1
    
    #loop through each subject
    for(each in subjects){
        dataset.eachsubject <- subset(dataset, dataset$Subject==each)
        #loop through each Activity
        for(eachActivity in ACTIVITIES){
            dataset.eachActivity <- subset(dataset.eachsubject,dataset.eachsubject$ActivityName==eachActivity)
            #get mean
            m <- sapply(dataset.eachActivity[,
                                             !(colnames(dataset.eachActivity) %in% 
                                                   c("ActivityName","Subject"))], mean)
            oneRow <- vector()
            oneRow <- append(c(each, eachActivity), m)
            tidydata[index,] <- oneRow
            index <- index + 1
        }
    }
    
    tidydata
}

#main
#read data
directory <- "/home/shenjun/R/R-repo/temp/GetingAndCleaningData/UCI\ HAR\ Dataset" # the directory of data file
paste(directory, "train/X_train.txt")

x.train <- read.table(paste(directory, "/train/X_train.txt", sep=""))
y.train <- read.table(paste(directory, "/train/y_train.txt", sep=""))
x.test <- read.table(paste(directory, "/test/X_test.txt", sep=""))
y.test <- read.table(paste(directory, "/test/y_test.txt", sep=""))
activityLabels <- read.table(paste(directory,"/activity_labels.txt", sep=""))
features <- read.table(paste(directory, "/features.txt", sep=""))
subject.train <- read.table(paste(directory, "/train/subject_train.txt", sep=""))
subject.test <- read.table(paste(directory, "/test/subject_test.txt", sep=""))


#1. merge dataset
dataset.x <- Mergedata(x.train,x.test)
dataset.y <- Mergedata(y.train,y.test)
dataset.subject <- Mergedata(subject.train, subject.test)

#4. add column name for dataset x
colnames(dataset.x) <- as.character(features[,2])

#2. extract mean and std columns
dataset.meanstd <- ExtractMeanStd(dataset.x)

#3. name measurement columns
dataset.meanstdNamed <- MapColnames(dataset.meanstd, features[,2])

#5. create tidy data set 
dataset.submit <- NULL
colnames(dataset.ylabel) <- c("ActivityName")
dataset.temp <- cbind(dataset.meanstd, dataset.ylabel)
colnames(dataset.subject) <- c("Subject")
dataset.temp <- cbind(dataset.temp, dataset.subject)

dataset.submit <- CreateTidyData(dataset.temp)
colname.submit <- append(c("Subject","ActivityName"), colnames(dataset.meanstd))
colnames(dataset.submit) <- colname.submit
dataset.submit <- dataset.submit[order(as.numeric(dataset.submit[,1]), dataset.submit[,2]),]

#write to file
write.table(dataset.submit, "tidy_data.txt")



