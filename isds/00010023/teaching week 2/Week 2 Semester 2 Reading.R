# ------------------ #
#  R BOOTCAMP WEEK 2 #
# ------------------ #

# +++++++++++++++++++++
# + R DATA STRUCTURES +
# +++++++++++++++++++++

# Now that we have a basic understanding of data types and objects, we need to consider an additional aspect of data in R: data structures. The purpose of data structures is to provide ways of storing data in different formats suitable to a particular task. We will now discuss several of the most common data structures you will often see, which include:

# A) vectors
# B) factors
# C) data frames
# D) Matrices
# E) lists

# Again, this is not an exhaustive list. R provides several other data types which are less commonly seen (although obviously this depends on the context); examples of these include arrays.

# -------
# Vectors
# -------

# A vector is a basic data structure that is capable of storing multiple values. To create a vector in R, you use the combine/concatenate function, c:

c(3, 6, 9)

# You can also assign a vector (or any other data structure) directly to an object if desired:

vector1 <- c(3, 6, 9)

# The length of a vector can be calculated via the length function:

length(vector1)

# You can also find the value stored within a specific element of a vector by referencing its position using the bracket operator (i.e., see ?"["). It's worth noting that unlike some other programming languages, the position within an R vector extends from 1 to the length of the vector:

vector1[1] # the first element
vector1[2] # the second element
vector1[3] # the third element

# Note that both vector1[0] and vector1[4] can be attempted, but these do not return meaningful results for a vector of length 3:

vector1[0]
vector1[4]

# Negative values can also be used for returning a vector with a certain position omitted, although be careful when using this approach:

vector1
vector1[-1]
vector1[-2]
vector1[-3]

# A more useful fact about vectors is that it's also possible to return or omit multiple values from within a vector by position using the combine function within the brackets:

vector1[c(1, 3)]  # return positions 1 and 3
vector1[-c(1, 3)] # return all positions except 1 and 3
vector1[c(3, 1)]  # return positions 3 and 1 (i.e., order matters)

positionVector <- c(1, 3)
vector1[positionVector] # same as above, using a vector of positions in the brackets

# To change the value of an element within a vector, you can use the bracket notation combined with the assignment operator to make a change. For instance, to change the middle element of vector1, you could use the following command:

vector1 # before
vector1[2] <- 100
vector1 # after

# You can also change multiple values at once using the combine approach:

vector1 # before
vector1[c(1, 3)] <- c(50, 150)
vector1 # after

# Finally, you can add values to an existing vector by position:

vector1 # before
vector1[4] <- 200
vector1 # after

# Note however that adding values can result in NAs occurring depending on the position supplied:

vector1 # before
vector1[6] <- 300
vector1 # after (notice the NA in position 5)

# Vectors that contain numeric data are useful for simplifying operations that involve multiple values. For instance, consider what happens when you add a number to a numeric vector or multiply it by a number:

class(vector1)

vector1 + 1
vector1 * 2

# In these examples involving addition and multiplication using a single value, the addition or multiplication is applied to each individual element of the vector. However, it is also possible to perform operations across multiple vector objects:

vector2 <- c(1, 2, 3)
vector3 <- c(5, 7, 9)

vector2 + vector3
vector2 - vector3
vector2 * vector3
vector2 / vector3

# Note that in these examples, each corresponding element in the vectors is operated upon (i.e., vector2 + vector3 will result in three additions: 1 + 5, 2 + 7, and 3 + 9, respectively). This raises an interesting point: what happens if you perform arithmetic on two vectors of differing lengths?

vector4 <- c(1, 2, 3, 4, 5)
vector5 <- c(1, 2, 3)

vector4 + vector5

# Take a look at the output from the command above and see if you can figure out what happened (and read the warning). In any event, note that vector objects work like any other R object, meaning that the results of an operation involving vectors can be stored into a new object if desired:

vector6 <- vector4 / 5

# You can also create vectors of any data type, although note that every element within a particular vector must share the same data type:

vector8 <- c(10, 20, 30)
vector8
class(vector8)

vector9 <- c("cat", "dog", "hamster")
vector9
class(vector9)

vector10 <- c(10, "20", 30) # careful with this one: R will implicitly convert this to character for you since characters and numbers cannot be mixed
vector10
class(vector10)

# Note that similar to non-numeric data types, you cannot perform arithmetic on a vector that contains character data (e.g., try the example below with the # omitted):

# vector10 + 1

# R provides several convenient ways to create vectors of numbers in a sequence. For example, you may want to create a vector with the numbers from 1 to 5, from 101 to 105, or from 10 to 0. To accomplish this, R provides the colon operator (:) which can create a sequence in steps of either 1 or -1:

1:5
101:105
10:0
-5:5
5:-5

# The colon operator can be particularly handy when referring multiple values within a vector:

vector11 <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
vector11[3:5]
vector11[c(1, 2, 5:7)] # sequences can also be used directly inside the combine function

# For more complex sequences, you can also use the seq function:

seq(from = 0, to = 10, by = 2)
seq(0, 10, by = 2) # equivalent, but as always, be careful when omitting argument names

seq(0, 5, by = .5) # by does not necessarily need to be an integer

# Note that you should be careful when using the seq function to make sure it is returning what you expect. For instance, consider this call:

seq(1, 10, by = 5) # returns 1 and 6 only

# In other words, it's important to consider how the from/to boundaries work when using seq.

# -------
# Factors
# -------

# Factors represent a special case of the vector data structure in that they are designed for storing categorical (aka nominal) data. To define a factor, you use the aptly named factor function:

?factor

# For example, assume you wanted to store information regarding the type of phone a person owned, consisting of iPhone, Android, or Other. You could define this information via a factor. For instance, assuming you are recording the information for seven individuals, you could specify these data as:

phoneType <- factor(c("iPhone", "Android", "Android", "iPhone", "Other", NA, "iPhone")) # notice how one phone type is not known (i.e., NA)
phoneType

typeof(phoneType)
class(phoneType)
str(phoneType)

# There are several important points regarding factors illustrated by this example:

# 1) a factor consists of one or more discrete levels, which are stored as integer values from 1 to the number of levels (e.g., 1, 2, 3)
# 2) NA values are allowed to occur in factors
# 3) the list of levels shows all possible types, meaning that besides NA, only those values can occur in the factor (in other words, a factor with levels Android, iPhone, and Other could not take a value like BlackBerry)
# 4) every level of a factor takes both a value and a character label; for instance, in this example, the values and labels are: 1 ("Android"), 2 ("iPhone"), 3 ("Other"); note that the level values correspond to the order shown in the R console output

