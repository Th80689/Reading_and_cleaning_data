# Reading_and_cleaning_data
## Contents
This repository contains instructions how to solve the programming assignment in the coursera class reading and cleaning data.

##Task summary:
The goal of this programming assignment is to analyse raw data found in several files, reduce them to a relevant subset of variables and to create ONE dataset with tidy data:
(after downloading and unzipping raw data).


###Preparations outside R:
A) Download assignment data file into a subdirectory named "data" in your working directory 
The data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
B) Unzip the the data

###Processing steps in R (included in "run_analysis.R")
- identify relevant files in raw data
- merge test- and training-files (types: subject-info (subject_*.txt), activity-info (y_*.txt), measures (X_*.txt)) into one recordset 
- reduce the measures to only those measures which contain information about "mean" or "std" 
- replace the activity numerical key from the (y_*.txt)-files by human readible activity description
- create tidy data set with write.table as a *.txt file
