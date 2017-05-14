-----------------------------------------------------------------
README file for Coursera / John Hopkins Getting and Cleaning Data Week 4 project
-----------------------------------------------------------------
Robert Towler 
-----------------------------------------------------------------

## Introduction
This README file describes the files submitted for this project   and the analysis / processing steps used to create the final tidy   data set. This exercise is based on the Human Activity   Recognition Using Smartphones Dataset (Version 1.0) data set   from Universit? degli Studi di Genova.

## Files
README.MD		- this file  
codebook.md	- contains the variable names and the  					  descriptions of each variable and their units.  
tidy_data.txt	- CSV file containing the tidy data set.  
run_analysis.R	- R program that reads the source files, and  				  creates the summary tidy data set as output.  

## RAW data set source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Raw files description
The files in the training and test data sets are split into
	* 1 file for subject ID's (1 subject ID per observation)
	* 1 file for activity ID's (1 activity ID per observation)
	* 1 file for of variable data (561 variables)

Seperately there is a single file that contains the translation from the activity IDs to the labels that represent each activity.

## Processing steps

Unzip the RAW data files, the RAW files are split into seperate training and test data sets.

For the test data set.  
	* Read SubjectID file ("./test/subject_test.txt").  
	* Read Activity file ("./test/Y_test.txt").  
	* Read Variables file ("./test/X_test.txt").  

'''
testSubjectIDs   <- read.table(testSubject)
testYActivityIDs <- read.table(testdy, quote="\"", stringsAsFactors = FALSE)
testXVariables   <- read.table(testdx, quote="\"", stringsAsFactors = FALSE)
'''

Create a single file by using the cbind command, that places the subject ID in column 1, activity ID in column 2, followed by the columns of variable data.

'''
allTest <- cbind(testSubjectIDs, testYActivityIDs, testXVariables)
'''

For the training data set.  
	* Read SubjectID file ("./train/subject_train.txt").  
	* Read Activity file ("./train/Y_train.txt").  
	* Read Variables file ("./train/X_train.txt").  

'''
trainSubjectIDs   <- read.table(trainSubject)
trainYActivityIDs <- read.table(traindy, quote="\"", stringsAsFactors = FALSE)
trainXVariables   <- read.table(traindx, quote="\"", stringsAsFactors = FALSE)
'''

Create a single file by using the cbind command, that places the subject ID in column 1, activity ID in column 2, followed by the columns of variable data.

'''
allTrain <- cbind(trainSubjectIDs, trainYActivityIDs, trainXVariables)
'''

Using the 2 files created from the training and test data sets, create a single file that contains both the test and training data using the rbind command.

'''
allData  <- rbind(allTrain, allTest)
'''

Read in the features (variable names) and the activity ID to label  translation table.

'''
features   <- read.table(feat, quote="\"", stringsAsFactors = FALSE)
activities <- read.table(act, quote="\"", stringsAsFactors = FALSE)
'''

Now convert the feature names to lowercase and remove the underscore, brace and comma characters from the names. Then create a vector containing the variable names set the variable names on the complete data set.

'''
features[,2] <- tolower(features[,2])
features[,2] <- gsub("[-()\\,]", "", features[,2])
f <- c("subjectid", "activity", features[,2])
names(allData) <- f
'''

Replace the activity ID's in column 2 with the labels from the activity to activity ID translation table.

The exercise only requires the variables that are assocaited with mean's and standard deviations (std) from the data set. This code will find the indexes for the subjectid and activity columns along with any column that hasd mean or std in it's name. Then this vector of indexes is used to extract only those columns from the complete data set. This reduces the data set from 563 columns to 88

'''
idx <- grep("subjectid|activity|mean|std", names(allData))
ds <- allData[,idx]
'''

Next convert the data farme to a data table and apply the lapply command with the ".SD" command and the function set to mean and the "by" parameter set to the vector of the subjectif and activity fields. This results in a summarized tidy data set of 88 columns by 180 rows. where each variable is the average of all the measurements for the specific subject and activity combination. each subject, activity combination appears in only 1 row in the tiody data set.

'''
dt <- data.table(ds)
sd <- dt[, lapply(.SD, mean), by = c("subjectid","activity")]
'''

Finally write the summarized tidy data to a comma seperated file

'''
write.table(sd, "small_tidy_data.txt", sep=",", row.name=FALSE)
'''