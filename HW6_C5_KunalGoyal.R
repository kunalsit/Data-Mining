
#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_Q6
#  Student ID : 10471054

#Remove all objects from the current workspace (R memory)
rm(list=ls())
#Load the data from csv file
HW6_data<-read.csv("C:/Users/kgoyal/Downloads/breast-cancer-wisconsin.data.csv")

HW6_data$Class <- factor(HW6_data$Class)
HW6_data$F1 <- factor(HW6_data$F1)
HW6_data$F2 <- factor(HW6_data$F2)
HW6_data$F3 <- factor(HW6_data$F3)
HW6_data$F4 <- factor(HW6_data$F4)
HW6_data$F5 <- factor(HW6_data$F5)
HW6_data$F6 <- factor(HW6_data$F6)
HW6_data$F7 <- factor(HW6_data$F7)
HW6_data$F8 <- factor(HW6_data$F8) 
HW6_data$F9 <- factor(HW6_data$F9)
index<-sort(sample(nrow(HW6_data),round(.25*nrow(HW6_data))))
#Creating the training data set 
training_dataset<-HW6_data[-index,]
#Creating the test data set by excluding all values from training dataset
test_dataset<-HW6_data[index,]

#Install the C50 package

install.packages("C50")

library('C50')
#Perfrom C5.0 classification

C50_class <- C5.0(Class~F1+F2+F3+F4+F5+F6+F7+F8+F9,data=training_dataset)
#summarise,plot and make prediction using C5.0 
summary(C50_class )

plot(C50_class)

Prediction_C50<-predict( C50_class ,test_dataset , type="class" )

table(actual=test_dataset[,11],C50=Prediction_C50)

wrong<- (test_dataset[,11]!=Prediction_C50)

c50_rate<-sum(wrong)/length(test_dataset[,4])
#Measure the error rate
c50_rate
#Measure the accuracy
accuracy <- (1-c50_rate)*100
accuracy



#Random Forest

#install.packages("randomForest")
library('randomForest')

randomForest_class<-randomForest(Class~.,data = training_dataset)
plot(randomForest_class)
# Predict
randomForest_predict<-predict( randomForest_class ,test_dataset , type="class" )
right2<- (test_dataset[,10]==randomForest_predict)
RF_rate<-sum(right2)/length(test_dataset[,10])
print(paste("the accuracy of RF is",RF_rate))
