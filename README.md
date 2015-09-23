## Course Project - Getting-Cleaning-Data

### Assignment : Analysis of Human Activity Recognition using Smartphones Dataset Version 1.0

### Objective: The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
#The goal is to prepare tidy data that can be used for later analysis

### Expectations : One R script called run_analysis.R that does the following. 
      1. Merges the training and the test sets to create one data set.
      2. Extracts only the measurements on the mean and standard deviation 
         for each measurement. 
      3. Uses descriptive activity names to name the activities in the data set
      4. Appropriately labels the data set with descriptive variable names. 
      5. From the data set in step 4, creates a second, independent tidy data set 
         with the average of each variable for each activity and each subject.

### Approch:The entire exercise is divided into 6 parts. All the parts are explained below

### Part 1 deals with extracting data from zip files to data tables
      Part -1 , section 1: Extracting train data into data tables
      Part -1 , section 2: Extracting test data into data tables
      part -1 , Section 3: Extracting activity labels and features

### Part 2 deals with extracting only the measurements on the mean and standard deviation for each measurement
      Part -2 , section 1: Converting the factor variables to characters as we need to use gsub and grep functions which can be only applied to charecters fields
      Part -2 , Section 2: Extracting mean and standard dev data using 'grep' & gsub
function

### Part 3: Deals with preparing the Datasets with relevant information i.e mean & standard dev

### Part 4: Deals with Merging test and train data sets using rbind functions. 
      In the same part we also assign we try to address Appropriately labels the data set with descriptive variable names.

### Part 5: Deals with converting the activity and subject columns  to factor from character ( refer Part 2 : Section 1)

### Part 6: Deals with the creation of a second, independent tidy data set with  the average of each variable for each activity and each subject and writing the dataset in a text file.
