This repo containst the following files:

* readme.md - this file!

* codebook.md - this file contains information about the variables and summaries calculated, along with units, and any other relevant information

* run_analysis.R - This R script called take the data on: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and prepares a tidy data set by: 

  1. Merging the training and the test sets to create one data set
  2. Extracting only the measurements on the mean and standard deviation for each measurement
  3. Using descriptive activity names to name the activities in the data set
  4. Appropriately labeling the data set with descriptive variable names.
  5. Creates a second, independent tidy data set, from the data set in step 4, with the average of each variable for each      activity and each subject.

the resulting data set is saved to a file called: TidyData/tidyData.txt on your working directory
