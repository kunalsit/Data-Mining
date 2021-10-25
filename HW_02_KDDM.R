#  Course     : CS 513
#  First Name : Kunal
#  Last Name  : Goyal
#  Assignment : HW_02
#  Student ID : 10471054


# Read the csv
HW2 <- read.csv("C:/Users/kgoyal/Downloads/breast-cancer-wisconsin.data.csv",header = TRUE, na.strings='?')
str(HW2)


#Summarizing each column on various parameters such as  min, max, mean

summary(HW2)


#Identifying the missing values

which(is.na(HW2))

#Replacing the missing values with mean value of data

for(i in 1:ncol(HW2))
{
  HW2[is.na(HW2[,i]), i] <- mean(HW2[,i], na.rm = TRUE)
  
}

# Mode


#Mode <- function(x) {
 # ux <- unique(x)
 #}
#Mode(HW2)


#To Display the frequency table of "Class" vs. F6

table(HW2$Class , HW2$F6)

#Displaying scatter plot of F1 to F6, one pair at a time
pairs(HW2[2:7])


#Make the histogram and Box plot from F7 to F9
hist(HW2$F7)
hist(HW2$F8)
hist(HW2$F9)

boxplot(HW2[8:10])


# Deleting all the objects from R- environment. 
rm(list=ls())

# Reload the breast-cancer-wisconsin.data.csv into R
HW2 <- read.csv("C:/Users/ntshw/Downloads/breast-cancer-wisconsin.data.csv",header = TRUE, na.strings='?')
str(HW2)

# Remove any row with a missing value in any of the columns.

HW2_without_missing_value <- na.omit(HW2)
View(HW2_without_missing_value)
str(HW2_without_missing_value)


