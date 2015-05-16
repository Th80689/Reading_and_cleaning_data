##############################################################################
## Coursera_3_Getting_and_Cleaning_data - prog. assignment 
##############################################################################

library(reshape2)


## read feature names in vector
features <- read.table("./UCI HAR Dataset/features.txt")

## read activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activityid","activityname"))

## read test data
test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names ="subjectid")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names ="activityid")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])

## read train data
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names ="subjectid")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names ="activityid")

## combine test & train data.frames
all_measures <- rbind(test_x, train_x)
all_activities <- rbind(test_y, train_y)
all_subjects <- rbind(test_s, train_s)

## create "activity-description only" dataframe
all_act_1 <- merge(all_activities, activities, by.x ="activityid", by.y ="activityid", sort = FALSE) 
all_act_names <- as.data.frame(all_act_1[,2])
colnames(all_act_names) <- c("activityname")

## reduce measures to mean and std features only
n <- grep("mean|std", features[,2]) ## find column ids with contain mean or std
all_mean_std <- all_measures[, n]

## combine subject/activity with measures
basedata <- cbind(all_subjects, all_act_names, all_mean_std)

## prepare aggregations and calculate mean for the variables

## melt & group the data
melted <- melt(basedata, id.var = c("subjectid", "activityname"))
grouped_mean <- dcast(melted, subjectid + activityname ~ variable, mean)

## write final output
write.table(grouped_mean, file="./tidy_data_set.txt",  row.name=FALSE)


grouped_mean