# Several functions exist in R that can help you when working with factors. Examples include:

levels(phoneType)   # show all the meaningful levels (NA excluded)
nlevels(phoneType)  # show the number of levels (again, NA excluded)

# You can also use functions we have seen before to convert factors to different data types. For instance, to convert to integer or character data use as.integer or as.character, respectively:

as.integer(phoneType)
as.character(phoneType)

# The default ordering of levels is automatically determined alphabetically (e.g., Android before iPhone). You can also change the order of levels and the corresponding values of the levels via either relevel (which changes only the first [aka reference] level) or by explicitly specifying the order when creating the factor:

phoneType <- factor(c("iPhone", "Android", "Android", "iPhone", "Other", NA, "iPhone"))
phoneType # by default, the levels are: 1 ("Android"), 2 ("iPhone"), 3 ("Other")
as.integer(phoneType)

phoneType <- relevel(phoneType, ref = "iPhone") # here we reassign phoneType after changing the reference level to iPhone (IMPORTANT: be sure to actually reassign after using relevel if you want the changes to "stick")
phoneType # now the levels are: 1 ("iPhone"), 2 ("Android"), 3 ("Other")
as.integer(phoneType)

phoneType <- factor(c("iPhone", "Android", "Android", "iPhone", "Other", NA, "iPhone"), levels = c("Other", "Android", "iPhone")) # here we explicitly specify the levels as Other, Android, and then iPhone
phoneType # the levels are: 1 ("Other"), 2 ("Android"), 3 ("iPhone")
as.integer(phoneType)

# In general, it is very important to use meaningful labels when working with factors. Level names consisting exclusively of numbers can also cause confusion. For instance, consider this odd example:

(weirdFactor <- factor(c(3, 1, 2, 2, 3, 3), levels = c(3, 1, 2)))
as.character(weirdFactor) # label names
as.integer(weirdFactor) # notice how the label "1" corresponds to the value of 3, which is counter intuitive; as.integer does not turn the initial numeric values specified in the call to factor, since those become labels

as.integer(as.character(weirdFactor)) # converting to character and then integer in steps can return the actual integer values of the labels, if that is needed

# Finally, similar to vectors, you can refer to a factor element by position and also reassign it:

phoneType
phoneType[3] <- "Other"
phoneType

# Note that any changes should respect the levels of the factor:

phoneType
phoneType[3] <- "BlackBerry" # generates a warning since BlackBerry is not a valid level
phoneType # note the unintended NA that now appears in the third element, which is probably not what was desired

# If you do need to add a new level to a factor, you will need to refactor it first, making sure to include the new factor level (even if it does not yet appear in the data):

phoneType <- factor(phoneType, levels = c("Android", "iPhone", "BlackBerry", "Other"))
phoneType
phoneType[3] <- "BlackBerry" # no longer a problem
phoneType

# A simple function that can be handy for getting counts of factor levels is table:

table(phoneType)
table(phoneType, useNA = "always") # if you want to see a count of NAs as well

# It's also worth noting that since factors are just a special case of vectors, you can add or omit by position in the exact same manner as you would for a regular vector:

phoneType # before
length(phoneType)
phoneType[8] <- "Other"
phoneType # after
length(phoneType)

phoneType
phoneType[-c(1:4)]

# Finally, it is occasionally necessary and/or helpful to recode factor labels (e.g., for clarity or for plotting purposes), although accomplishing this in base R is not particularly straightforward. The easier way to do this is to use a function like recode in either the dplyr or car package specifically designed for this task, although we will wait to do this in a forthcoming unit.

# -----------
# Data Frames
# -----------

# Data frames are another fundamental data type in R, since they are used to store relational data (i.e., rows and columns) similar to an Excel sheet. Data frames in R are typically instantiated using existing data files rather than specifying them directly (R and various R functions also provide some built-in example data sets; see ?data for more). However, we can create one manually using one or more vectors and the data.frame function. For instance, let's instantiate a data.frame called "employeeData":

employeeData <- data.frame(
  EmployeeID = 101:105,
  FirstName = c("Kim", "Ken", "Bob", "Bill", "Cindy"),
  Age = c(24, 23, 54, NA, 64),
  PayType = factor(c("Hourly", "Salaried", "Hourly", "Hourly", "Salaried"))
)

employeeData

str(employeeData)   # see the structure of the data frame (very useful)
dim(employeeData)   # get the dimensions
ncol(employeeData)  # number of columns
nrow(employeeData)  # number of rows
names(employeeData) # see column names

head(employeeData, n = 2) # see only the first two rows
tail(employeeData, n = 2) # see only the last two rows

# A couple things are worth pointing out here regarding the data frame employeeData:

# 1) Data frames can consist of multiple columns, each with a distinct name and data type.
# 2) Each column is a vector, and each vector must be of the same length (NAs can be used to pad missing data, as in the Age column in the example).
# 3) R will automatically try to convert the columns into a suitable data type based on the data, but the assumption may not always be ideal (see ?data.frame for options on how to control this process).

# Regarding the third point, it's worth noting that IDs likely ought to be factored since they aren't really integer data per se (e.g., would you ever add up two employee IDs?). To accomplish this, we can use the assignment operator approach combined with the $ operator, which is used to refer to a specific column name within the data:

employeeData$EmployeeID # return the column vector of employeeData named EmployeeID

str(employeeData) # EmployeeID is int (integer)
employeeData$EmployeeID <- factor(employeeData$EmployeeID) # factor employeeData$EmployeeID and reassign it back into the data.frame employeeData
str(employeeData) # EmployeeID is now Factor in the data.frame

# Regarding the $ operator, it's worth noting that column names can be placed in quotes, which is sometimes necessary if the column names include spaces (which should be avoided whenever possible). Thus, the following are all equivalent:

employeeData$EmployeeID
employeeData$"EmployeeID"
employeeData$'EmployeeID'
employeeData$`EmployeeID` # ` is called backtick (aka grave accent or backquote)

# As noted above, once a column is called via the $ operator, it is returned in the format of a vector. Thus, you can refer to elements by position as with any other vector:

employeeData$EmployeeID[3] # the employee on the third row has the EmployeeID 103

