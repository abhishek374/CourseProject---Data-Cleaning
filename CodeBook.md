#Variable Description
path: path of working directory
testdata : contains test data
traindata : contains train data
totaldata : contains test and train data combined
featuresdata : contains feaures data
featuresfiltered : containes the data of featuers with mean and std calculated
colsrequired : containes the column number of featuers with mean and std calculated
totaldata1 : Contains the filtered version of totaldata with only columns as per colsrequired
testlabels :contains labels for test data
trainlabels : contains labels for train data
totallabels : contains combined labels for test and train data
combineddata : Contains the merged data including labels, subjects and data
activitydata : contains the description of labels
mergeddata : Combineddata labels transforme to activity
summarydata : summary data as per the subject and labels

#Transformations Carried

- totaldata is transformed to totaldata1 by using only the columns with mean and std of the activity
- activity and subject column in mergeddata is transformed into factors to apply the aggregate function 
