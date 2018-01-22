# downloading the dataset
if (!file.exists("./data")) {
  dir.create("./data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/Dataset.zip", method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
list.files("./data")

# reading the training set
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# reading the test set
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# reading the features
features <- read.table('./data/UCI HAR Dataset/features.txt')

# reading activity labels
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# labeling the data set with descriptive variable names.
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# merging the training and the test sets to create one data set.
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
mergedAllData <- rbind(merge_train, merge_test)

# extracting only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(mergedAllData)

mean_and_stdv <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames))

MeanAndStdOnly <- mergedAllData[ , mean_and_stdv == TRUE]


# using descriptive activity names to name the activities in the data set
  withActivityNames <- merge(MeanAndStdOnly, activityLabels, by='activityId', all.x=TRUE)

# creating a second, independent tidy data set with the average of each variable for each activity and each subject.
secondTidy <- aggregate(. ~subjectId + activityId, withActivityNames, mean)
secondTidy <- secondTidy[order(secondTidy$subjectId, secondTidy$activityId),]
write.table(secondTidy, "secondTidy.txt", row.name=FALSE)