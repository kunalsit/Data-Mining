
#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_Q5
#  Student ID : 10471054

#Remove all objects from the current workspace (R memory)
rm(list=ls())

#Load the data from csv file
HW5_dataset<-read.csv("C:/Users/kgoyal/Downloads/breast-cancer-wisconsin.data.csv")

#dividing the data for traning and test dataset
index<-seq(1, nrow(HW5_dataset), by=5)
#Creating the training_dataset data set 
training_dataset<-HW5_dataset[-index,]
#Creating the test_dataset data set by excluding all values from training dataset
test_dataset<-HW5_dataset[index,]

#Importing the libraries required for the CART
library(rpart)
library(rpart.plot)  		
library(rattle)           
library(RColorBrewer)

#Use the CART to classify

mytree<-rpart(Class~F1+F2+F3+F4+F5+F6+F7+F8+F9, data=training_dataset)
mytree

#Plot the tree from classification by CART
plot(mytree)
prp(mytree)
fancyRpartPlot(mytree)

#Score the dataset
Predict<-predict(mytree,test_dataset)
Predict

#Measure the accuracy

wrong<- (test_dataset[,4]!=Predict)
rate<-sum(wrong)/length(wrong)
rate
