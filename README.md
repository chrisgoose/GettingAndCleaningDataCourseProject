# GettingAndCleaningDataCourseProject

This is my course project submission for Getting and Cleaning Data.
The R script, `run_analysis.R`, does the following:

1. Checks for the given dataset or else downloads into current working directory.
2. Merges the training and the test sets to create one data set in which only
   only mean and std dev variables are retained.
3. Extracts only the measurements on the mean and standard deviation for each
   measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names.
6. Creates a second, independent tidy data set with the average of each variable
   for each activity and each subject.

The end result is shown in the file `tidyData.csv`.