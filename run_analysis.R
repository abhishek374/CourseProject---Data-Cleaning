#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Good luck!

#Downloading and unzipping the data file 

  path <- getwd()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",file.path(path,"fitnessdata.zip") )
#unzip("fitnessdata.zip")
# Reading the test and train data files
testdata <- read.table(file.path(path,"UCI HAR Dataset/test/X_test.txt"))
traindata <- read.table(file.path(path,"UCI HAR Dataset/train/X_train.txt"))
totaldata <- rbind(testdata,traindata)
#Reading the features
featuresdata <- read.table(file.path(path,"UCI HAR Dataset/features.txt"),col.names = c("SNo","Features"))
colnames(totaldata) <- featuresdata[,2]
#Including only those features which has mean or standard deviation
featuresfiltererd <- grep("(mean|std)\\(\\)",featuresdata[,2])
ColsRequired <- featuresdata[featuresfiltererd, ]
totaldata1 <- totaldata[,ColsRequired[,1]]

#Reading Labels
testlabels <- read.table(file.path(path,"UCI HAR Dataset/test/Y_test.txt"),col.names = label)
trainlabels <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names = label)
totallabels <- rbind(testlabels,trainlabels)
#Reading Subjects
testsubjects <- read.table(file.path(path,"UCI HAR Dataset/test/subject_test.txt"))
trainsubjects <- read.table(file.path(path,"UCI HAR Dataset/train/subject_train.txt"))
totalsubjects <- rbind(testsubjects,trainsubjects)
colname(totalsubjects) <- "SubjectNum"
#Combining data, labels and subject
combineddata <- cbind(totalsubjects,totallabels,totaldata1)
#reading the activity description
activitydata <- read.table(file.path(path,"UCI HAR Dataset/activity_labels.txt"),col.names = c("ID","Activity"))
#Merging the activitdata to combineddata to change labels to activity name
mergeddata <- merge(combineddata,activitydata,by.x = "label",by.y = "ID",all.x)
mergeddata$SubjectNum <- as.factor(mergeddata$SubjectNum)
mergeddata$Activity <- as.factor(mergeddata$Activity)
#Calculating the summary by Subject and Activity type
summarydata <- aggregate(mergeddata,list(ActivityName = mergeddata$Activity,Subject = mergeddata$SubjectNum),FUN = mean,data = mergeddata)
summarydata$SubjectNum <- NULL
summarydata$Activity <- NULL
summarydata$label <- NULL
summarydata
