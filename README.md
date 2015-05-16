# Getting_and_cleaning_data
## Contents
This repository contains instructions how to solve the programming assignment in the coursera class getting and cleaning data.

##Task summary:
The goal of this programming assignment is to analyse raw data found in several files, reduce them to a relevant subset of variables and to create ONE dataset with tidy data (after downloading and unzipping raw data).


###Preparations outside R:
- Download assignment data file and store it in your working directory. The data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Unzip the the data

###Processing steps in R (included in "run_analysis.R" - executed in the working directory)
- identify task-relevant files in raw data
- merge test- and training-files (types: subject-info (subject_[test/train].txt), activity-info (y_[test/train].txt), measures (X_[test/train].txt)) into one recordset 
- reduce the measures to only those measures which contain information about "mean" or "std" (by finding relevant columns in the "file features.txt") 
- replace the activity numerical key from the (y*.txt) files by human readible activity description (from file "activity_labels.txt")
- create tidy data set with write.table() as a *.txt file
