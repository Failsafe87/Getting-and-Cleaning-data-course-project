# Getting-and-Cleaning-data-course-project

Data found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Goal of program
Creating a tidy data set including only mean and standard deviation that has descriptive activity names and labels for the data set.

##Files needed
The data unzipped will include the folder "UCI HAR Dataset". This folder is assumed to be included in your working directory. 
The program explicitly uses the files "features.txt", "activity_lables.txt", "X_train.txt", "subject_train.txt", "y_train.txt", 
"X_test.txt", "subject_text.txt", and "y_text.txt". These files are located throughout the "UCI HAR Dataset" folder.

#Run_analysis.R Walkthrough

-Set your working directory to where both Run_analysis.R is located and the folder "UCI HAR Dataset."
-next enter the following code: source("Run_analysis.R")
-The code will then start reading the text files from the "UCI HAR Dataset" that are required
-The code will then combine the datasets into two separate data sets of similar subjects
-The code will then add easier to use names and identifiers to the dataset
-The code will then find all cases of -mean() or -std () to isolate what we need
-The code will then add the names to the columns that are more descriptive and helpful and then combine both datasets in to one
-The code will the separate the big dataset into one that only includes those isolated -mean() and -std() that we are looking for
-the code will then create a separate dataset that only consists of the -mean() and -std() with descriptive labels
-finally, the code will write this last dataset to a separate .txt file called "Samsung_data.txt" which will be placed in the 
directory you are currently working in.