# When it comes to data.frame objects, you can also reassign a value within the data.frame using this approach:

employeeData                # before
employeeData$Age[3]         # the age of the employee on the third row is 54
employeeData$Age[3] <- 55   # reassign this employee's age to 55
employeeData$Age[3]         # the age is now updated to 55
employeeData                # after

# In addition to the $ operator, R supports several others that can be used for extracting or replacing values (e.g., see ?"$"). The most fundamental of these is again bracket notation, similar to vectors, although this time with two dimensions: rows and columns, which are delineated with a comma. First, let's look at specifying rows by number:

employeeData
employeeData[1, ]       # reference a single row (i.e., the first row)
employeeData[2:3, ]     # reference the second and third rows
employeeData[c(1, 4), ] # reference the first and fourth rows

# Notice that we specified particular rows but left the column specification blank in the preceding examples (e.g., [2:3, ]): when no specific columns are specified, R will return all columns. Now let's look at specifying columns by number:

employeeData
employeeData[, 2]       # reference a single column (FirstName in this case, which is returned as a vector)
identical(employeeData[, 2], employeeData$FirstName) # these are identical

employeeData[, 1:3]     # reference the first three columns
employeeData[, c(1, 4)] # reference the first and fourth columns

# In these examples, we specify particular columns but not particular rows: in this case, R again will return all rows. As you might expect, it is possible to specify both a specific row and column in a single command:

employeeData
employeeData[1, 2]              # reference the value in the first row, second column
employeeData[c(1, 3), c(2, 4)]  # reference the first and third rows with respect to the second and fourth columns

# All of these examples reference rows and columns by position. It's also possible to provide references by name; for example, when working with columns:

employeeData[, c("EmployeeID", "PayType")] # identical to employeeData[, c(1, 4)]

# As may be apparent, you thus have a lot of flexibility in terms of how to reference rows and columns within a data.frame. The following are all equivalent:

employeeData$Age
employeeData[, "Age"]
employeeData[, 3]

# What's more, double brackets and single brackets can be combined. Putting it all together, here is an example of several different ways of referencing data in the third row, second column of the EmployeeData data.frame:

employeeData$FirstName[3]
employeeData[3, "FirstName"]
employeeData[3, 2]
employeeData[, "FirstName"][3]
employeeData[, 2][3]
employeeData[3, ][, "FirstName"] # you should probably avoid this one, but it is possible...

# Ultimately, it's up to you to decide how best to make references to data.frame objects, but clarity should always be the goal (e.g., the first or second option above are potentially clearer than many of the others). As a general rule, it is best to refer to columns by name however, since column order is essentially arbitrary, thereby making references by column number potentially unreliable/hazardous. For example, consider a variation on the existing data.frame employeeData that rearranges the column order:

employeeDataReorder <- employeeData[, c("EmployeeID", "Age", "FirstName", "PayType")] # instantiate a new data.frame, employeeDataReorder, which contains all the columns of employeeData, but in a slightly different order

employeeData        # column order: EmployeeID, FirstName, Age, PayType
employeeDataReorder # column order: EmployeeID, Age, FirstName, PayType

# Notice how references by column number are no longer reliable across the two data.frame objects, yet references by column name are not a problem:

employeeData[, 2]
employeeDataReorder[, 2]      # these are different

employeeData$FirstName
employeeDataReorder$FirstName # these are the same

# All of these examples have focused on referencing or updating existing data within a data.frame object. There are of course ways you can add new rows and/or columns to a data.frame via assignment. To add a new row, you must supply a valid value for each respective column. To see how, consider this example, which covers some potential data type/structure issues:

employeeData
str(employeeData) # note that EmployeeID and FirstName are factors, and thus to add new/novel levels, we will need to unfactor these columns first (e.g., one option is to convert them to strings first); by contrast, we can leave PayType alone if we do not expect our new data to contain a novel factor level (i.e., something besides the defined levels of Hourly or Salaried)

employeeData$EmployeeID <- as.character(employeeData$EmployeeID)
employeeData$FirstName <- as.character(employeeData$FirstName)

employeeData
str(employeeData) # notice the EmployeeID and FirstName columns are no longer factored (i.e., they are just simple character vectors), but the data values are still the same after these conversions

employeeData[6, ] <- c(106, "Jamie", 56, "Hourly") # notice 106 is automatically converted to a string by R
employeeData
str(employeeData) # we've successfully added the new row of data; if we want to revert the structure back to our starting point, we could also refactor the EmployeeID and FirstName columns...

employeeData$EmployeeID <- as.factor(employeeData$EmployeeID)
employeeData$FirstName <- as.factor(employeeData$FirstName)

employeeData
str(employeeData) # all set (and note: it's ultimately your task to make sure the data types in your data.frame object are set in the way you think makes the most sense [e.g., it's debatable whether or not FirstName should be stored as a factor or more simply as a character string; you should decide how it should be set up and then make the necessary changes])

# Omitting or deleting rows is more straightforward than adding them. Simply use the bracket notation with negative values, similar to how you would for vectors:

employeeData
employeeData[-c(2:4), ] # omit rows 2 through 4

# Remember, if you actually want to remove these rows from the data.frame permanently, you will need to combine the command above with an assignment. For example:

employeeDataCopy <- employeeData # let's copy employeeData to employeeDataCopy so we don't lose our existing, "complete" version
identical(employeeDataCopy, employeeData) # as expected, the copy is identical

employeeDataCopy # before
employeeDataCopy <- employeeDataCopy[-c(2:4), ]
employeeDataCopy # after

# That covers the basics of adding or omitting/removing rows. To add a new column vector to a data.frame, simply assign it to the data.frame object with a meaningful name and provide a vector of data to fill it with the appropriate length (i.e., equal to the number of rows in the data.frame):

employeeData # before
employeeData$NumChildren <- c(0L, 2L, 1L, 0L, 3L, 0L) # this will only work if there are six rows in employeeData
employeeData # after

# Finally, to omit columns from a data.frame (as opposed to referencing only the ones you want, which we covered earlier), you have several options, although none of them are particularly straightforward (we will cover other/potentially better options later; more on this later). One basic option is to omit columns by position using bracket notation, similar to vectors:

employeeData
employeeData[, -c(2:4)] # omit columns 2 through 4 by position

