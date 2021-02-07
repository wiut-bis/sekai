# ------------------- #
#  R BOOTCAMP WEEK 2  #
# ------------------- #

# +++++++++++++++++++++
# + R DATA STRUCTURES +
# +++++++++++++++++++++

# -------
# Vectors
# -------


# How to assign a vector to an object:
vector1 <- c(3, 6, 9)


# The vector's element value finding: 
## 1st approach:
vector1[1] 
vector1[-3]
vector1[c(1, 3)]  
vector1[-c(1, 3)] 



#How to change the value of an element within a vector:
vector1[2] <- 100
vector1[c(1, 3)] <- c(50, 150)
vector1[4] <- 200



# Arithmetic operations with numeric vectors:
vector2 <- c(1, 2, 3)
vector3 <- c(5, 7, 9)

vector2 + vector3
vector2 - vector3
vector2 * vector3
vector2 / vector3


# How to create vectors of any data type: 
vector5 <- c(10, 20, 30) # numeric
vector6 <- c("cat", "dog", "hamster") #character
vector7 <- c(10, "20", 30) #character



# How to create vectors of numbers in a sequence:
## Simple sequence
1:10
-5:5
5:-5

## Complex sequence
seq(from = 0, to = 10, by = 2)
seq(0, 10, by = 2) 
seq(0, 5, by = .5) 
seq(1, 10, by = 5)



# Helpful usage of colon operator: 
vector8 <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
vector8[3:5]
vector8[c(1, 2, 5:7)] 


# -------
# Factors
# -------

phoneType <- factor(c("iPhone", "Android", "Android", "iPhone", "Other", NA, "iPhone")) 



# Helpful functions to work with factors: 
## Showing all meaningful levels:
levels(phoneType)   

## Counting the number of levels 
nlevels(phoneType)  

## showing the frequency of each level
table(phoneType)
table(phoneType, useNA = "always") 



# It's also worth noting that since factors are just a special case of vectors, you can add or omit by position in the exact same manner as you would for a regular vector:
phoneType[8] <- "iPhone"
phoneType 


# -----------
# Data Frames
# -----------

employeeData <- data.frame(
  EmployeeID = 101:105,
  FirstName = c("Kim", "Ken", "Bob", "Bill", "Cindy"),
  Age = c(24, 23, 54, NA, 64),
  PayType = factor(c("Hourly", "Salaried", "Hourly", "Hourly", "Salaried")))


## HELPFUL FUNCTIONS:

str(employeeData)         # see the structure of the data frame (very useful)
dim(employeeData)         # get the dimensions
ncol(employeeData)        # number of columns
nrow(employeeData)        # number of rows
names(employeeData)       # see column names
head(employeeData, n = 2) # see only the first two rows
tail(employeeData, n = 2) # see only the last two rows



#returning a column vector
employeeData$EmployeeID # return the column vector of employeeData named EmployeeID
employeeData$"EmployeeID"
employeeData$'EmployeeID'
employeeData$`EmployeeID` # ` is called backtick (aka grave accent or backquote)



#How to bring a particular value from data.frame:
employeeData$EmployeeID[3] # the employee on the third row has the EmployeeID 103



# How to change the value in data.frame: 
employeeData$Age[3] <- 55   # reassign this employee's age to 55



#How to bring particular row(s) from data.frame:
employeeData[1, ]       # reference a single row (i.e., the first row)
employeeData[2:3, ]     # reference the second and third rows
employeeData[c(1, 4), ] # reference the first and fourth rows



#How to bring particular column(s) from data.frame:
employeeData[, 2]       # reference a single column (FirstName in this case, which is returned as a vector)
employeeData[, 1:3]     # reference the first three columns
employeeData[, c(1, 4)] # reference the first and fourth columns
employeeData[, c("EmployeeID", "PayType")] # identical to employeeData[, c(1, 4)]


# How to bring element(s) value(s) from data.frame:
employeeData[1, 2]              # reference the value in the first row, second column
employeeData[c(1, 3), c(2, 4)]  # reference the first and third rows with respect to the second and fourth columns



#How to add new row(s) to dataframe:

## Due to time constraints, we will not be practicing how create new rows and columns, yet, students, please read the detailed explanation of how to add rows and columns to data.frame from "Week 2 Semester 2 Explanation.R" file uploaded to intranet


#How to delete row(s) & column(s) in data.frame: 
## Removing row(s)
employeeData[-c(2:4), ] 

## Removing column(s) - using simple approach
employeeData[, -c(2:4)] 

# Removing column(s) - using subset function:
subset(employeeData, select = -c(FirstName, Age, PayType)) 
#or
subset(employeeData, select = -c(`FirstName`, `Age`, `PayType`))



# To remove the row(s) from the data.frame permanently:
## Removing row(s) permanently
employeeDataRow <- employeeData 
employeeDataRow <- employeeDataRow[-c(2:4), ]

