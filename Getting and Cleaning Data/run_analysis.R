## Please ensure that the folder containing the data is extracted into working directory
## Also, ensure that sufficient permission is provided to the script to explore the file directories

if(!file.exists("UCI HAR Dataset")){
  stop("Extracted Data file not available")
}

## Not required for submission
# if(!require("data.table")){
#   install.packages("data.table")
#   library(data.table)
# }

## Enter folder and begin extracting data
setwd("./UCI HAR Dataset")

## Extract data outside of test/train folders
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

## Extract test datasets
setwd("./test")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
setwd("..")

## Extract train datasets
setwd("./train")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")
setwd("..")
setwd("..")

## Begin processing

## Create label vectors
activity_labels_vector<-as.vector(activity_labels[,2])
features_vector<-as.vector(features[,2])
features_vector<-c("Subject", "Activity", features_vector)
y_test_vector<-as.vector(y_test[,1])
y_train_vector<-y_train[,1]

## Alter activities from numeric to descriptive
y_test_factor<-factor(y_test_vector, labels=activity_labels_vector)
y_train_factor<-factor(y_train_vector, labels=activity_labels_vector)

## Combine the X_test, subject_test and y_test together
test_data<-cbind(subject_test, y_test_factor, X_test)
names(test_data)[2]<-"Act"

## Combine the X_train, subject_train and y_train together
train_data<-cbind(subject_train, y_train_factor, X_train)
names(train_data)[2]<-"Act"

## Combine both test and train sets
combined_data<-rbind(test_data, train_data)

## Filter out mean and std and first 2 columns
## This filter is to remove the columns, not rows
sub_act_label_filter<-c(rep(TRUE, 2), rep(FALSE, 561))
mean_label_filter<-grepl("mean", features_vector)
std_label_filter<-grepl("std", features_vector)
combined_filter<-sub_act_label_filter | mean_label_filter | std_label_filter

## Altering the names of the dataset and putting in the filters
names(combined_data)<-features_vector
filtered_combined_data<-combined_data[,combined_filter]
write.table(DT_final, "Combined data.txt", sep= " ", row.names=FALSE)

## Utilize the data.table package for rapid rollup of data
## This section is commented out as it is not required.
# DT<-as.data.table(filtered_combined_data)
# setkey(DT, "Subject", "Activity")
# DT_final<-DT[,lapply(.SD,mean),by=key(DT)]
# 
# setwd("..")
# write.table(DT_final, "Tidy data.txt", sep= " ", row.names=FALSE)
