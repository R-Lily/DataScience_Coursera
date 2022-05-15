# DataScience_Coursera

This project is part of the Course "Geeting and cleaning Data". The data is obtained from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and contains wearable data. A short description of the data can be found in the provided Code book. A full description of the data can be found at the UCI MAchine Learning Repository.

## Content 

This project contains the following items:

- CodeBook.md: this markdown file contains information on the data, the variables and the performed modifications. 

- run_analysis.R: this script is used to generate a tidy data , it performs the following steps:
1. Gets and reads in the data  
2. Merges the training and the test sets and extracts only the measurements on the mean and standard deviation for each measurement
3. Adjusts the activity names using the activity labels to make them descriptive
4. Reshapes the data set to get descriptive variable names
5. Creates a second data set with average of each variable for each activity and subject
6. Saves the second data set

- tidyData.txt: this text file contains the tidy data set.