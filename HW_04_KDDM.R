#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_04
#  Student ID : 10471054


# Read the csv

HW4 <- read.csv("C:/Users/kgoyal/Downloads/breast-cancer-wisconsin.data.csv")
str(HW4)
#Remove any row with a missing value in any of the columns
HW4_without_missing_value <- na.omit(HW4)
str(HW4_without_missing_value)

# Use the NB classification model for the Diagnosis

features <- HW4_without_missing_value[-11][-1]
labels <- HW4_without_missing_value[,11]
plotnb <- naivebayes::naive_bayes(x = features,y = as.factor(labels))
#Plot the data
plot(plotnb)

