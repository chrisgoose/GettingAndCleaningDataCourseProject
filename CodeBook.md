# Code Book

This code book describes the data, any transformations to clean up the data, and
the variables found in * `tidyData.txt`


## Data

The tidyData.txt file is a text file, containing space-separated values.
The first row contains variable names, described below under Measurements.


## Identifiers

* `subject` - Test subject id, integer.
* `activity` - Activity id, string.


## Activity Labels

* `1` = `WALKING` - subject walked during the test
* `2` = `WALKING_UPSTAIRS` - subject walked up a staircase during the test
* `3` = `WALKING_DOWNSTAIRS` - subject walked down a staircase during the test
* `4` = `SITTING` - subject sat during the test
* `5` = `STANDING` - subject stoof during the test
* `6` = `LAYING` - subject layed down during the test


## Measurements (Final)

* `timeBodyAccelerationMeanX`
* `timeBodyAccelerationMeanY`
* `timeBodyAccelerationMeanZ`
* `timeBodyAccelerationStandardDeviationX`
* `timeBodyAccelerationStandardDeviationY`
* `timeBodyAccelerationStandardDeviationZ`
* `timeGravityAccelerationMeanX`
* `timeGravityAccelerationMeanY`
* `timeGravityAccelerationMeanZ`
* `timeGravityAccelerationStandardDeviationX`
* `timeGravityAccelerationStandardDeviationY`
* `timeGravityAccelerationStandardDeviationZ`
* `timeBodyAccelerationJerkMeanX`
* `timeBodyAccelerationJerkMeanY`
* `timeBodyAccelerationJerkMeanZ`
* `timeBodyAccelerationJerkStandardDeviationX`
* `timeBodyAccelerationJerkStandardDeviationY`
* `timeBodyAccelerationJerkStandardDeviationZ`
* `timeBodyGyroscopeMeanX`
* `timeBodyGyroscopeMeanY`
* `timeBodyGyroscopeMeanZ`
* `timeBodyGyroscopeStandardDeviationX`
* `timeBodyGyroscopeStandardDeviationY`
* `timeBodyGyroscopeStandardDeviationZ`
* `timeBodyGyroscopeJerkMeanX`
* `timeBodyGyroscopeJerkMeanY`
* `timeBodyGyroscopeJerkMeanZ`
* `timeBodyGyroscopeJerkStandardDeviationX`
* `timeBodyGyroscopeJerkStandardDeviationY`
* `timeBodyGyroscopeJerkStandardDeviationZ`
* `timeBodyAccelerationMagnitudeMean`
* `timeBodyAccelerationMagnitudeStandardDeviation`
* `timeGravityAccelerationMagnitudeMean`
* `timeGravityAccelerationMagnitudeStandardDeviation`
* `timeBodyAccelerationJerkMagnitudeMean`
* `timeBodyAccelerationJerkMagnitudeStandardDeviation`
* `timeBodyGyroscopeMagnitudeMean`
* `timeBodyGyroscopeMagnitudeStandardDeviation`
* `timeBodyGyroscopeJerkMagnitudeMean`
* `timeBodyGyroscopeJerkMagnitudeStandardDeviation`
* `frequencyBodyAccelerationMeanX`
* `frequencyBodyAccelerationMeanY`
* `frequencyBodyAccelerationMeanZ`
* `frequencyBodyAccelerationStandardDeviationX`
* `frequencyBodyAccelerationStandardDeviationY`
* `frequencyBodyAccelerationStandardDeviationZ`
* `frequencyBodyAccelerationMeanFrequencyX`
* `frequencyBodyAccelerationMeanFrequencyY`
* `frequencyBodyAccelerationMeanFrequencyZ`
* `frequencyBodyAccelerationJerkMeanX`
* `frequencyBodyAccelerationJerkMeanY`
* `frequencyBodyAccelerationJerkMeanZ`
* `frequencyBodyAccelerationJerkStandardDeviationX`
* `frequencyBodyAccelerationJerkStandardDeviationY`
* `frequencyBodyAccelerationJerkStandardDeviationZ`
* `frequencyBodyAccelerationJerkMeanFrequencyX`
* `frequencyBodyAccelerationJerkMeanFrequencyY`
* `frequencyBodyAccelerationJerkMeanFrequencyZ`
* `frequencyBodyGyroscopeMeanX`
* `frequencyBodyGyroscopeMeanY`
* `frequencyBodyGyroscopeMeanZ`
* `frequencyBodyGyroscopeStandardDeviationX`
* `frequencyBodyGyroscopeStandardDeviationY`
* `frequencyBodyGyroscopeStandardDeviationZ`
* `frequencyBodyGyroscopeMeanFrequencyX`
* `frequencyBodyGyroscopeMeanFrequencyY`
* `frequencyBodyGyroscopeMeanFrequencyZ`
* `frequencyBodyAccelerationMagnitudeMean`
* `frequencyBodyAccelerationMagnitudeStandardDeviation`
* `frequencyBodyAccelerationMagnitudeMeanFrequency`
* `frequencyBodyBodyAccelerationJerkMagnitudeMean`
* `frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation`
* `frequencyBodyBodyAccelerationJerkMagnitudeMeanFrequency`
* `frequencyBodyBodyGyroscopeMagnitudeMean`
* `frequencyBodyBodyGyroscopeMagnitudeStandardDeviation`
* `frequencyBodyBodyGyroscopeMagnitudeMeanFrequency`
* `frequencyBodyBodyGyroscopeJerkMagnitudeMean`
* `frequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation`
* `frequencyBodyBodyGyroscopeJerkMagnitudeMeanFrequency`