# Another somewhat unintuitive option is to use the value matching %in% operator (e.g., see ?"%in%) in conjunction with logical negation (i.e., !) to exclude matching columns by name:

employeeData
names(employeeData)
employeeData[, !( names(employeeData) %in% c("FirstName", "Age", "PayType") )]

# A third and slightly more easy-to-interpret option is to use the subset function:

?subset
subset(employeeData, select = -c(FirstName, Age, PayType)) # note the column names are NOT in quotes, which is a peculiarity of subset (the only quotes allowed using subset are backticks)
subset(employeeData, select = -c(`FirstName`, `Age`, `PayType`)) # same as above using backticks

# Finally, to rename an existing column (or set of columns) within a data.frame, use the names (or colnames) function to reference and reassign them. For example:

employeeData
names(employeeData)
names(employeeData)[5] # our recently added "NumChildren" column
names(employeeData)[5] <- "NumberOfChildren" # rename (i.e., reassign) "NumChildren" to "NumberOfChildren"
employeeData

# Again, this is just a preview of basic approaches; we will spend a lot more time manipulating data.frame objects with the dplyr package in a forthcoming unit, which should streamline these types of operations.

# -------- #
# Matrices #
# -------- #

#When data is arranged in two dimensions rather than one we have matrices. In R function matrix() creates matrices:

matrix1 <- matrix(c(1, 0, -20, 0, 1, -15, 1, -1, 0),
              nrow = 3, ncol = 3, 
              byrow = TRUE)
matrix1

#The individual numbers in a matrix are called the elements of the matrix. Each element is uniquely defined by its particular row number and column number. To determine the dimensions of a matrix use function dim().

dim(matrix1)

#An element at the i-th row, j-th column of a matrix can be accessed by indexing inside square bracket operator [i, j]. The entire i-th row or entire j-th column of a matrix can be extracted as shown in the code below.
##Particular cell (element) only:
matrix1[2,3]

## Entire row:
matrix1[1, ]

## Entire Column:
matrix1[ ,2]

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

array1 <- array(c(1:8),dim=c(2,2,2))
array1

# How to name the arrays:
rnames <- c("r1","r2")
cnames <- c("c1","c2")
mnames <- c("m1","m2")
named_array <- array(c(1:8),dim=c(2,2,2),dimnames= list(rnames,cnames,mnames))
named_array

##+++ or +++##
named_array1 <- array(c(1:8),dim=c(2,2,2),dimnames= list(c("r1","r2"),c("c1","c2"),c("m1","m2")))
named_array1

# Please, read the following link for more detailed understanding of array in R: https://techvidvan.com/tutorials/r-arrays/?utm_campaign=News&utm_medium=Community&utm_source=DataCamp.com



# -----
# Lists
# -----

# Although typically less common than the other data types we have discussed thus far, lists are another data structure in R that are relatively frequently encountered (and for certain programming tasks, they are invaluable). At the most basic level, lists provide a way to nest many different types of R objects inside a single object (e.g., you might think of lists like Matryoshka dolls). To see how lists work, let's learn by example. First, let's create a few arbitrary objects to put in our list:

demoVec <- c(97, 98:101)
demoDF <- data.frame(
  ColA = 1:3,
  ColB = factor(c("A", "A", "B")),
  ColC = demoVec[1:3]
)

# Now let's create a list using these objects along with some additional list elements we create on the fly:
list1 <- list(
  Element1 = demoVec,
  Element2 = c("A", "B"),
  Element3 = 3,
  Element4 = demoDF)

# Now let's see what our list looks like:
list1

# In this example, list1 contains four elements of various sizes/lengths and data types/structures. Each element has a name and can be returned using various extractor operators including $ (using the same rules as for data.frame objects), single bracket, and a new one: double bracket (i.e., see ?"[["). Let's consider the $ approach first:

str(list1)
length(list1)
names(list1)

list1$Element1
list1$Element2
list1$Element3
list1$Element4

# When a list element is returned using the $ operator, it is returned in its respective data structure. In other words, since Element4 in list1 is a data.frame, we can also reference individual values inside it using row/column bracket notation after extracting it from the list:

list1
list1$Element4

str(list1$Element4)   # proof that the extracted element is a data.frame
list1$Element4[2, 3]  # here we extract the data.frame and reference the 2nd row/3rd column in a single command to show the relevant value (i.e., the number 98)

# Double bracket notation works similarly to the $ operator, except double bracket allows us to reference list elements not only by name, but also by position. Thus, the following commands are all equivalent:

list1$Element4
list1[["Element4"]]
list1[[4]]

# As always, be careful when specifying list objects by numeric position rather than by name, since numeric position is arbitrary, less precise, and subject to change (and thus mistakes).

# Last but not least, single bracket notation can also be used with lists to return one or more elements by either name or position. However, be careful when using single bracket notation with lists, since the returned object will always be a list even when returning a single list element (i.e., this differs from how the $ operator and double bracket work above, since those operators are designed to extract only a single list element as opposed to potentially several):

list1
list1["Element4"]       # notice the "$Element4" shown above the data.frame output
str(list1["Element4"])  # this occurs because single bracket returns a list of length 1

list1[c("Element1", "Element3")] # returning two elements of our list by name

list1[1]        # first element by position (returned as a list)
list1[c(1, 3)]  # first and third elements by position

# This covers referencing data stored in a list. As you may expect, it's possible to add more elements to an existing list using approaches we have already seen. For example, one option is to use the $ operator:

list1 # before
list1$NewElement <- "Let's add this string..."
list1 # after

# Another option is to add a new element by position:

list1 # before
length(list1)
list1[[6]] <- seq(0, 5, by = 1)
list1 # after

# You may notice one oddity about the above code: namely, the newly added element does not have a name when added by position since no name was supplied. Notice the difference between $NewElement and [[6]]:

list1$NewElement  # NewElement can be referenced by name
list1[[5]]        # or by position

list1[[6]]        # by contrast, list element six has no name and can only be referenced by position

names(list1)      # notice how the sixth name is blank (i.e., "")

# As shown in this example, it is technically possible for list elements to not be formally named when declared. In fact, an entire list could be declared with one or more names omitted:

list2 <- list(
  Element1 = seq(1, 5, by = .5),
  c("A", "C", "E"),
  demoDF,
  Element4 = c(TRUE, NA, FALSE)
)

str(list2)
names(list2)

# Alternatively, not a single name must necessarily be provided:

