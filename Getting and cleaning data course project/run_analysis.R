## Getting and cleaning data course project

# Directory of "UCI HAR Dataset" folder extracted from downloaded .zip file
parentFolder="/home/tobias/Dokumente/DataScience/Getting and cleaning data/project/UCI HAR Dataset/"

## "test" data
# Set working directory for "test" data
setwd(parentFolder)
setwd("test")

# Load participant ID
participantID <- read.table("subject_test.txt")

# Load and rename activities (number label to description) 
activity <- read.table("y_test.txt")
activity$V1 <- as.character(activity$V1)
activityN <- c("walk","walk_up","walk_down","sit","stand","lay")
for (i in 1:length(activityN)) {
        activity$V1 <- sub(as.character(i), activityN[i], activity$V1)        
}

# Set working directory containing data "Intertial Signals"
setwd("Inertial Signals")

# Create vector with .txt files in directory and create data frame
files <- dir()
test <- data.frame(matrix(NA, nrow=dim(participantID)[1], ncol=(2*length(files)+2)))

# Assign participant ID and activity to data frame 
test[,1] <- participantID
names(test)[1] <- "participant_ID"
test[,2] <- activity
names(test)[2] <- "activity"

# Load data, calculate mean and standard deviation and assign value to data frame 
for(i in c(1:length(files))) {
        print(files[i])
        temp <- read.table(files[i])
        test[,2*i+1] <- rowMeans(temp)
        test[,2*i+2] <- apply(temp,1,sd)
        names(test)[2*i+1] <- paste(sub(".txt","",files[i]),"mean",sep="_")
        names(test)[2*i+2] <- paste(sub(".txt","",files[i]),"sd",sep="_")
}


## "train" data
# Set working directory for "train" data
setwd(parentFolder)
setwd("train")

# Load participant ID
participantID <- read.table("subject_train.txt")

# Load and rename activities (number label to description) 
activity <- read.table("y_train.txt")
activity$V1 <- as.character(activity$V1)
for (i in 1:length(activityN)) {
        activity$V1 <- sub(as.character(i),activityN[i],activity$V1)        
}

# Set working directory containing data "Intertial Signals"
setwd("Inertial Signals")

# Create vector with .txt files in directory and create data frame
files <- dir()
train <- data.frame(matrix(NA, nrow=dim(participantID), ncol=(2*length(files)+2)))

# Assign participant ID and activity to data frame 
train[,1] <- participantID 
names(train)[1] <- "participant_ID"
train[,2] <- activity
names(train)[2] <- "activity"

# Load data, calculate mean and standard deviation and assign value to data frame 
for(i in c(1:length(files))) {
        print(files[i])
        temp <- read.table(files[i])
        train[,2*i+1] <- rowMeans(temp)
        train[,2*i+2] <- apply(temp,1,sd)
        names(train)[2*i+1] <- paste(sub(".txt","",files[i]),"mean",sep="_")
        names(train)[2*i+2] <- paste(sub(".txt","",files[i]),"sd",sep="_")
}

## complete data
# Adding up "test and "train" data
data <- data.frame(matrix(NA, nrow=(dim(test)[1]+dim(train)[1]), ncol=(2*length(files)+2)))
data[1:dim(test)[1],] <- test
data[(dim(test)[1]+1):dim(data)[1],] <- train
names(data) <- sub("train_","",names(train))

## grouped data
library(dplyr)
data_tbl <- tbl_df(data)
# data set with average of each variable (except activity) grouped by participant ID
dataID <- data_tbl %>% 
        group_by(participant_ID) %>%
        mutate(activity = NULL) %>%
        summarise_all(.vars = names(data_tbl), .funs = c(mean="mean"))
# data set with average of each variable (except participant ID) grouped by activity
dataActiv <- data_tbl %>% 
        group_by(activity) %>%
        mutate(participant_ID = NULL) %>%
        summarise_all(.vars = names(data_tbl), .funs = c(mean="mean"))
# Adding up summarised data grouped by participant ID and activity
dataSummary <- data.frame(matrix(NA, nrow=dim(dataID)[1]+dim(dataActiv)[1],ncol=dim(dataID)[2]))
dataSummary[1:dim(dataID)[1],] <- dataID
dataSummary[(dim(dataID)[1]+1):dim(dataSummary)[1],] <- dataActiv
names(dataSummary) <- names(dataID)
names(dataSummary)[1] <- "ID/ activity"

# Exporting data frames data and dataSummary to .txt file
setwd(parentFolder)
setwd("..")
write.table(data, file="data.txt", sep="\t", row.name=FALSE)
write.table(dataSummary, file="dataSummary.txt", sep="\t", row.name=FALSE)
write.csv(data, file="data.csv")
write.csv(dataSummary, file="dataSummary.csv")