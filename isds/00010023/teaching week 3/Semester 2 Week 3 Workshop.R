# +++++++++++++++++++++++++
# +++ R BOOTCAMP UNIT 3 +++
# +++++++++++++++++++++++++



# DATA IMPORTING
library(tidyverse)
college <- read_csv("https://s3.amazonaws.com/itao-30230/college.csv")

#importing the dataset using Base Package.
college <- read.csv(url("https://s3.amazonaws.com/itao-30230/college.csv"))


# DATA PREVIEW
str(college)



# DATA ADJUSTMENT
## simple manual methods:
college$state <- as.factor(college$state)
college$region <- as.factor(college$region)
college$highest_degree <- as.factor(college$highest_degree)
college$control <- as.factor(college$control)
college$gender <- as.factor(college$gender)
college$loan_default_rate <- as.numeric(college$loan_default_rate)

## creative methods to convert all character to factor. This works with Tidyverse
college <- college %>% mutate_if(is.character,as.factor)




# DESCRIPTIVE STATISTICS 
summary(college)

mean(college$sat_avg)     # Mean
sd(college$sat_avg)       # Standard Deviation
min(college$sat_avg)      # Minimum value
max(college$sat_avg)      # Maximum value
median(college$sat_avg)   # Median value

install.packages("e1071") # needed to calculate kurtosis
library(e1071)
kurtosis(college$sat_avg)  # Kurtosis


# SUBSETTING DATAFRAME
# 1st option:
Private_only <- college[college$control =="Private",]

# 2nd option (works with Tidyverse):
Private_only <- filter(college, control == "Private")

# 3rd option:
Private_only <- subset(college, control == "Private")


# SUBSETTING: EXAMPLES

## Ex: Average SAT score of the private schools is:


## Ex: Bring the table for schools with 1100+ average SAT scores


## Ex: Count how many schools have average SAT score of 1100+


## Ex: Change control type of school to "Private" if Average SAT is greater than 1100



# MERGING DATAFRAMES

#1st data.frame:
employeeData_A <- data.frame(
  EmployeeID = 102:106,
  NumChildren = c(2L, 1L, 0L, 3L, 0L),
  FirstName = c("Ken", "Bob", "Bill", "Cindy", "Jamie"))

#2nd dataframe:
employeeData_B <- data.frame(
  Age = c(24, 23, NA, 64, 56),
  PayType = factor(c("Hourly", "Salaried", "Hourly", "Salaried", "Hourly")),
  ID = c(101, 102, 104, 105, 106),
  FirstName = c("Kim", "Ken", "Bill", "Cindy", "Jamie"))

# Merging two files into one: 
employeeData_AB_merged <- merge(x = employeeData_A, y = employeeData_B, by.x = c("EmployeeID", "FirstName"), by.y = c("ID", "FirstName"), all = TRUE)


# LOGICAL OPERATORS

# | (logical OR)
# & (logical AND)
# ! (logical negation; aka NOT)


#EXAMPLES FOR LOGICAL OPERATORS:

## Ex: Let's have schools only in AL or FL: with logical operators


## Ex: [OPTIONAL] Let's have schools only in AL or FL: with %in% operations


## Ex: How about schools both in AL and FL:


## Ex: Schools in NY with either average SAT less than 800 or tuition fees less than 10000


## Ex: [OPTIONAL] - Summary statistics of schools in NY with either less than 800 SAT score or less than 10K tuition fees


## Ex: [OPTIONAL] - Private schools that are in New York or have an average SAT score above 1500




# DATA MANUPULATION

library(dplyr)

# mean and standard deviation of average SAT by state in descending order of mean SAT score

college %>% 
  group_by(state) %>% 
  summarise(mean_sat = mean(sat_avg), 
            sd_sat = sd(sat_avg)) %>%
  arrange(mean_sat)

college

# If it is impossible to install dplyr package, the following code provides the same result using Base package:
avg <- aggregate(college$sat_avg, by=list(college$state), FUN=mean);
stdev <- aggregate(college$sat_avg, by=list(college$state), FUN=sd)
merged <- merge(x = avg, y = stdev, by.x = "Group.1", by.y = "Group.1", all=T)
names(merged) <- c("state", "mean", "sd")
merged[order(merged$mean,decreasing = TRUE),]




# List of private schools with average SAT scores over 1400, showing only the school name and SAT score, with the highest scores first?
college %>%
  filter() %>%
  filter() %>%
  select() %>%
  arrange()



# Ex: [OPTIONAL] - 
# What if we wanted to compare each SAT average of each college in Midwest to its regional average?
## We start by creating a tibble for each region's SAT average.
sat_by_region <- college %>%
  group_by(region) %>%
  summarize(region_sat_avg=mean(sat_avg))


## Now, let's join this data with the college data
college %>%
  inner_join(sat_by_region, by = "region") %>%
  select(name, region, sat_avg, region_sat_avg ) %>%
  mutate(comparison = sat_avg - region_sat_avg) %>%
  filter(region == "Midwest") %>%
  arrange(desc(comparison))



# SIMPLE "FOR" LOOP IN R:

## creating the square of digits from 1 to 9:
for(i in 1:9){
  print(i^2)
}


## storing squared digits in vector
squared_digits <- numeric(9)
for(i in 1:9){
  squared_digits[i] <- i^2
}
squared_digits


## Ex: [OPTIONAL] - Fahrenheit to Celsius conversion for weekly weather:

weekly <- c(7, -3, 0, 10, 18, 3, 32)





# NESTED "FOR" LOOP

for (i in 1:3){ 
  for(j in 1:2){
    print(i+j)
  }
}



# IF CONDITIONAL STATEMENTS IN R

## Example for if condition:
if (2*3 > 5) {
  print("true")
} else 
{print("false")}


## Ex: [OPTIONAL] - Example for if condition with "FOR" loop:
for (i in -4:10){
  if(i > 0){
    print("positive")
  } else { print("not positive")}
}


# CREATING FUNCTIONS IN R

## Let's create a function to calculate the area of circle: pi*r^2

circlearea <- function(r){
  area <- pi*r^2
  return(area)
}

circlearea(3)

## Let's create functions to calculate the area and circumference of a circle:
### Returning VECTOR
circle_v <- function(r){
  Area <- 
    Circum <- 
    return()
}

### Returning LIST
circle_l <- function(r){
  Area <- 
    Circum <- 
    return()
}


### Returning DATAFRAME
circle_d <- function(r){
  Area <- 
    Circum <- 
    return()
}

###COMPARSION
circle_v(1:5)
circle_l(1:5)
circle_d(1:5)


