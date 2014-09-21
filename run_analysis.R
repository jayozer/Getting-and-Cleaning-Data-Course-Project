# Course project

# install.packages("plyr")
# library(plyr)

## Read all data from features.txt
featuresData <- read.table("UCI HAR Dataset/features.txt")
## Extract only the measurements on the mean and standard deviation
filteredFeaturesData <- grep("mean|std", featuresData$V2)

## Read all data from X_train.txt
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
## Read all data as comma separated
filteredTrainData <- trainData[,filteredFeaturesData]
## Read all data from X_test.txt
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
## Read all data as comma separated
filteredTestData <- testData[,filteredFeaturesData]


## Merge both data as combined data
combinedData <- rbind(filteredTrainData, filteredTestData)


## Label the data set
colnames(combinedData) <- featuresData[filteredFeaturesData, 2]


## Read all data from y_train.txt
trainActivityData <- read.table("UCI HAR Dataset/train/y_train.txt")
## Read all data from y_test.txt
testActivityData <- read.table("UCI HAR Dataset/test/y_test.txt")
## Merge both data as combined activity data
combinedActivityData <- rbind(trainActivityData, testActivityData)


## Read all data from activity_labels.txt
labelActivity <- read.table("UCI HAR Dataset/activity_labels.txt")
## Combine activity data with corresponding labels
combinedActivityData$activity <- factor(combinedActivityData$V1, levels = labelActivity$V1, labels = labelActivity$V2)


## Read all data from subject_train.txt
trainSubjectData <- read.table("UCI HAR Dataset/train/subject_train.txt")
## Read all data from subject_test.txt
testSubjectData <- read.table("UCI HAR Dataset/test/subject_test.txt")
## Merge both data as combined subject data
combinedSubjectData <- rbind(trainSubjectData, testSubjectData)


## Merge activity and subject names as combinedActivitySubject
combinedActivitySubject <- cbind(combinedSubjectData, combinedActivityData$activity)
## Append column names
colnames(combinedActivitySubject) <- c("subject.id", "activity")


## Merge dataset with descriptive variable names
labeledDataSet <- cbind(combinedActivitySubject, combinedData)


## Create a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
independentData <- aggregate(labeledDataSet[,3:81], by = list(labeledDataSet$subject.id, labeledDataSet$activity), FUN = mean)
## Append column names
colnames(independentData)[1:2] <- c("subject.id", "activity")
## Create tidyDataSet.txt file into working directory
write.table(independentData, file="tidyDataSet.txt", row.names = FALSE)


