###Experiment
* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

* The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


###Data(tidy version)
* The tidy version of the data contains the measurements on the mean and standand deviation for each measurement, which is extracted from the original dataset(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

* Each subject is measured 6 different activities, including laying, sitting, standing, walking, walking downstairs and walking upstairs. For every activity, all the mean and standand deviation of the measurements are listed. 

* The size of the dataset is 180 X 88, in which each subject has 6 activities, so 30 subjects produce 180 records(i.e. 180 rows in the dataset). The 88 columns, also called varilables include 86 mean and std-related measurements, activity name and subject id. 

###Variable
The list of varilables are as followed:
[1] "Subject"                             
 [2] "ActivityName"                        
 [3] "tBodyAcc.mean...X"                   
 [4] "tBodyAcc.mean...Y"                   
 [5] "tBodyAcc.mean...Z"                   
 [6] "tBodyAcc.std...X"                    
 [7] "tBodyAcc.std...Y"                    
 [8] "tBodyAcc.std...Z"                    
 [9] "tGravityAcc.mean...X"                
[10] "tGravityAcc.mean...Y"                
[11] "tGravityAcc.mean...Z"                
[12] "tGravityAcc.std...X"                 
[13] "tGravityAcc.std...Y"                 
[14] "tGravityAcc.std...Z"                 
[15] "tBodyAccJerk.mean...X"               
[16] "tBodyAccJerk.mean...Y"               
[17] "tBodyAccJerk.mean...Z"               
[18] "tBodyAccJerk.std...X"                
[19] "tBodyAccJerk.std...Y"                
[20] "tBodyAccJerk.std...Z"                
[21] "tBodyGyro.mean...X"                  
[22] "tBodyGyro.mean...Y"                  
[23] "tBodyGyro.mean...Z"                  
[24] "tBodyGyro.std...X"                   
[25] "tBodyGyro.std...Y"                   
[26] "tBodyGyro.std...Z"                   
[27] "tBodyGyroJerk.mean...X"              
[28] "tBodyGyroJerk.mean...Y"              
[29] "tBodyGyroJerk.mean...Z"              
[30] "tBodyGyroJerk.std...X"               
[31] "tBodyGyroJerk.std...Y"               
[32] "tBodyGyroJerk.std...Z"               
[33] "tBodyAccMag.mean.."                  
[34] "tBodyAccMag.std.."                   
[35] "tGravityAccMag.mean.."               
[36] "tGravityAccMag.std.."                
[37] "tBodyAccJerkMag.mean.."              
[38] "tBodyAccJerkMag.std.."               
[39] "tBodyGyroMag.mean.."                 
[40] "tBodyGyroMag.std.."                  
[41] "tBodyGyroJerkMag.mean.."             
[42] "tBodyGyroJerkMag.std.."              
[43] "fBodyAcc.mean...X"                   
[44] "fBodyAcc.mean...Y"                   
[45] "fBodyAcc.mean...Z"                   
[46] "fBodyAcc.std...X"                    
[47] "fBodyAcc.std...Y"                    
[48] "fBodyAcc.std...Z"                    
[49] "fBodyAcc.meanFreq...X"               
[50] "fBodyAcc.meanFreq...Y"               
[51] "fBodyAcc.meanFreq...Z"               
[52] "fBodyAccJerk.mean...X"               
[53] "fBodyAccJerk.mean...Y"               
[54] "fBodyAccJerk.mean...Z"               
[55] "fBodyAccJerk.std...X"                
[56] "fBodyAccJerk.std...Y"                
[57] "fBodyAccJerk.std...Z"                
[58] "fBodyAccJerk.meanFreq...X"           
[59] "fBodyAccJerk.meanFreq...Y"           
[60] "fBodyAccJerk.meanFreq...Z"           
[61] "fBodyGyro.mean...X"                  
[62] "fBodyGyro.mean...Y"                  
[63] "fBodyGyro.mean...Z"                  
[64] "fBodyGyro.std...X"                   
[65] "fBodyGyro.std...Y"                   
[66] "fBodyGyro.std...Z"                   
[67] "fBodyGyro.meanFreq...X"              
[68] "fBodyGyro.meanFreq...Y"              
[69] "fBodyGyro.meanFreq...Z"              
[70] "fBodyAccMag.mean.."                  
[71] "fBodyAccMag.std.."                   
[72] "fBodyAccMag.meanFreq.."              
[73] "fBodyBodyAccJerkMag.mean.."          
[74] "fBodyBodyAccJerkMag.std.."           
[75] "fBodyBodyAccJerkMag.meanFreq.."      
[76] "fBodyBodyGyroMag.mean.."             
[77] "fBodyBodyGyroMag.std.."              
[78] "fBodyBodyGyroMag.meanFreq.."         
[79] "fBodyBodyGyroJerkMag.mean.."         
[80] "fBodyBodyGyroJerkMag.std.."          
[81] "fBodyBodyGyroJerkMag.meanFreq.."     
[82] "angle.tBodyAccMean.gravity."         
[83] "angle.tBodyAccJerkMean..gravityMean."
[84] "angle.tBodyGyroMean.gravityMean."    
[85] "angle.tBodyGyroJerkMean.gravityMean."
[86] "angle.X.gravityMean."                
[87] "angle.Y.gravityMean."                
[88] "angle.Z.gravityMean."

###Cleaning precedure
* Read data: Reads all the files required in this assignments into R objects, by function read.table(). These files includes X_train.txt, y_train.txt, X_test.txt, y_test.txt, features.txt, activity_labels.txt, subject_train.txt, subject_test.txt. 
* Merge dataset into one: merge training and testing dataset into one larger dataset using built-in R fuction rbind(). This step produces three datasets: x dataset, y dataset and subject dataset.
* Add columne names to x dataset: doing so in the second step is easier than adding variable names after extracting mean and std-related columens in the later step.
* Extract mean and std-related columns: based on the way that the original columen are named, all the mean and std-related variables are named with either "mean", "Mean" and "std" in the names. Hence, a partial matching approaches is used using the function grep(). eg. grep("[M,n]ean|std", colnames(dataset)). The regular expression means that all the columns that contains words "Mean", "mean", or "std" are selected.
* Replace activity id with actual string type names: the original data use 1-6 as the indication of 6 different activities. The pair-wise information between id and actual activity names are listed in the file "activity_labels.txt". The replacement of id by actual names may produce a clear understanding by just cooliing at the main dataset.
* Create tidy data: This function is achieved by subsetting the data of each subject, subseting each activity and calculating the means. Each activity of a subject is listed as one row. The total 180 rows are inserted into R matrix and write out as a file for persistent storage. Besides,the rows are sorted first based on the subject id, then alphabetically based on the activity names.
* Write out the tidy version of data using write.table() function.
