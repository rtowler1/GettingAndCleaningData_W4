----------------------------------------------------------------
Codebook for the summarize tiday data set created from the Human Activity   Recognition Using Smartphones Dataset (Version 1.0) data set   from Universit? degli Studi di Genova.
----------------------------------------------------------------

This codebook is for the processed data file tidy_data.txt

The data set is 180 rows by 88 columns

subjectid		- Subject Identifier
			- Integer, Units None.

activity		- Activity identifier
			- String, Units None.

The following fields in the tidy data set are all derived from the fields in the complete data set.

Each fields represents the mean of the field in the complete data file  but the means are computed over the subject ID and activity.

The complete meaning of each field in the RAW data is specified in in the features_info.txt file supplied with the RAW data. That file is include after this list of variables. The variable names in the tidy data set have been processed to remove non-alphanumeric characters before being prepended with "mean_".

mean_tbodyaccmeanx 
mean_tbodyaccmeany  
mean_tbodyaccmeanz
mean_tbodyaccstdx
mean_tbodyaccstdy
mean_tbodyaccstdz
mean_tgravityaccmeanx
mean_tgravityaccmeany	
mean_tgravityaccmeanz	
mean_tgravityaccstdx	
mean_tgravityaccstdx	 
mean_tgravityaccstdx	
mean_tbodyaccjerkmeanx 
mean_tbodyaccjerkmeany    
mean_tbodyaccjerkmeanz 
mean_tbodyaccjerkstdx	
mean_tbodyaccjerkstdy 
mean_tbodyaccjerkstdz
mean_tbodygyromeanx
mean_tbodygyromeany 
mean_tbodygyromeanz
mean_tbodygyrostdx 
mean_tbodygyrostdy 
mean_tbodygyrostdz
mean_tbodygyrojerkmeanx 
mean_tbodygyrojerkmeany  
mean_tbodygyrojerkmeanz
mean_tbodygyrojerkstdx 
mean_tbodygyrojerkstdy  
mean_tbodygyrojerkstdz
mean_tbodyaccmagmean
mean_tbodyaccmagstd
mean_tgravityaccmagmean
mean_tgravityaccmagstd
mean_tbodyaccjerkmagmean
mean_tbodyaccjerkmagstd
mean_tbodygyromagmean	
mean_tbodygyromagstd
mean_tbodygyrojerkmagmean 
mean_tbodygyrojerkmagstd
mean_fbodyaccmeanx 
mean_fbodyaccmeany  
mean_fbodyaccmeanz
mean_fbodyaccstdx 
mean_fbodyaccstdy  
mean_fbodyaccstdz
mean_fbodyaccmeanfreqx  
mean_fbodyaccmeanfreqy  
mean_fbodyaccmeanfreqz
mean_fbodyaccjerkmeanx  
mean_fbodyaccjerkmeany  
mean_fbodyaccjerkmeanz
mean_fbodyaccjerkstdx	 
mean_fbodyaccjerkstdy	 
mean_fbodyaccjerkstdz
mean_fbodyaccjerkmeanfreqx	 
mean_fbodyaccjerkmeanfreqy	 
mean_fbodyaccjerkmeanfreqz	
mean_fbodygyromeanx	 
mean_fbodygyromeany	 
mean_fbodygyromeanz	
mean_fbodygyrostdx	 
mean_fbodygyrostdy	 
mean_fbodygyrostdz	
mean_fbodygyromeanfreqx  
mean_fbodygyromeanfreqy  
mean_fbodygyromeanfreqz 
mean_fbodyaccmagmean
mean_fbodyaccmagstd	
mean_fbodyaccmagmeanfreq	
mean_fbodybodyaccjerkmagmean   
mean_fbodybodyaccjerkmagmeanfreq 
mean_fbodybodygyromagmean 	
mean_fbodybodygyromagstd  	
mean_fbodybodygyromagmeanfreq  
mean_fbodybodygyrojerkmagmean  
mean_fbodybodygyrojerkmagstd  
mean_fbodybodygyrojerkmagmeanfreq  
mean_angletbodyaccmeangravity  
mean_angletbodyaccjerkmeangravitymean  
mean_angletbodygyromeangravitymean   
mean_angletbodygyrojerkmeangravitymean  
mean_anglexgravitymean  
mean_angleygravitymean  
mean_anglezgravitymean  




Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors. 

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

