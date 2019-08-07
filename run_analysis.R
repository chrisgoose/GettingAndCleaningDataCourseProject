##Here are the data for the project:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("dataset.zip")) {
        download.file(url, "dataset.zip", method="curl")
}
if(!file.exists("UCI HAR Dataset")){
        unzip("dataset.zip")
}

##You should create one R script called run_analysis.R that does the following:
#1. Merges the training and the test sets to create one data set.

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(subjectTrain, yTrain, xTrain)

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(subjectTest, yTest, xTest)

data <- rbind(train,test)
rm(subjectTrain, yTrain, xTrain, train, subjectTest, yTest, xTest, test)

#2. Extracts only the measurements on the mean and standard deviation for each
#   measurement.
featureLabels <- read.table("UCI HAR Dataset/features.txt")
featureLabels[,2] <- as.character(featureLabels[,2])
colnames(data) <- c("subject", "activity", featureLabels[,2])
desiredMeasures <- grepl("subject|activity|mean|std", names(data))
desiredData <- data[,desiredMeasures]
rm(data, featureLabels)

#3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
desiredData$subject <- as.factor(desiredData$subject)
desiredData$activity <- factor(desiredData$activity,
                               levels = activityLabels[,1],
                               labels=activityLabels[,2])

#4. Appropriately labels the data set with descriptive variable names.
names(desiredData) <- gsub("[()-]","", names(desiredData))
names(desiredData) <- gsub("mean","Mean", names(desiredData))
names(desiredData) <- gsub("std","StandardDeviation", names(desiredData))
names(desiredData) <- gsub("Acc","Acceleration", names(desiredData))
names(desiredData) <- gsub("Gyro","Gyroscope", names(desiredData))
names(desiredData) <- gsub("Freq","Frequency", names(desiredData))
names(desiredData) <- gsub("Mag","Magnitude", names(desiredData))
names(desiredData) <- gsub("^t","time", names(desiredData))
names(desiredData) <- gsub("^f","frequency", names(desiredData))


#5. From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
require("reshape2")
moltenData <- melt(desiredData, c("subject", "activity"))
meanData <- dcast(moltenData, subject + activity ~ variable, mean)

write.csv(meanData, "tidyData.csv", row.names=FALSE, quote=FALSE)