##Transformations

The R script, `run_analysis.R`, does the following:

1. Checks for the given dataset or else downloads into current working directory.
2. Merges the training and the test sets to create one data set in which only
   only `mean` and `std` variables are retained.
3. Extracts only the measurements on the mean and standard deviation for each
   measurement.
4. Uses descriptive activity names to name the activities in the data set.
* `1` = `WALKING`
* `2` = `WALKING_UPSTAIRS`
* `3` = `WALKING_DOWNSTAIRS`
* `4` = `SITTING`
* `5` = `STANDING`
* `6` = `LAYING`
5. Appropriately labels the data set with descriptive variable names:
* `std` -> `StandardDeviation`
* `Acc` -> `Acceleration`
* `Gyro` -> `Gyroscope`
* `freq` -> * `frequency`
* `Mag` -> `Magnitude`
* `t` -> * `time`
* `f` -> * `frequency`
6. Creates a second, independent tidy data set with the average of each variable
   for each activity and each subject.

The end result is shown in the file * `tidyData.txt`.


##Feature Selection (original data set)
=======================================

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix * `t` to denote time) were captured at a constant rate of 50 Hz. Then they
were filtered using a median filter and a 3rd order low pass Butterworth filter
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the
magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the * `f` to indicate frequency domain
signals). 

These signals were used to estimate variables of the feature vector for each
pattern: `-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

* `tBodyAcc-XYZ`
* `tGravityAcc-XYZ`
* `tBodyAccJerk-XYZ`
* `tBodyGyro-XYZ`
* `tBodyGyroJerk-XYZ`
* `tBodyAccMag`
* `tGravityAccMag`
* `tBodyAccJerkMag`
* `tBodyGyroMag`
* `tBodyGyroJerkMag`
* `fBodyAcc-XYZ`
* `fBodyAccJerk-XYZ`
* `fBodyGyro-XYZ`
* `fBodyAccMag`
* `fBodyAccJerkMag`
* `fBodyGyroMag`
* `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are: 

* `mean`: Mean value
* `std`: Standard deviation
* `mad`: Median absolute deviation 
* `max`: Largest value in array
* `min`: Smallest value in array
* `sma`: Signal magnitude area
* `energy`: Energy measure. Sum of the squares divided by the number of values. 
* `iqr`: Interquartile range 
* `entropy`: Signal entropy
* `arCoeff`: Autorregresion coefficients with Burg order equal to 4
* `correlation`: correlation coefficient between two signals
* `maxInds`: index of the frequency component with largest magnitude
* `meanFreq`: Weighted average of the frequency components to obtain a mean frequency
* `skewness`: skewness of the frequency domain signal 
* `kurtosis`: kurtosis of the frequency domain signal 
* `bandsEnergy`: Energy of a frequency interval within the 64 bins of the FFT of each window.
* `angle`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample.
These are used on the angle variable:

* `gravityMean`
* `tBodyAccMean`
* `tBodyAccJerkMean`
* `tBodyGyroMean`
* `tBodyGyroJerkMean`

The complete list of variables of each feature vector is available in * `features.txt`