list3 <- list(
  seq(1, 5, by = .5),
  c("A", "C", "E"),
  demoDF,
  c(TRUE, NA, FALSE)
)

str(list3)
names(list3) # NULL indicates no names

# In cases such as this when names are occasionally or entirely missing, the $ operator may not helpful, since $ only works with names. Thus, you must use single or double bracket notation to reference lists with unnamed elements by position, similar to our previous examples:

list3[c(1, 3)]
list3[[3]]

# Moving on, note that like all other data structures in R, you can reassign values within lists using the same general approach we have seen before. For instance, we can change the first list element into something else via reassignment:

list4 <- list(
  seq(1, 5, by = .5),
  c("A", "C", "E"),
  demoDF,
  c(TRUE, NA, FALSE)
)

list4 # before
list4[[1]] <- "let's replace the number sequence with this string"
list4 # after

# We could also have used a series of operations to make a more complex change. For instance, we could replace the value in the top right hand corner of the data.frame in list4 (i.e., 97) like so:

list4 # let's see what we are working with

list4[[3]][1, 3] <- 0 # we are interested in the data.frame in the third list element; more specifically, the first row and third column of that data frame; let's replace that value with a 0

list4 # let's see the result

# Finally, we technically can omit values from a list by position, although be careful since doing so will change list positions in the returned output due to a peculiarity of how list indexing works:

list2
list2[-c(1, 3)] # notice how the resulting list is reindexed from [[1]] for unnamed list elements, which may be unexpected

identical(list2[[2]], list2[-c(1, 3)][[1]]) # somewhat confusingly, this is indeed TRUE

# Alternatively, you can delete list elements by assigning their value to NULL as needed:

list2Copy <- list2

list2Copy # before
list2Copy$Element1 <- NULL
list2Copy[[1]] <- NULL
list2Copy # after (again, notice how the list indexing has been reset for unnamed elements; in other words, what was [[3]] initially is now [[1]])
identical(list2Copy[[1]], list2[[3]])



# ++++++++++++++
# + R Packages +
# ++++++++++++++

# The functionality of R can be vastly expanded from what it includes by default by installing additional packages. These packages are made freely available by the community and are often updated to add new features or to fix potential problems. For a full list of packages (which number in the thousands), see the following links:

# list of packages by name: https://cran.r-project.org/web/packages/available_packages_by_name.html
# list of packages by task views: https://cran.r-project.org/web/views/

# To install a particular package in R, you have two options once you know the package's name:

# A) interactively in RStudio: Tools -> Install Packages...
# B) using the install.packages function

# Besides these methods, RStudio 1.2 (and up) will conveniently also offer to install some packages for you automatically if they are referenced in your script but not yet installed on your system. Ultimately, it's up to you to decide how to install your packages, but the install.packages function is indispensible since the other methods depend on it. There is one key point about R packages to be fully aware of however: namely, package installation only needs to happen once per R installation. In other words, once you have installed an R package, it will stay installed for a particular major version of R (e.g., R 3.6, which includes 3.6.0, 3.6.1, etc.) and you will not need to install it again. In fact, it is important to avoid reinstalling packages if possible, since the process can take some time to complete and can also cause warnings from RStudio if trying to reinstall packages that are already in use in your R session.

# Let's install our first few packages, which we will use later in this script to load data files from various file sources. The packages we want to install include "foreign", "readr", and "haven"; we can install all of these packages at once using the install.packages command, which takes a vector of one or more package names you want to install:

install.packages(c("foreign", "readr", "haven"))

# Notice how running this command may take a moment or two for the command to complete in the console: installing R packages requires downloading them from the internet and unpacking them, and this may take time to complete: the amount of time it takes will vary from package to package and on the number of packages you are trying to install. You will know package installation has completely finished when the stop sign icon disapears in the top right corner of the console pane and when a message starting with "The downloaded binary packages are in" appears in the console.

# Occasionally, you may run into issues installing certain packages. For example, this may occur if you have not installed the R Build Tools but a certain package is attempting to install from "source" code. To work around these issues, you can try adding additional arguments to your install.packages command:

install.packages(c("dplyr", "car"), dependencies = TRUE, type = "binary", ask = FALSE)

# After installing an R package, you need to take one more step to actually load them. To load a package, use the library function with the name of your package:

library(foreign)
library(readr)
library(haven)

# The library function can only load one package at a time, so it's not uncommon to see a series of calls to the library function at the top of an R script file. Moreover, loading a package with library will generally not print any special output to the console, although some packages may print various messages when they are loaded which may be worth reading.

# In addition, note that while install.packages should generally not be called repeatedly, note that you can reload package libraries as many times as you like to verify that they are available for you to work with, and the process should be immediate:

library(haven)
library(haven)
library(haven)

# Lastly, you can generally get help regarding the functions included in the package via the help function in conjunction with the package argument:

help(package = "haven")

# The help function will show you a list of functions available in a package in the lower right-hand pane.

# -----------------
# Updating Packages
# -----------------

# As mentioned earlier, R packages are updated from time to time with new features or fixes. You should generally try to keep your packages updated, and you can do this two different ways:

# A) interactively in RStudio: Tools -> Check for Package Updates...
# B) using the update.packages function: update.packages()

# Again, it's up to you to decide how to invoke the package updating process. Just be careful: R will generally complain if you try to update a package you have already loaded (or if you try to reinstall a package that has already been loaded). You will often need to restart R entirely if you want to update your packages fully.

# ------------------
# Unloading Packages
# ------------------

# Although typically unnecessary, it is possible to unload a package from R without restarting R. To do so, use the detach function with the unload argument. For example, the following code would allow you to unload the readr package:

library(readr) # make sure readr is loaded
detach("package:readr", unload = TRUE) # unload readr
library(readr) # load readr again

# ----------------------------------------
# Side Note: Package Loading Order Matters
# ----------------------------------------

# Although rare, it is possible for two different R packages to have a function with the same name. For example, the dplyr and car packages both have a function named recode, which serves a similar purpose in both packages (i.e., to recode factor variable labels) but has different usage across the packages. The order in which you load the packages will determine which one R will use when referring to a function, with the precedence being to use the function from the most recently loaded package:

install.packages(c("dplyr", "car"), dependencies = TRUE, type = "binary", ask = FALSE) # install the dplyr and car packages (if you haven't already)

library(dplyr)
library(car)

