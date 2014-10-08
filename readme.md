---
title: "Readme"
output: html_document
---

The github project contains three files:


1. run_analysis.R -- a script that generates two tidy datasets: CleanedData.txt and SummaryData.txt
2. CodeBook.md -- a markdown file that explains the variables included in the above datasets
3. readme.R -- a markdown file that primarily explains how the run_analysis.R script works


The goal of the assignment was as follows:

>You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The run_analysis script accomplishes this in the following way.

First, the document is programmatically downloaded from the web and unzipped. A timestamp file "UCI HAR dataset timestamp.txt" is generated to indicate the time the files were downloaded. The script assumes that if the folder containing the raw UCI HAR data exists, then the required data is present, so that there is no need to repeat the download.

Next, the subjectID data is read and merged (from training and test sets). This is straightforward.

Then the activities data is read and merged (from training and test sets). 
The activity values are given as IDs, 1-6, so we need to extract the lookup table that allows us to map this data to the activity names. Once the names are appropriately mapped and sorted (to preserve the original ordering), the ids are discarded, leaving only an appropriate vector of activity names. This accomplishes task 3 from the assignment.

Next, the feature data is read and merged (from training and test sets). This accomplishes task 1.

We need to extract out the columns that we are interested in (mean and standard deviations). To do this, we first read in the file containing the (terse) descriptions of the columns. The terse descriptions are expanded upon, making them more easily understood ( for task 4 ). Then we use grep to extract the columns which contain either 'mean()' or 'std()', for task 2.

At this point, binding the subjectId vector, Activities vector, and the condensed feature data results in a tidy dataset containing the full 10299 observations. This dataset is output as CleanedData.txt.

The last task is to generate a second tidy dataset which contains the average of each variable for each activity and each subject.

This is accomplished by melting the original dataset into a 4 by 679734 thin dataset, keeping the subjectID and activities variables as identifiers, and using the handy dcast function to aggregate results. This completes task 5.

The resulting dataset is 180 by 68, with one row for each combination of subject and activity (6*30).



