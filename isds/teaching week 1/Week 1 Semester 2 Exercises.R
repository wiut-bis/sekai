# ------------------- #
#  R BOOTCAMP WEEK 1  #
#      EXERCISES      #
# ------------------- #


# -----------
# Exercises
# -----------

# Write code for the following arithmetic operations:

# add 3 plus 2
3 + 2
# subtract 2 from 5
5 - 2
# multiply 5 by 6
5 * 6
# divide 7 by 8
7 / 8
# find the remainder of 13 divided by 5 as an integer
13%%5
# raise 9 to the 3rd power
9^3
# raise -3 to the 9th power
(-3)^9
# raise 2 to the power of 5 minus 2
2^(5-2)
# find the square root of 30
sqrt(30)
# determine how many times 14 can be divided by 3 sans remainder
14%/%3
# Uncomment and debug the following line of code so that it returns the intended result of 1.75:
((5 * 3) - (2 * 4) / (3 + 1))

# Uncomment and debug the following line of code so that it returns the intended result of -100:
(4-9)^3 + sqrt(625) 

# Uncomment and debug the following line of code so that it returns the intended result of -1.5:
 ((-3*2)^2)/(4-6)

# Add an argument to the log function below so that it returns a result of 2:
log(100, base = 10)

# ---------
# Run First
# ---------

# Run the following code before completing the exercises below:

varA <- 3.3
typeof(varA)
class(varA)
str(varA)
varB <- "hello there"
typeof(varB)
class(varB)
str(varB)
varC <- FALSE
varD <- 5L
varE <- 5
varF <- varD + varE
varG <- 2 * varC

# Show the data type for each of the variables above using the typeof, class, or str function(s).

# Using a comment, explain why the first comparison below returns TRUE whereas the second one returns FALSE:
varD == varE 
typeof(varD) == typeof(varE)

# Using a comment, explain why the comparison below returns TRUE:
FALSE == 0 

# Use an "as" function to convert varE to the integer data type and assign it to a new variable called varE_int in a single command.
typeof(varE)
varE <- as.integer(varE)
typeof(varE)
# Using a comment, explain why calling VarA (as opposed to varA) returns an error:

 