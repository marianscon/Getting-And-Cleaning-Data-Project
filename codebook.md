## Codebook for run_analysis.R

This file contains information about the variables and summaries calculated, along with units, 
and any other relevant information.

The experiments have been carried out with a group of 30 volunteers. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on their waist. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## variables in run_analysis.R

* features - contains 561 variables with time and frequency domain variables derived from the two dependent measures, 
3-axial linear acceleration and 3-axial angular velocity (tAcc-XYZ and tGyro-XYZ)

* activityLabels - contains the 6 activity names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* trainData - contains all the training data (7352 obs of 561 variables)

* trainActivityID - contains activity IDs for the training set

* subjectTrain - contains observations/subject in the training partition (21 subjects, 7352 total obs).

* testActivityID - contains activity IDs for test set 

* subjectTest - contains observations/subject in the test partition (9 subjects for a total of 2947 observations)

* testData data - contains all the test data (2947 obs of 561 variables)

## Resulting tidy data set

run_analysis.R:
* follows the transformations described on README.md to prepare a tidy data set 
* saves it to a file called: TidyData/tidyData.txt on your working directory, and
* contains 86 computed mean and standard deviation numeric variables and the subject 
and activity character variables

