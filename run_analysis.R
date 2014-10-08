rm(list = ls())
library(reshape2)

### Download and unzip the dataset. This script will also generate a text file recording the timestamp of the download.

if(!file.exists("UCI HAR Dataset")){
    
    download = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(download,"UCI HAR dataset.zip")
    unzip("UCI HAR dataset.zip")
    
    dateDownloaded = date()
    timestamp = paste0("The UCI HAR dataset was downloaded from ", download, " on ",dateDownloaded,".")
    write.table(timestamp, file = "UCI HAR dataset timestamp.txt", row.names= FALSE, col.names = FALSE, quote = FALSE)

}

### Extract subjectID for each record

subjectID.train = read.table("UCI HAR Dataset\\Train\\subject_train.txt")
subjectID.test = read.table("UCI HAR Dataset\\Test\\subject_test.txt")
subjectID = rbind(subjectID.train,subjectID.test)
colnames(subjectID)= "subjectID"

### Extract activity labelID for each record

labelID.train = read.table("UCI HAR Dataset\\Train\\y_train.txt")
labelID.test = read.table("UCI HAR Dataset\\Test\\y_test.txt")
labelID = rbind(labelID.train,labelID.test)

### Replace labelID with descriptive activity name
# Note: We bind a row containing the row number in order to recover the original order after merging

labelID = cbind(1:nrow(labelID),labelID)
activity.labels = read.table("UCI HAR Dataset\\activity_labels.txt")
activity.name = merge(labelID,activity.labels, by.x=2, by.y=1)
activity.name = activity.name[order(activity.name[,2]),3]

### Extract feature data for each record

fdata.train = read.table("UCI HAR Dataset\\Train\\x_train.txt")
fdata.test = read.table("UCI HAR Dataset\\Test\\x_test.txt")
fdata = rbind(fdata.train,fdata.test)
rm(fdata.train)
rm(fdata.test)

### Extract feature names

feature.names = read.table("UCI HAR Dataset\\features.txt")
feature.names = as.character(feature.names[,2])

### Replace abbreviations in the feature names with more descriptive variable names


feature.names = gsub("Acc","Accelerometer",feature.names)
feature.names = gsub("Gyro","Gyroscope",feature.names)
feature.names = gsub("-X","-X-axisSignal",feature.names)
feature.names = gsub("-Y","-Y-axisSignal",feature.names)
feature.names = gsub("-Z","-Z-axisSignal",feature.names)
feature.names = gsub("Mag","Magnitude",feature.names)

# Based on the feature_info included with the data, the duplication "BodyBody" is a mistake in the feature list.
feature.names = gsub("BodyBody","Body",feature.names) 


### Restrict data to only the measurements on the mean and standard deviation for each measurement.

keep.cols = grep("mean\\(\\)|std\\(\\)",feature.names)
fdata = fdata[,keep.cols]
colnames(fdata) <- feature.names[keep.cols]

### Bind the extracted data together
cleaned.data = cbind(subjectID,activity.name,fdata)
cleaned.data = cleaned.data[order(subjectID,activity.name),]
write.table(cleaned.data,"CleanedData.txt", row.names=FALSE)
rm(fdata)

###################################################################################################################################
###                                                                                                                             ###
###  Output #1: cleaned.data -- Tidy dataset containing the mean and standard deviation features for each observation record    ###
###                                                                                                                             ###
###################################################################################################################################


##### Aggregate data for each subject and activity, keeping only the average of each variable.
dataMelt = melt(cleaned.data,id.vars=c("subjectID","activity.name"), measure.vars = -(1:2))
summary.data = dcast(dataMelt, subjectID + activity.name ~ variable,mean)

write.table(summary.data,"SummaryData.txt", row.names=FALSE)

###################################################################################################################################
###                                                                                                                             ###
###  Output #2: summary.data -- Tidy summary dataset containing average feature value for each subject and for each activity    ###
###                                                                                                                             ###
###################################################################################################################################
