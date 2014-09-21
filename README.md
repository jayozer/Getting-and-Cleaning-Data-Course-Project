Getting-and-Cleaning-Data-Course-Project
========================================

Collect, work, and clean a data set. The goal is to prepare tidy / reproducable data that can be used for later analysis. The data linked below represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

##Below is the link to download the data for this project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Download source data 
2. Unzip the data to your working directory
3. Execute the script run_analysis.R


##Steps done to clean and merge data:
* Read all data from features.txt
* Extract only the measurements on the mean and standard deviation
* Read all data from X_train.txt
* Read all data as comma separated
* Read all data from X_test.txt
* Read all data as comma separated
* Merge both data as combined data
* Label the data set
* Read all data from y_train.txt
* Read all data from y_test.txt
* Merge both data as combined activity data
* Read all data from activity_labels.txt
* Combine activity data with corresponding labels
* Read all data from subject_train.txt
* Read all data from subject_test.txt
* Merge both data as combined subject data
* Merge activity and subject names as combinedActivitySubject
* Append column names
* Merge dataset with descriptive variable names
* Create a second, independent tidy data set with the average  
* Each variable for each activity and each subject
* Append column names
* Create tidyDataSet.txt file into working directory


