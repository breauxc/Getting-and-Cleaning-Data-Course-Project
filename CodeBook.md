---
title: "CodeBook for UCI HAR dataset"
output: html_document
---

The UCI HAR dataset is from a group of wearable computing experiments measuring the actions of group of volunteers carrying a smartphone.

From the readme explaining the source data:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The source data included a number of variables estimated from each of the signals, but for the purposes of this data extraction, we have kept only mean and standard deviation for each variable.

The overall data is 10299 observations of 68 variables. A description of each feature is listed below. 

### ID variables

The following two variables identify the volunteer and the action.

* subjectID

An integer between 1-30 identifying the volunteer performing the action. 

* activity.name

The activity id was transformed from an id to a factor describing the activity performed while the observations were recorded.
Factor levels: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### Time domain factors

The following variables measure the time domain response of the signals from the accelerometer and the gyroscope.
In the summary dataset, these values are the averages over all observations for a particular subject and activity.


* tBodyAccelerometer-mean()-X-axisSignal
* tBodyAccelerometer-mean()-Y-axisSignal
* tBodyAccelerometer-mean()-Z-axisSignal
* tBodyAccelerometer-std()-X-axisSignal     
* tBodyAccelerometer-std()-Y-axisSignal
* tBodyAccelerometer-std()-Z-axisSignal

Body component of the accelerometer signal (mean, standard deviation) in a single (X,Y,Z) axis from the phone.
Data has been been normalized and is bounded between [-1,1].

* tGravityAccelerometer-mean()-X-axisSignal 
* tGravityAccelerometer-mean()-Y-axisSignal
* tGravityAccelerometer-mean()-Z-axisSignal
* tGravityAccelerometer-std()-X-axisSignal  
* tGravityAccelerometer-std()-Y-axisSignal
* tGravityAccelerometer-std()-Z-axisSignal

Gravity component of the accelerometer signal (mean, standard deviation) in a single (X,Y,Z) axis from the phone.
Data has been been normalized and is bounded between [-1,1].

* tBodyAccelerometerJerk-mean()-X-axisSignal
* tBodyAccelerometerJerk-mean()-Y-axisSignal
* tBodyAccelerometerJerk-mean()-Z-axisSignal
* tBodyAccelerometerJerk-std()-X-axisSignal 
* tBodyAccelerometerJerk-std()-Y-axisSignal
* tBodyAccelerometerJerk-std()-Z-axisSignal

Jerk of the body as measured by the accelerometer signal (mean, standard deviation) in a single (X,Y,Z) phone axis.
Data has been been normalized and is bounded between [-1,1].

* tBodyGyroscope-mean()-X-axisSignal        
* tBodyGyroscope-mean()-Y-axisSignal
* tBodyGyroscope-mean()-Z-axisSignal
* tBodyGyroscope-std()-X-axisSignal         
* tBodyGyroscope-std()-Y-axisSignal
* tBodyGyroscope-std()-Z-axisSignal

Movement of the body as measured by the gyroscope signal (mean, standard deviation) in a single (X,Y,Z) phone axis.
Data has been been normalized and is bounded between [-1,1].

* tBodyGyroscopeJerk-mean()-X-axisSignal    
* tBodyGyroscopeJerk-mean()-Y-axisSignal
* tBodyGyroscopeJerk-mean()-Z-axisSignal
* tBodyGyroscopeJerk-std()-X-axisSignal     
* tBodyGyroscopeJerk-std()-Y-axisSignal
* tBodyGyroscopeJerk-std()-Z-axisSignal

Jerk of the body as measured by the gyroscope signal (mean, standard deviation) in a single (X,Y,Z) phone axis.
Data has been been normalized and is bounded between [-1,1].

* tBodyAccelerometerMagnitude-mean()        
* tBodyAccelerometerMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the body component of the accelerometer signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* tGravityAccelerometerMagnitude-mean()
* tGravityAccelerometerMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the gravity component of the accelerometer signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* tBodyAccelerometerJerkMagnitude-mean()
* tBodyAccelerometerJerkMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the jerk of the body measured in the accelerometer signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* tBodyGyroscopeMagnitude-mean()            
* tBodyGyroscopeMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the movement of the body as measured by the gyroscope signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* tBodyGyroscopeJerkMagnitude-mean()
* tBodyGyroscopeJerkMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the jerk of the body as measured by the gyroscope signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

### Frequency domain factors

The following variables measure the frequency domain response of the signals from the accelerometer and the gyroscope (as obtained through Fourier transform)
In the summary dataset, these values are the averages over all observations for a particular subject and activity.

* fBodyAccelerometer-mean()-X-axisSignal
* fBodyAccelerometer-mean()-Y-axisSignal
* fBodyAccelerometer-mean()-Z-axisSignal    
* fBodyAccelerometer-std()-X-axisSignal
* fBodyAccelerometer-std()-Y-axisSignal
* fBodyAccelerometer-std()-Z-axisSignal

Body component of the accelerometer signal (mean, standard deviation) in a single (X,Y,Z) axis from the phone.
Data has been been normalized and is bounded between [-1,1].

* fBodyAccelerometerJerk-mean()-X-axisSignal
* fBodyAccelerometerJerk-mean()-Y-axisSignal
* fBodyAccelerometerJerk-mean()-Z-axisSignal
* fBodyAccelerometerJerk-std()-X-axisSignal
* fBodyAccelerometerJerk-std()-Y-axisSignal
* fBodyAccelerometerJerk-std()-Z-axisSignal

Jerk of the body as measured by the accelerometer signal (mean, standard deviation) in a single (X,Y,Z) phone axis.
Data has been been normalized and is bounded between [-1,1].

* fBodyGyroscope-mean()-X-axisSignal
* fBodyGyroscope-mean()-Y-axisSignal
* fBodyGyroscope-mean()-Z-axisSignal        
* fBodyGyroscope-std()-X-axisSignal
* fBodyGyroscope-std()-Y-axisSignal
* fBodyGyroscope-std()-Z-axisSignal

Movement of the body as measured by the gyroscope signal (mean, standard deviation) in a single (X,Y,Z) phone axis.
Data has been been normalized and is bounded between [-1,1].

* fBodyAccelerometerMagnitude-mean()
* fBodyAccelerometerMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the body component of the accelerometer signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* fBodyAccelerometerJerkMagnitude-mean()    
* fBodyAccelerometerJerkMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the jerk of the body measured in the accelerometer signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* fBodyGyroscopeMagnitude-mean()
* fBodyGyroscopeMagnitude-std()   

Absolute magnitude, as measured by the Euclidean norm, of the movement of the body as measured by the gyroscope signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].

* fBodyGyroscopeJerkMagnitude-mean()
* fBodyGyroscopeJerkMagnitude-std()

Absolute magnitude, as measured by the Euclidean norm, of the jerk of the body as measured by the gyroscope signal (mean, standard deviation).
Data has been been normalized and is bounded between [-1,1].