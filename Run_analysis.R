

#extract and read all data related to train
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#extract all data related to test
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#combine y sets, x sets, and subject sets together respectively
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
sub <- rbind(subject_train, subject_test)

#extrat and read all data lables
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#add identifiers to features and activity_labels
names(features) <- c('features_id', 'features_name')
names(activity_labels) <- c('activity_id', 'activity_name')

#looks for the -mean () or -std () cases
features2 <- grep("-mean\\(\\)|-std\\(\\)", features$features_name)

#applies features2 to x and subsets it 
x <- x[,features2]
#applies activity_labels to y and subsets it
y[,1] <- activity_labels[y[,1],2]

#adds the found cases from features2 into x
names(x) <- gsub("\\(|\\)", "", (features[features2, 2]))
#adds the name "Activity" to y
names(y) <- "Activity"
#adds the name "Subject" to sub
names(sub) <- "Subject"

#merges all the datasets together into one set
tiddydata <- cbind (sub, y, x)

#creates a subset of the merged dataset that will be used to fill a mean and std only dataset
dat <- tiddydata[, 3:dim(tiddydata)[2]]

#creates a final dataset that has only mean and std
tiddydata2 <- aggregate(dat, list(tiddydata$Subject, tiddydata$Activity), mean)

#changes the names of the columns to "subject" and "activity"
names(tiddydata2)[1] <- "Subject"
names(tiddydata2)[2] <- "Activity"

#writes the dataset to a text file.
write.table(tiddydata2, "Samsung_data.txt", sep="") 