# Assuming dplyr and car are each being loaded for the first time, you will see the following red message from R when loading the car package:

# The following object is masked from ‘package:dplyr’:
#     recode

# In this case, recode within car will take precedence since the car package was loaded most recently, so calling recode will now use the one from car:

?recode # note that two recode help files appear in the lower right-hand pane
environment(recode)  # <environment: namespace:car> indicates we are working with the car variant by default now 

# Let's prove this is true by recoding a factor as an example using the car syntax:

(exampleFactor <- factor(c("A", "B", "B", "B", "A"))) # create a very simple factor vector example

recode(exampleFactor, recodes = "'A' = 'Case A'; 'B' = 'Case B';") # recode the example factor with the car recode function (see the car documentation under ?recode for more details)

# In this situation, there is an obvious question: what if you really wanted to use the dplyr version of recode rather than the car version? You have two options. One is to specify the package from which you want to call the particular function formally using the double colon operator (i.e., ::):

?car::recode
?dplyr::recode

car::recode(exampleFactor, recodes = "'A' = 'Case A'; 'B' = 'Case B';")
dplyr::recode(exampleFactor, "A" = "Case A", "B" = "Case B")
# Alternatively, you can unload both packages and change the one that is considered primary by loading them in a different order:

detach("package:car", unload = TRUE)
detach("package:dplyr", unload = TRUE)

library(car)
library(dplyr)

environment(recode) # <environment: namespace:dplyr>

recode(exampleFactor, "A" = "OutcomeA", "B" = "OutcomeB") # the dplyr variant of recode

# Whatever you decide to do, just be careful: the order in which you load packages matters when working with R!

# ++++++++++++++++++++++++++++
# + UNDERSTANDING FILE PATHS +
# ++++++++++++++++++++++++++++

# Before we start reading and writing data files, we need to cover a key concept of data files: specifically, working with R often involves reading or writing data from stored in various file formats (e.g., comma separated value [CSV] files). Assuming you would like to work with a data file stored locally on your computer, you will need to know each of the following aspects of the file to load it into R:

# 1) the file path: where the file is located on your disk/drive (e.g., ~/Documents/Data or C:\Data)
# 2) the file name: what the file is called (e.g., datafile; my_data_1)
# 3) the file extension: what type of file you are working with (e.g., .csv; .txt; .sav)

# A fully specified file path, name, and extension of a file may appear as follows:

# A) Mac/Linux: ~/Documents/datafile.csv
# B) Windows: C:\Data\datafile.csv

# The first thing to notice here is that Mac/Linux and Windows have some slight differences in terms of how file paths are specified: namely, Mac/Linux file paths use forward slashes while Windows paths use backslashes. The type of slash matters when it comes to R since we will need to supply various R functions file paths via character strings: as such, since the backslash is a special character in R (i.e., it is used as the escape character), we will need to either A) escape forward slashes when specifying the location of a file via a string or B) substitute forward slashes. For instance, consider the following examples of valid-looking paths:

"~/Documents" # Mac/Linux
"C:\\Data"    # Windows (option A)
"C:/Data"     # Windows (option B)

# Again, the two Windows examples above (i.e., options A and B) are identical and thus are interchangeable. Ultimately, as long as the path you specify is correct and valid, it is irrelevant how you decide to write it.

# What is not irrelevant however is the need to include both the file name and extension when referring to a file location in R. File Explorer on Windows or Finder on Mac can be used to find files you are looking for, although to see the extension you may have to adjust some options in the respective program:

# A) Finder (Mac): Finder -> Preferences -> Advanced Tab -> Check "Show all filename extensions"
# B) File Explorer (Windows 10): View Tab -> Options Button -> View Tab -> Uncheck "Hide extensions for known file types"

# Alternatively, R provides some helpful functions that allow you to interactively locate the full path, name, and extension of a file using a standard system dialogue:

# file.choose()

# --------------
# Home Directory
# --------------

# One other point regarding paths that you may or may not have noticed above is the use of a tilde (~) in the Mac/Linux file path example above. Without getting too technical, the ~ in the path refers to your home ($HOME) directory; for a Mac/Linux user, you can determine what you home directory is with the following command:

system("echo $HOME") # e.g., this might return something like /Users/xyz on Mac/Linux based on the current user

# On a Windows computer, your home directory will be the Documents folder of your current user (e.g., "C:/Users/David Dobolyi/Documents").

# Regardless of where it points, the primary purpose of ~ is to allow you to omit an explict home directory specification when writing a path in R. In other words, on a Mac, the following two paths are identical assuming the home directory of the current user is /Users/dd2es:

# A) "~"
# B) "/Users/dd2es"

# Again, it is up to you if you would like to use ~ when specifying paths on Mac/Linux. The upside of doing so is that you will not need to alter your scripts when working across various computers and/or user accounts (i.e., since the home directory is computer/user specific). In other words, the use of ~ is primarily for convenience and interoperability.

# +++++++++++++++++++++++++
# + THE WORKING DIRECTORY +
# +++++++++++++++++++++++++

# Now that we have a basic understanding of file paths, names, and locations, it's important to talk about the concept of a working directory. When working with R, it is generally a good idea to be organized and place your scripts and data into a directory (aka folder) on your computer where everything can be found in one place. If you do this, you will benefit greatly from setting a working directory, which is a way of letting R know where to look for or put files by default. To check your current working directory, use the getwd function:

getwd()

# RStudio will set a default working directory for you depending on how you start the program. However, generally speaking you will want to set your own working directory, which can be done in two ways:

# A) interactively in RStudio: Session -> Set Working Directory -> Choose Directory...
# B) using the setwd function with a specified path (e.g., setwd("~/Documents/ResearchProject"))

# In general, it is a good idea to use the setwd function in place of the interactive option, since the function allows you to make setting the working directory part of your R script. Conveniently, if you use the interactive approach to set your working directory, you will notice a setwd command will appear in your console after choose a working directory; you can copy and paste this command back into your R script for future reference if desired.

# In any event, you can use the R function list.files to see a list of all the files and folders in your current working directory:

list.files()

# --------------
# Relative Paths
# --------------

# A common point regarding working directories is that you may have subdirectories within a particular working directory. For instance, assuming your working directory is "~/Documents/ResearchProject", this folder may have a data subdirectory like "~/Documents/ResearchProject/Data", and this folder may in turn contain a data file you would like to load (e.g., "~/Documents/ResearchProject/Data/ExampleData.csv"). This example brings up an important aspect of working directories, which are relative paths. Relative paths allow you to specify the location of a file or folder relative to your working directory.

