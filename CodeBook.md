# Introduction

The script `run_analysis.R`performs the 5 steps described in the assignment. By running this script, it will create a  folder named 'data' in the current working directory of R or RStudio depending where you run the script. It will also download and extract the zip file in this folder. The name of the downloaded dataset is UCI HAR Dataset for University of California, Irvine, Human Activity Recognition using Smartphones Dataset. All the similar data is merged using the `rbind()` function. After extracting these columns, they are given the correct names, taken from `features.txt`.
Activity names and IDs are taken from `activity_labels.txt` and they are substituted in the dataset. Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called `secondTidy.txt`, and uploaded to this repository.
 

# Study Design

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data was collected from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For the project, the data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Code Book

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `features` contains the correct names for the features.
* A similar approach is taken with activity names through the `activityLabels` variable.
* `merge_train` is the cbind of all the training data.
* `merge_test` is the cbind of all the testing data.
* `mergedAllData` merges `merge_train`and `merge_test` in a big dataset.
* `colNames` is a vector containing the column names of `mergedAllData`.
* `MeanAndStdOnly` is  `mergedAllData` extracting only the measurements on the mean and standard deviation for each measurement.
* `withActivityNames` is the combination of `meanAndStdOnly`, `activityLabels` by `activityId`.
* `secondTidy` contains the relevant averages which will be later stored in a `secondTidy.txt` file. 
