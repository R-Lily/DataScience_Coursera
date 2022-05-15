# DataScience_Coursera

The data is obtained from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and contains wearable data. 

A tidy data set is generated using the script run_analysis.R, which performs the following steps:
1. Gets and reads in the data  
2. Merges the training and the test sets and extracts only the measurements on the mean and standard deviation for each measurement
3. Adjusts the activity names using the activity labels to make them descriptive
4. Reshapes the data set to get descriptive variable names
5. Creates a second data set with average of each variable for each activity and subject
6. Saves the second data set