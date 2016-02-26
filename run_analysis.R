# run_analysis.R is the code for the Getting and Cleaning data project
# The purpose of this project is to collect, work with, and clean a data set
# following the steps described below.

# data for the project can be found:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


library(plyr)
library(dplyr)

########################### Step 1 ###########################
# Merge the training and the test sets to create one data set.

# reads training variables  
trainActivityID <- read.table('UCI HAR Dataset/train/Y_train.txt') 
subjectTrain <-read.table('UCI HAR Dataset/train/subject_train.txt') 
trainData <- read.table('UCI HAR Dataset/train/X_train.txt')

# reads test variables
testActivityID <- read.table('UCI HAR Dataset/test/y_test.txt')
subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt')
testData <- read.table('UCI HAR Dataset/test/x_test.txt')

# reads the 561 attributes 
features <- read.table('UCI HAR Dataset/features.txt')
features$V2 <- tolower(features$V2)

# assigns variable names to all data sets
colnames(subjectTrain) <- "subject"
colnames(trainData) <- features$V2 
colnames(trainActivityID) <- "activityid"
colnames(subjectTest) <- "subject"
colnames(testData) <-  features$V2 
colnames(testActivityID) <- "activityid"

# create complete training and test data sets. Adds subject variable and activityId 
trainDataBind <- cbind(trainData,subjectTrain,trainActivityID)
testDataBind <- cbind(testData,subjectTest,testActivityID)

# train and test data merged into one data set
mergedData <- rbind(trainDataBind,testDataBind)


########################### Step 2 ###########################
# Extract only the measurements on the mean and standard deviation for each measurement

mergedDataNames <- names(mergedData) 
meanVars <- grep("mean",tolower(mergedDataNames),value=TRUE)
sdVars <- grep("std",tolower(mergedDataNames),value=TRUE)
subActNames <- c("activityid","subject") # include subject and activityId variables needed in step 3
meanSdNames <- c(meanVars,sdVars,subActNames)
meanAndSd <- mergedData[, meanSdNames]


########################### Step 3 ###########################
# Uses descriptive activity names to name the activities in the data set

# reads the 6 activity names 
activityLabels <-read.table('UCI HAR Dataset/activity_labels.txt')
activityLabels$V2 <- tolower(activityLabels$V2)
meanAndSd <- merge(meanAndSd,activityLabels,by.x="activityid",by.y="V1",all=TRUE)

########################### Step 4 ###########################
# Appropriately labels the data set with descriptive variable names

meanSdDataLabels <- colnames(meanAndSd) # get column names

#eliminate () and susbtitute std with stdev, f with freq, t with time
meanSdDataLabels <- sub("\\()","",meanSdDataLabels)
meanSdDataLabels <- sub("std","stdev",meanSdDataLabels)
meanSdDataLabels <- sub("^(f)","freq-",meanSdDataLabels)
meanSdDataLabels <- sub("^(t)","time-",meanSdDataLabels)
meanSdDataLabels <- sub("V2","activity",meanSdDataLabels)
colnames(meanAndSd) <- meanSdDataLabels


########################### Step 5 ###########################
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

# remove 'activitiyid' column
meanAndSd <- subset(meanAndSd, select=-c(activityid))
tidyDataSet <- ddply(meanAndSd, c("subject","activity"), numcolwise(mean)) 

# Export the tidyData set 
write.table(tidyDataSet, 'TidyData/tidyData.txt',sep='\t')
