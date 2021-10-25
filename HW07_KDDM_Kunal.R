#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_07
#  Student ID : 10471054

## remove all objects
rm(list=ls())
dev.off
#install.packages('neuralnet')
library(neuralnet)
#read CSV file
data<-read.csv("C://Users/kgoyal/R/wisc_bc_ContinuousVar.csv")
set.seed(111)
#judge NAN
table(is.na(data))

data=data[,-1]


##Use 30% test 70% training

idx <- sample(1:nrow(data),round(0.7*nrow(data)))
training_data<-data[idx,]
test_data<-data[-idx,]

#ANN five (5) nodes in the hidden layer
ANN <- neuralnet(diagnosis~.,data=training_data,hidden=5, threshold=0.01)

prediction<-compute(ANN ,test_data[,-1])
ANN_diagnosis<-c('B','M')[apply(prediction$net.result,1,which.max)]
ANN$result.matrix
k=apply(prediction$net.result,1,which.max)
prediction$net.result
k
accuracy= (test_data$diagnosis==ANN_diagnosis)

acc<-sum(accuracy)/length(accuracy)
print(paste("the accuracy is",acc))

# Plot Neural Net
plot(ANN)