# To see how this works, unzip "R-Bootcamp-Unit4-Data.zip" (i.e., do not simply open/browse it) and then set your working directory to the folder "WorkingDirectoryExample":

# setwd("~/Downloads/WorkingDirectoryExample")

# The following list.files calls will show you how to access various subdirectories relative to your working directory:

getwd()

list.files()
list.files("Data Files")
list.files("Data Files/More Data")

# It is also possible to step down a folder when supplying a relative path by using periods (i.e., "."). To see how, try setting your working directory to the "Data Files" folder inside of "WorkingDirectoryExample" first:

# setwd("~/Downloads/WorkingDirectoryExample/Data Files")

getwd()

list.files()
list.files("More Data")
list.files("..")  # step down a folder

# Once again, keep in mind you do not have to use relative paths when working with R and can choose to fully specify every path in your script. However, understanding how relative paths work can drastically simplify your work while allowing you to keep your working directory organized.

# ++++++++++++++++++++++
# + READING DATA FILES +
# ++++++++++++++++++++++

# Base R provides several built-in functions to read data files; the most commonly used of these include read.table and various predefined variants including read.csv and read.delim. Each of these functions is designed to load in tabular data as a data.frame from simple, text-based data files (i.e., files that can be opened and viewed in a text editor like Notepad [Windows], TextEdit [Mac], or Atom [Universal]). 

# Typically, these data files use either a comma or a tab to separate data values; moreover, the individual data values may also be encapsulated in quotes (particularly if character/string data are involved), although this will vary from file to file (e.g., it's up to you to determine the right separator, potentially by opening the file in a text editor first).

# Common data files that fall under this umbrella include:

# CSV/TSV:    comma/tab separated value

# While base R functions such as read.csv are commonly used by many (i.e., I often use them for simple tasks myself), the readr package (https://readr.tidyverse.org/) can be significantly faster for reading these types of files, so I will provide examples below using both base R and readr functions (ultimately it's up to you to decide which to employ in your own work).

# Moreover, in the following sections, I will also cover other common data file formats including:

# XLS, XLSX:  Microsoft Excel
# SAV:        SPSS
# SAS:        SAS including .sas7bdat and .sas7bcat extensions
# DTA:        Stata

# I will show how to use various packages (e.g., foreign, haven) to work with these files.

# Finally, I will provide a brief description of the data.table package, since it offers an extremely fast and straightforward way of reading small or large (e.g., big data) text-based data files into R. Other packages worth exploring yourself include: jsonlite, XML, httr, feather, googlesheets, sparklyr (R Interface to Apache Spark), fst

# -----------------------
# CSV Files (base, readr)
# -----------------------

# As noted above, we will read in simple, text-based data files in R using both the base read.csv function as well as the readr package.

# Before we can read in a data file, we need to make sure we can provide a valid path to access it. Since paths can be relative as described in the preceding section, we can use setwd to establish our working directory first and then use a relative path to our file in function arguments. For example:

setwd("~/Downloads/WorkingDirectoryExample") # set the working directory (change this for yourself as needed)
list.files() # list files in the working directory
list.files("Data Files") # list files inside the Data Files subfolder

# Now that we have determined a valid path, we can read in some data. Let's start by reading in the "ExampleData.csv" file, which is a CSV file based on its extension:

CSV_base_example <- read.table(file = "Data Files/ExampleData.csv", header = TRUE, sep = ",", quote = "\"")

# A few notes regarding the arguments above:

# A) file:    the path to the data file you want to import
# B) header:  specify whether or not the data file has a header row, which lists each of the column names; if you supply the wrong argument, you will likely see an obvious problem when exploring the data you read in
# C) sep:     the separator character, which is typically (but not necessarily) "," (for CSV) or "\t" (for TSV); you may need to open the file (e.g., in a text editor if the file is small) manually to verify the separator being used
# D) quote:   the quoting character used to encapsulate data points (again, you may need to verify this manually)

# Keep in mind you may need to alter some of the arguments to suit the particular data file you are trying to import. Conveniently, read.table provides a set of functions with different default arguments to suit common text data files, including CSV (read.csv) and TSV (read.delim). For instance, read.csv would work perfectly for a typical CSV file such as the one in our example:

CSV_base_example <- read.csv("Data Files/ExampleData.csv") # identical to the read.table command above

# Regardless of which function you use or how you set up the arguments, you should verify that the imported data look correct using some data.frame functions we have seen previously:

head(CSV_base_example)
str(CSV_base_example)

# As always, be sure to run the str function to verify the data types in each of the columns and use functions to set the data types accordingly (e.g., as.factor, as.character).

# The readr package provides an alternative approach to reading in CSV and TSV data files that some may prefer:

library(readr) # make sure the readr package is loaded, just in case you didn't load it earlier

CSV_readr_example <- read_csv("Data Files/ExampleData.csv")
head(CSV_readr_example)

# Compared to base R functions, readr is typically faster, the argument specification is more consistent, and the column data types may be set more aptly. Moreover, readr loads the data table in the tibble format (i.e., see ?tibble), which is a data structure essentially interchangeable with data.frame (e.g., extractors such as $ will work identically across both) that provides a few additional features/qualities that may make it preferable to the base R data.frame structure:

head(CSV_base_example)   # data.frame output
head(CSV_readr_example)  # tibble output

class(CSV_base_example)
class(CSV_readr_example)

# It is possible to convert a data.frame to a tibble and vice versa via various functions:

head(as.data.frame(CSV_readr_example)) # convert a tibble to a data.frame

library(tibble)
head(as_tibble(CSV_base_example))      # convert a data.frame to a tibble

# It's ultimately up to you at this point to use data.frame vs. tibble, but many functions we will work with output tibbles (e.g., dplyr), so it's worth being aware of both formats.

# ------------------
# XLS, XLSX (readxl)
# ------------------

# R is capable of reading in Excel data (e.g., XLS, XSLX) directly using the readxl function. Using this function can save you the trouble of opening the file in Excel and converting it to another format (e.g., CSV) for example. The most relevant function in the package is read_excel:

library(readxl)

