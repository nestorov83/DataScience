##get the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "download.zip", method = "curl")
if(!file.exists("data")){dir.create("data")}
unzip("download.zip", exdir = "data")
setwd("data")

##read in common information for train/test
features <- read.table("UCI HAR Dataset/features.txt", quote="\"")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")

##read smaller dataset  X_test
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")

##add column names to X_test
colnames(X_test) <- c(as.character(features[,2]))


##add activity (replace coding) to X_tets
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
y_test <- sqldf("select * from y_test left join activity_labels using (V1)")
X_test$activityName <- as.character(y_test[,2])

##add subject number to X_test as an additional variable
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", na.strings = "", quote="\"")
X_test$subject <- subject_test[,1]

## repeat for X_train (in the same order!)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
y_train <- sqldf("select * from y_train left join activity_labels using (V1)")
X_train$activityName <- as.character(y_train[,2])
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", na.strings = "", quote="\"")
X_train$subject <- subject_train[,1]

##merge the two datasets
names(X_train) <- names(X_test)
X_all <- rbind(X_test, X_train)

##rename columns with duplicated names
unique.names <- c(make.names((names(X_all)), unique=T))
names(X_all) <- c(unique.names)


##select columns with mean/std
X_all_mean_std <- select(X_all, contains("mean"), contains("std"), contains("activityName"), contains("subject"))

##group by Activity and Subject
byActSubj <- group_by(X_all_mean_std, activityName, subject)

##calculate means for each variable
X_sum_mean <- summarise_each(byActSubj, funs(mean))

##write table
write.table(X_sum_mean, file = "SamsungData_MeanOfMean_byActivitySubject.txt", row.names=FALSE, col.names=T)





