# +++++++++++++++++++++++++
# +++ R BOOTCAMP UNIT 3 +++
# +++++++++++++++++++++++++



# DATA IMPORTING
library(tidyverse)
college <- read_csv("https://s3.amazonaws.com/itao-30230/college.csv")



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

## creative methods to convert all character to factor
college <- college %>% mutate_if(is.character,as.factor)




# DESCRIPTIVE STATISTICS 
summary(college)

mean(college$sat_avg)
sd(college$sat_avg)
min(college$sat_avg)
max(college$sat_avg)
median(college$sat_avg)
kurtosi(college$sat_avg)


# SUBSETTING DATAFRAME
# 1st option:
Private_only <- college[college$control =="Private",]

# 2nd option:
Private_only <- filter(college, control == "Private")

# 3rd option:
Private_only <- subset(college, control == "Private")


# SUBSETTING: EXAMPLES

## Ex: Average SAT score of the private schools is:
mean(Private_only$sat_avg)

## Ex: Bring the table for schools with 1100+ average SAT scores
college[college$sat_avg > 1100,]

## Ex: Cound how many schools have average SAT score of 1100+
nrow(college[college$sat_avg > 1100,])
count(college[college$sat_avg > 1100,])

## Ex: Change control type of school to "Private" if Average SAT is greater than 1100
college[college$sat_avg > 1100,]$control <- "Private"


# MERGING DATAFRAMES

#1st dataframe:
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
AL_or_FL <- college[college$state =="AL"|college$state == "FL",]
nrow(AL_or_FL)

## Ex: Let's have schools only in AL or FL: with %in% operations
AL_or_FL <- college[college$state %in% c("AL", "FL"),]

## Ex: How about schools both in AL and FL:
AL_and_FL <- college[college$state =="AL" & college$state == "FL",]
nrow(AL_and_FL)

## Ex: Schools in NY with either average SAT less than 800 or tuition fees less than 10000
college[college$state == "NY",]
college[college$state == "NY" & (college$sat_avg < 800 | college$tuition < 10000),]

## Ex: Summary statistics of schools in NY with either less than 800 SAT score or less than 10K tuition fees
summary(college[college$state == "NY" & (college$sat_avg < 800 | college$tuition < 10000),])

## Ex: Private schools that are in New York or have an average SAT score above 1500
filter(college, control=="Private" & (state=="NY" | sat_avg>1500))



# DATA MANUPULATION


# mean and standard deviation of average SAT by state in descending order of mean SAT score

library(dplyr)

college %>% 
  group_by(state) %>% 
  summarise(mean_sat = mean(sat_avg), 
            sd_sat = sd(sat_avg)) %>%
  arrange(desc(mean_sat))



# List of private schools with average SAT scores over 1400, showing only the school name and SAT score, with the highest scores first?
college %>%
  filter(control=="Private") %>%
  filter(sat_avg > 1400) %>%
  select(name, sat_avg) %>%
  arrange(desc(sat_avg))



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


## Fehrenheit to Celcus conversion:
weekly <- c(7, -3, 0, 10, 18, 3, 32)

for(degC in weekly) {
  degF = degC*(9/5)+32
  print(c(degC, degF))
}



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

## Example for if condition with "FOR" loop:
for (i in 1:10){
  if(i > 5){
    print("positive")
  } else { print("negative")}
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
  Area <- pi*r^2
  Circum <- 2*pi*r
  return(c(Area = Area, Circumference = Circum))
}

### Returning LIST
circle_l <- function(r){
  Area <- pi*r^2
  Circum <- 2*pi*r
  return(list(Area = Area, Circumference = Circum))
}


### Returning DATAFRAME
circle_d <- function(r){
  Area <- pi*r^2
  Circum <- 2*pi*r
  return(data.frame(Area = Area, Circumference = Circum))
}

###COMPARSION
circle_v(1:5)
circle_l(1:5)
circle_d(1:5)


