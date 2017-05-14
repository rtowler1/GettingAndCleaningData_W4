library(dplyr)
library(data.table)

##
## Directories 
## 
rootpath      <- "C:/Users/robert.towler/Documents/Data Science - Cousera/GetData/W4/Smart"
datapath      <- "./data"
srcpath       <- "./src"

setwd(rootpath)

##
## Data files
##
testdx       <- "./test/X_test.txt" 
testdy       <- "./test/Y_test.txt"
testSubject  <- "./test/subject_test.txt"
traindx      <- "./train/X_train.txt"
traindy      <- "./train/Y_train.txt"
trainSubject <- "./train/subject_train.txt"
feat         <- "./features.txt"
act          <- "./activity_labels.txt"


if(!file.exists(datapath)) {
        dir.create(datapath)
}
setwd(datapath)

#
# Put together the TEST data files into a single test data file
# Create a file with the Subject ID as 1st column, Activity ID as 2nd column
# follow by all the variable data.
#
testSubjectIDs   <- read.table(testSubject)
testYActivityIDs <- read.table(testdy, quote="\"", stringsAsFactors = FALSE)
testXVariables   <- read.table(testdx, quote="\"", stringsAsFactors = FALSE)
allTest <- cbind(testSubjectIDs, testYActivityIDs, testXVariables)

#
# Put together the TRAINING data files into a single test data file
# Create a file with the Subject ID as 1st column, Activity ID as 2nd column
# follow by all the variable data.
#
trainSubjectIDs   <- read.table(trainSubject)
trainYActivityIDs <- read.table(traindy, quote="\"", stringsAsFactors = FALSE)
trainXVariables   <- read.table(traindx, quote="\"", stringsAsFactors = FALSE)
allTrain <- cbind(trainSubjectIDs, trainYActivityIDs, trainXVariables)

#
# Create a single data frame, that combines the TEST and TRAINING data frames.
#
allData  <- rbind(allTrain, allTest)

#
# Read in the Variabke names (FEATURES) and the Activity IDs and the descriptive values.
#
features   <- read.table(feat, quote="\"", stringsAsFactors = FALSE)
activities <- read.table(act, quote="\"", stringsAsFactors = FALSE)

#
# Replace all the variabkle names with lowercase names that have all the non
# alphanumeric characters removed.
#
features[,2] <- tolower(features[,2])
features[,2] <- gsub("[-()\\,]", "", features[,2])
f <- c("subjectid", "activity", features[,2])

#
# Set the variable names in the data frame.
#
names(allData) <- f

#
# Replace the activity ID values (1 through 6) with their decriptive category names.
#
allData$activity[allData$activity==1] <- "WALKING"
allData$activity[allData$activity==2] <- "WALKING_UPSTAIRS"
allData$activity[allData$activity==3] <- "WALKING_DOWNSTAIRS"
allData$activity[allData$activity==4] <- "SITTING"
allData$activity[allData$activity==5] <- "STANDING"
allData$activity[allData$activity==6] <- "LAYING"

#
# Need to drop all the varianbles that are not either for mean or standard deviation
# Get the indices of the subjectid, activity and all the columns that are mean's or std's
#
idx <- grep("subjectid|activity|mean|std", names(allData))
ds <- allData[,idx]

#
# Summarize the data grouped by the subjectid and the activity
# to produce a compact tidy data set.
# lapply(.SD, mean) applys the mean function to all the columns in the subset of the data
# (that is all columns not being used in group by, so excluding subjectid & activity)
#
dt <- data.table(ds)
sd <- dt[, lapply(.SD, mean), by = c("subjectid","activity")]

f <- paste( "mean_", names(sd), sep = "")
f[1] <- "subjectid"
f[2] <- "activity"
names(sd) <- f
 
#
# Save the summarized data.
#
write.table(sd, "tidy_data.txt", sep=",", row.name=FALSE)
#
# Return to the "root" directory from the "data" directory.
#
setwd("..")
