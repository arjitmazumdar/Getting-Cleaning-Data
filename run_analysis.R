##===================================================================================================
  ### Assignment : Analysis of Human Activity Recognition 
  ##Using Smartphones Dataset Version 1.0

## Objective: The purpose of this project is to demonstrate the ability 
# to collect, work with, and clean a data set.
#The goal is to prepare tidy data that can be used for later analysis
##===================================================================================================

### Credits:  Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), 
## Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
##1 - Smartlab - Non-Linear Complex Systems Laboratory
##DITEN - Università  degli Studi di Genova, Genoa (I-16145), Italy. 
##2 - CETpD - Technical Research Centre for Dependency Care 
##and Autonomous Living
##Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i
##la Geltrú (08800), Spain
##activityrecognition '@' smartlab.ws 
##===================================================================================================
  
### Dependency: reshape2 library for melt and cast functions
library(reshape2)


### Part 1: Extracting data from zip files to data tables

###Section 1: Extracting train data into data tables
subject_train_data<-read.table('UCI HAR Dataset/train/subject_train.txt')

X_train_data<-read.table("UCI HAR Dataset/train/X_train.txt")


y_train_data<-read.table("UCI HAR Dataset/train/y_train.txt")

######### End Of Section 1: Extracting train data into data tables ######

### Section 2: Extracting test data into data tables

subject_test_data<-read.table("UCI HAR Dataset/test/subject_test.txt")

X_test_data<-read.table("UCI HAR Dataset/test/X_test.txt")

y_test_data<-read.table("UCI HAR Dataset/test/y_test.txt")

### End of Section 2: Extracting test data into data tables

#####Section 3: Loading activity labels and features 

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

features<-read.table("UCI HAR Dataset/features.txt")
####  End of Section 3: Loading activity labels and features

### End of Part 1: Extracting data from zip files to data tables##


### Part 2: Extracting only the measurements on the mean and standard deviation
##for each measurement##

## Approach : Since the features dataset contains lot of details
# apart from mean and standard deviation
# we need to extract only those data from the dataset

## Section 1: converting the factor variables to characters

activity_labels[,2]<-as.character(activity_labels[,2])

features[,2]<-as.character(features[,2])

## End of Section 1: converting the factor variables to characters

## Section 2: Extracting mean and standard dev data using 'grep' & gsub
## function

features_included <- grep(".*mean.*|.*std.*", features[,2])
features_included.names <- features[features_included,2]
features_included.names = gsub('-mean', 'Mean', features_included.names)
features_included.names = gsub('-std', 'Standard Dev', features_included.names)
features_included.names <- gsub('[-()]', '', features_included.names)


## End of Section 2: Extracting mean and standard dev data using 'grep' & gsub
## function

### End of Part 2: Extracting only the measurements on the mean and 
## standard deviation for each measurement##


## Part 3 : Preparing the Datasets with relevant information i.e mean & 
## standard dev

train_dataset<-cbind(subject_train_data,y_train_data,X_train_data[features_included])
test_dataset<- cbind(subject_test_data,y_test_data,X_test_data[features_included])

## End of Part 3 : Preparing the Datasets with relevant information i.e mean & 
## standard dev


## Part 4 : Merging Datasets

final_data<-rbind(train_dataset,test_dataset)
colnames(final_data)<-c("Subject","Activity",features_included)

## End of Part 4 : Merging Datasets

## Part 5 : Converting the activity and subject  to factor columns
# from character ( refer Part 2 : Section 1)
final_data$Activity<- factor(final_data$Activity, levels=activity_labels[,1],
                             labels=activity_labels[,2])

final_data$Subject<- as.factor(final_data$Subject)

### Part 6: Creating a second, independent tidy data set with the average of 
## each variable for each activity and each subject and writing the dataset
# in a text file.

final_data.melted <- melt(final_data, id = c("Subject", "Activity"))
final_data.mean <- dcast(final_data.melted, Subject + Activity ~ variable, mean)
write.table(final_data.mean,file="final_dataset.txt", row.names=FALSE)