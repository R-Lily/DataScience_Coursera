# Getting and Cleaning Data Course Project

# This script does the following steps:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## load libraries
library(dplyr)
library(reshape2)

## 1. Get the data and read in 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,  "dataFiles.zip")
unzip(zipfile = "dataFiles.zip")

### Read in label information
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("ClassLabels","ActivityName")

### Read in feature information
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- c("ID", "Feature")

### Read in training set
training_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(training_labels) <- "ActivityID"

subjects_training <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subjects_training) <- "SubjectID"

training_set <- read.table("UCI HAR Dataset/train/x_train.txt")
colnames(training_set)<-features$Feature

training_set <- cbind(training_set, subjects_training,training_labels)

### Read in test set
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_labels) <- "ActivityID"

subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subjects_test) <- "SubjectID"

test_set <- read.table("UCI HAR Dataset/test/x_test.txt")
colnames(test_set)<-features$Feature

test_set <- cbind(test_set, subjects_test,test_labels)

##2. Merge the training and the test sets and extract only the measurements on the mean and standard deviation for each measurement
merged_data <- rbind(training_set,test_set)%>%
  select(ActivityID, SubjectID, contains(c("mean()","std()")))
colnames(merged_data) <- gsub("[()]","",colnames(merged_data))

##3. Adjust activity names using the activity labels to make them descriptive
merged_data$ActivityID <- factor(merged_data$ActivityID, levels = activity_labels$ClassLabels, labels = activity_labels$ActivityName)

##4. Reshape dataset to get descriptive variable names
merged_data <- melt(data = merged_data, id = c("SubjectID", "ActivityID"))


##5. Create second data set with average of each variable for each activity and subject
average_data <- dcast(merged_data, SubjectID + ActivityID ~ variable, mean)

##6. Save second data set
write.table(average_data, file="tidyData.txt", row.name = FALSE)