XSLX_readxl_example <- read_excel("Data Files/ExampleData.xlsx", sheet = 1) # note the sheet specification argument
head(XSLX_readxl_example)

# The readxl package provides various functions that can simplify working with these types of files. For example, to get a list of all sheets in an Excel file, you can use the excel_sheets function:

help(package = "readxl") # see a list of functions in readxl
excel_sheets("Data Files/ExampleData.xlsx") # this file only has one sheet

# Finally, note that when importing data from Excel, you may find dates that appear as integers in R (e.g., 43800). The reason for this is that Excel stores dates as number of days from an arbitrary origin around 1900-01-01 (see the examples in ?as.Date for a discussion on this). To convert these values to dates in R, you can use the as.Date function and adjust the origin argument accordingly; for example:

as.Date(43800, origin = "1899-12-30") # "2019-12-01"; note the exact origin date depends on the operating system you are using as per http://support.microsoft.com/kb/214330

# Alternatively, you can use the excel_numeric_to_date function in the janitor package to help with Excel date conversion.

# --------------------
# SAV (foreign, haven)
# --------------------

# For SPSS users, you have two options to read SPSS files (e.g., .SAV). The first is to use the long-standing foreign package, which provides the read.spss function:

library(foreign)

SAV_foreign_example <- read.spss("Data Files/ExampleData.sav", to.data.frame = TRUE) # note that if you see a message such as "re-encoding from UTF-8" after running read.spss, you can usually safely ignore it
head(SAV_foreign_example)

# Use of this function is generally straightforward, although be sure to set the to.data.frame argument to TRUE if you want the data imported as a data.frame object. It's worth mentioning the use.value.labels argument, which can be helpful for reading in nominal (factor) columns as integer values directly instead of as SPSS value labels:

SAV_foreign_example_alt <- read.spss("Data Files/ExampleData.sav", to.data.frame = TRUE, use.value.labels = FALSE)
head(SAV_foreign_example_alt)

SAV_foreign_example$satisfaction_score # value labels from SAV_foreign_example
SAV_foreign_example_alt$satisfaction_score # actual values from SAV_foreign_example_alt

# Moreover, in case you want to see the column labels provided by SPSS when working with read.spss, you can use the attr function to extract them:

attr(SAV_foreign_example, "variable.labels")

# Finally, as an alternative to read.spss in foreign, you can use the read_sav (aka read_spss) function in the haven package to read in SPSS files:

library(haven)
help(package = "haven") # see a list of functions in haven

SAV_haven_example <- read_sav("Data Files/ExampleData.sav")
head(SAV_haven_example)

# ---------------------
# SAS and Stata (haven)
# ---------------------

# For SAS and Stata users, the haven package also allows for you to read in files from those programs:

library(haven)

SAS_haven_example <- read_sas("Data Files/ExampleData.sas7bdat") # read SAS
head(SAS_haven_example)

DTA_haven_example <- read_dta("Data Files/ExampleData.dta") # read Stata (DTA)
head(DTA_haven_example)

# For older Stata data files (lower than version 8), you may also consider using the read.dta function in the foreign package.

# ----------------------
# Noteworthy: data.table
# ----------------------

# I will not cover reading or writing data with the data.table package in this tutorial primarily because it requires explaining another variation on the data.frame data structure: the data.table, which has its own unique syntax and rules. However, the data.table package is worth mentioning since it is an excellent package for working with larger data files efficiently. In terms of reading data, data.table's fread function is both extremely fast and extremely smart: it is capable of automatically determining the correct separator/quote parameters for various text data files. Moreover, the fwrite function provides an extremely fast way of writing CSV data files compared to the base write.csv function. I highly recommend checking out the data.table package if you ever need to work with big data files or if you have trouble reading in data with either base R or readr.

# ++++++++++++++++++++++
# + WRITING DATA FILES +
# ++++++++++++++++++++++

# When it comes to writing data with R, it is highly recommended to use a data format that is not proprietary (e.g., SPSS), since these data formats may cause problems when importing them elsewhere (e.g., you cannot open an SPSS SAV file directly in Excel). Generally speaking, CSV files are universal and thus are a good option, although file sizes can become large (e.g., zipping CSV files can save a lot of space).

# In this tutorial we will focus on writing data to CSV files while also touching on alternatives for other formats.

# ------------------
# Writing CSV (base)
# ------------------

# Writing a CSV file with R is straightforward using the write.csv function. The key arguments you will need to specify are the data.frame you want to export and a path for the desired output file. The default values are mostly fine for the remaining arguments, but you will likely want to set row.names to FALSE to avoid writing out R's row name labels to your CSV file:

write.csv(CSV_readr_example, file = "Data Files/More Data/WriteExampleData.csv", row.names = FALSE)

# Notice that no assignment is necessary to write a data file with R (i.e., because the data are being exported out of R).

# As mentioned earlier, see the fwrite function in the data.table package for an extremely fast alternative to the write.csv function for working with big data sets.

# ----------------------
# Writing XLSX (writexl)
# ----------------------

# Similar to how the readxl package can be used to read Excel files, the writexl package can be used to write them. Usage is straightforward (see ?write_xlsx for additional options):

library(writexl)

write_xlsx(CSV_readr_example, path = "Data Files/More Data/WriteExampleData.xlsx")

# -----------------------------
# Writing Other Formats (haven)
# -----------------------------

# The haven package supports writing SPSS, SAS, and Stata files. Again, the key arguments you will need to specify are the data.frame you want to export and a path for the desired output file:

write_sav(CSV_readr_example, path = "Data Files/More Data/WriteExampleData.sav")
write_sas(CSV_readr_example, path = "Data Files/More Data/WriteExampleData.sas7bdat")
write_dta(CSV_readr_example, path = "Data Files/More Data/WriteExampleData.dta")

# Remember, this tutorial only covers a few options for writing data files. There are many other packages available that can help with specific use cases.

# +++++++++++++++++++++++++++++
# + OTHER WAYS TO ACCESS DATA +
# +++++++++++++++++++++++++++++

# R supports reading data from sources besides files. One such example is R's ability to read data directly from SQL databases: the R package odbc will allow you to connect to any of the following DBMS platforms: "SQL Server, Oracle, MySQL, PostgreSQL, SQLite and others" (see https://db.rstudio.com/odbc/ for details and usage examples). Other relevant packages for working with SQL database in R include: dbplyr, RMySQL, RPostgreSQL, ROracle, sqldf









