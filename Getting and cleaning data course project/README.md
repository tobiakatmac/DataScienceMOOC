README.md
=========
Getting and Cleaning Data Course Project
----------------------------------------

Description of R script called run_analysis.R
NOTE: data frames are denoted by *data frame*

*Setting of work directory to parent data folder "UCI HAR Dataset"

#### Loading of test data ####
* Load participant ID from "subject_test.txt"
* Load activity from "y_test.txt" and rename number labels to description 
* Create data frame *test* which will contain participant ID, activity and data from folder "Inertial signals"
* Assign participant ID and activity to *test*
* Load data from folder "Intertial signals" containing the sensor signals (accelerometer, gyroscope and total)
* Take mean and standard deviation over one window. 
NOTE: Sensor signals are sampled in fixed-width sliding windows of 2.56 sec with 128 readings/window.
* Name the variables of *test*

#### Loading of train data ####
* Repeat steps for loading of test data

#### Create new data frame *data* to merge train and test data #### 

#### Group and summarize *data* #### 
* Create new data frames *dataID* and *dataActiv* to group data by participant ID and by acitivity using the dplyr package
* Summarize grouped data *dataID* and *dataActiv* using summarize() and merge them in the data frame *dataSummary*
* NOTE: *dataSummary* is not strictly a "tidy" data set as participant ID and activity are listed in one column. However, like this all the elements of the groups are in one column. 

#### Export data frames *data* and *dataSummary* to .txt files ####