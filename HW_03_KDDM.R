#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_03
#  Student ID : 10471054

# Read the csv
HW3 <- read.csv("C:/Users/kgoyal/Downloads/breast-cancer-wisconsin.data.csv",header = TRUE, na.strings='?')
str(HW3)
# Remove any row with a missing value in any of the columns
HW3_without_missing_value <- na.omit(HW3)
str(HW3_without_missing_value)
  # Load only every 5th record in datatest
datarange <- seq(from = 1, to = nrow(HW3_without_missing_value), by = 5)

datatest <- HW3_without_missing_value[datarange, ]

# Loading all Breast cancer record except fith range record in training dataset
training <- HW3_without_missing_value[-datarange, ]

# Using the KNN classification with value of k as 1

predict <- knn(training[ , -5], datatest[ , -5], training[ , 5], k = 1)

# Calculate the peformance of k
table(Predict = predict, Actual = datatest[ , 5])

# Repeat the above steps with values of k as 2,3,5,10

# Repeat the above step for k = 2
value_withK2 <- knn(training[ , -5], datatest[ , -5], training[ , 5], k = 2)
table(Predict = value_withK2, Actual = datatest[ , 5])

# Repeat the above step for  k = 3
value_withK3 <- knn(training[ , -5], datatest[ , -5], training[ , 5], k = 3)
table(Predict = value_withK5, Actual = datatest[ , 5])

# Repeat the above step for  k = 5
value_withK3 <- knn(training[ , -5], datatest[ , -5], training[ , 5], k = 5)
table(Predict = value_withK5, Actual = datatest[ , 5])

# Repeat the above step for  k = 10
value_withK10 <- knn(training[ , -5], datatest[ , -5], training[ , 5], k = 10)
table(Predict = value_withK10, Actual = datatest[ , 5])
