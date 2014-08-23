#Codebook for TidyDataSet.txt

##Source

This dataset is derived from the dataset *Human Activity Recognition Using Smartphones Dataset* 

A full description of this data set is given here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used to derive TidyDataSet.txt were downloaded for Getting and Cleaning data course project from :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The README file within this archive gives a description of the data.

##features of TidtDataSet.txt
The data set contains 180 records. Columns are:

subject 1..30
        There are 30 subjects

activityname
        WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING
        *each activity appears once per subject*

There are 66 further variables:
        For each of the variable the data set givens the mean value per person+activity from the original dataset.  The variables are:

        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
        ('-XYZ' is used to denote 3 seperate variables X, Y and Z)
        Each of these variables appears twice, once each for 
        mean(): Mean value
        std(): Standard deviation

        These variables are futher explained in the README file of the original dataset.        
##derivation
The method used to derive these values is described in *run_analyis.R*
        

