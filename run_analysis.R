#code for Coursera Getting and cleaning data course project
#
#using UCI  HAR Dataset 
#
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#part0 - load all the required files

        testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
        testactivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
        
        trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
        trainactivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
        
        activitylabels <-read.table("./UCI HAR Dataset/activity_labels.txt")
        
        fieldnames <- read.table("./UCI HAR Dataset/features.txt")

#part1 - merge to one dataset

        mtest<-cbind(testsubjects, testactivities, testdata)
        mtrain<-cbind(trainsubjects, trainactivities, traindata)
        
        #rename columns  for clarity 
        #this includes part4 - adding variable names
        colnames(mtest) <- c("subject","activity",as.character(fieldnames[,2]))
        colnames(mtrain) <- c("subject","activity",as.character(fieldnames[,2]))
        
        dataset1 <- rbind(mtest,mtrain)
        
        #tidy up a bit
        remove(testsubjects,testdata,testactivities,
               trainsubjects,traindata,trainactivities,
               fieldnames,mtest,mtrain)

# part2 - keep only mean and std columns (and the 2 identifiers)

        #note that we do not include meanFreq varaible
        #note2 we do not include any of the Additional vectors obtained by averaging the signals in a signal window sample.
        dataset1<-dataset1[, c(1,2,grep("mean\\(\\)|std\\(\\)", colnames(dataset1)))]
        
# part3 - use descriptive activity names
        
        colnames(activitylabels) <- c("activity","activityname")
        dataset1<-merge(dataset1,activitylabels)
        dataset1<-dataset1[,c(2,69,3:68)]
        
# part4 - add variable names
        
        #covered in part1
        
# part5 - Creates data set with the average of each variable for each activity and each subject. 
        #requires package 'reshape2'
        
        datamelt<-melt(dataset1,id=c("subject","activityname"))
        finaltable<-dcast(datamelt,subject+activityname ~ variable,mean)
        
# part6 - output the final datatable
        
        write.table(finaltable,file="./TidyDataSet.txt",row.names=F)