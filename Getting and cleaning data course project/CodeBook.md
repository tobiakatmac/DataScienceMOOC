Code book
=========
Getting and Cleaning Data Course Project
----------------------------------------

There are two data set:
1. *data* contains the participant ID, activity and mean & standard deviation over one sliding window of the sensor signals
2. *dataSummary* a summary of the data with the averaged values grouped by participant ID and by activity

regarding 1.:
* The data was loaded separately from the the "train" and "test" data sets and merged together
* The activity number labels were replaced by the description of the activity (walk, walk up, walk down, sit, stand, lay)
* The mean and standard deviation were taken over one window of measurement: sensor signals are sampled in fixed-width sliding windows of 2.56 sec with 128 readings/window.
* The variables of the data frame were named in a descriptive manner

regarding 2.:
* *data* was summarized using the group_by() and summarize() functions of the dplyr package
* *data* was grouped by participant ID and by activity
* *data* was summarized by taking the mean over each element of the groups 
* NOTE: *dataSummary* is not strictly a "tidy" data set as participant ID and activity are listed in one column. However, like this all the elements of the groups are in one column. 

Variables of *data*
1. "participant_ID": number label assigned to each participant (30 in total) 
2. "activity": activity (walk, walk up, walk down, sit, stand, lay) during which the sensor signal was measured
3. "body_acc_x_mean": averaged accelerometer signal over one slicing window measured in x direction 
4. "body_acc_x_sd": standard deviation of accelerometer signal over one slicing window measured in x direction 
5. "body_acc_y_mean": see 3. but in y direction
6. "body_acc_y_sd": see 4. but in y direction
7. "body_acc_z_mean": see 3. but in z direction
8. "body_acc_z_sd": see 4. but in z direction
9. "body_gyro_x_mean": averaged gyroscope signal over one slicing window measured in x direction
10. "body_gyro_x_sd": standard deviation of gyroscope signal over one slicing window measured in x direction 
11. "body_gyro_y_mean": see 9. but in y direction
12. "body_gyro_y_sd": see 10. see but in y direction
13. "body_gyro_z_mean": see 9. but in z direction
14. "body_gyro_z_sd": see 10. but in z direction
15. "total_acc_x_mean": averaged total acceleration over one slicing window measured in x direction
16. "total_acc_x_sd": standard deviation of total acceleration over one slicing window measured in x direction 
17. "total_acc_y_mean": see 15. but in y direction 
18. "total_acc_y_sd": see 16. but in y direction
19. "total_acc_z_mean": see 15. but in z direction 
20. "total_acc_z_sd": see 16. but in z direction

Variables of *dataSummary*
1. "ID/ activity": showing number label or activity
2. to 19. equal to 3. to 20. of *data* but averaged values based on participant or activity specified in 1.