## Removing column(s) permanently
employeeDataColumn <- employeeData
employeeDataColumn <- employeeDataColumn[,-c(2,4)]



# How to rename existing column(s) within a data.frame: 
names(employeeData)[5] # our recently added "NumChildren" column
names(employeeData)[5] <- "NumberOfChildren" # rename (i.e., reassign) "NumChildren" to "NumberOfChildren"


# -------- #
# Matrices #
# -------- #


#When data is arranged in two dimensions rather than one we have matrices. In R function matrix() creates matrices:
matrix1 <- matrix(c(1, 0, -20, 0, 1, -15, 1, -1, 0),
                  nrow = 3, ncol = 3, 
                  byrow = TRUE)
matrix1



#How to determine the dimension of the matrix: 
dim(matrix1)



#How to find the value(s) of element(s) within matrix:
##Particular cell (element) only:
matrix1[2,3]

## Entire row:
matrix1[1, ]

## Entire Column:
matrix1[ ,2]



# How to change the element(s) within matrix
matrix1
matrix1[2,3] <- 100
matrix1


# Computation in the matrices
mat1 <- matrix(c(5,10,15,20,25,30,35,40,45), nrow = 3)
mat2 <- matrix(c(50,55,60,65,70,75,80,85,90), nrow = 3)

## Adding:
mat1 + mat2

## Subtracting:
mat1 - mat2

## Multiplying
mat1 * mat2

## Dividing:
mat1 / mat2


# ------ #
# Arrays #
# ------ #

#R arrays are data objects that store data in more than two dimensions. Arrays are homogeneous in nature. This means that they can store values of a single basic data type only. They store the data in the form of layered matrices.

# Due to time constraint, we will not cover array in workshop, but please read and learn from "Week 2 Semester 2 Explanation.R" file.

# -----
# Lists
# -----

# At the most basic level, lists provide a way to nest many different types of R objects inside a single object.

demoVec <- c(97, 98:101)
demoDF <- data.frame(
  ColA = 1:3,
  ColB = factor(c("A", "A", "B")),
  ColC = demoVec[1:3]
)

# How to create lists: 
## With element names:
list1 <- list(Element1 = demoVec,
  Element2 = c("A", "B"),
  Element3 = 3,
  Element4 = demoDF)

str(list1)
names(list1) 

## Without element names:
list2 <- list(
  seq(1, 5, by = .5),
  c("A", "C", "E"),
  demoDF,
  c(TRUE, NA, FALSE))

str(list2)
names(list2) # NULL indicates no names

# How to bring a particular element in list:
##By element name:
list1$Element1
list1$Element4

#++ or ++#

##By double bracket:
list2[[1]]
list2[[4]]


# How to call a particular value of element in list: 
## By element name:
list1$Element4[2, 3]

## By double bracket:
list2[[3]][2,3]

# How to add new element in list:

list1 
list1$NewElement <- "Let's add this string..."
list1 



# How to reassign values in list: 

list3 <- list(
  seq(1, 5, by = .5),
  c("A", "C", "E"),
  demoDF,
  c(TRUE, NA, FALSE))

## Simple example:
list3[[1]] <- "let's replace the number sequence with this string"

## Advanced example: 
list3[[3]][1, 3] <- 0 


# How to remove values from a list by position: 
list3[-c(1, 3)] 



# ------------ #
#  R Packages  #
# ------------ #

## Installing package(s) 

# Install packages using using the install.packages. Try to install readr packages using install.packages("readr") in console not here to avoid future hussle. 

## Loading packages
library(readr)

# ------------------ #
# Reading Data Files #
# ------------------ #


## Importing CSV file:
CSV_file1 <- read.table(file = "sampledata/ExampleData.csv", header = TRUE, sep = ",", quote = "\"")
CSV_file2 <- read.csv("sampledata/ExampleData.csv") # identical to the read.table command above


##Importing Excel file:
library(readxl)
Excel_file <- read_excel("sampledata/ExampleData.xlsx", sheet = 1) 


## Importing SAV (SPSS) file:
library(foreign)
SAV_file <- read.spss("Data Files/ExampleData.sav", to.data.frame = TRUE) 


## Importing SAS & STATA file:
library(haven)
SAS_file <- read_sas("sampledata/ExampleData.sas7bdat") # read SAS
Stata_file <- read_dta("sampledata/ExampleData.dta") # read Stata (DTA)

# ------------------ #
# Writing Data Files #
# ------------------ #

## Writing as CSV file: 
write.csv(CSV_file1, file = "sampledata/WriteExampleData.csv", row.names = FALSE)

## Writing as Excel file:
library(writexl)
write_xlsx(CSV_file1, path = "sampledata/WriteExampleData.xlsx")

## Writing in other formats:
library(haven)
write_sav(CSV_file1, path = "sampledata/WriteExampleData.sav")
write_sas(CSV_file1, path = "sampledata/WriteExampleData.sas7bdat")
write_dta(CSV_file1, path = "sampledata/WriteExampleData.dta")


