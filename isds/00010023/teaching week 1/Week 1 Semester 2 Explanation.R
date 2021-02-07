# +++++++++++++++++++++++++
# +++ R-BOOTCAMP WEEK 1 +++
# +++++++++++++++++++++++++

## Special thanks goes to Prof David Dobolyi (University of Notre Dame) for letting us use R-bootcamp material in ISDS module


# -------------------------- #
#  INSTALLING R AND RSTUDIO  #
# -------------------------- #

# To get started working with R, we will install two key pieces of free open source software (FOSS):

# 1) R
# 2) RStudio

# R can be retrieved from its official site: The Comprehensive R Archive Network (CRAN; https://cran.r-project.org/). Depending on your operating system (OS), you will want to download the appropriate version. These include:

# A) Mac:       https://cran.r-project.org/bin/macosx/
# B) Windows:   https://cran.r-project.org/bin/windows/base/
# C) Linux:     https://cran.r-project.org/bin/linux/

# RStudio can also be retrieved from its official site (https://www.rstudio.com/). Note that RStudio is technically not required to work with R, but it provides an integrated development environment (IDE) that has a uniform look across OSs and provides several useful features not available with base R graphical user interface (GUI) such as auto-saving and version control integration.

# Once you have installed both R and RStudio, launch RStudio and then go to File -> Open File... to open this R script (rBootcamp-Unit1.R) for the next step.

# --------------------- #
# THE RSTUDIO INTERFACE #
# --------------------- #

# In addition to the main menu (e.g., File), the RStudio interface consists of several panes. In the default configuration, the most relevant panes are on the left-hand side: R script code (e.g., this script) will appear in the top left Source pane and executed commands and output will appear in the Console in the bottom left. The right-hand side contains the environment pane in the top right (more on this later) and a viewer pane on the bottom right, which will eventually show plots, help files, etc. as we dive further into working with R.

# The RStudio interface can be customized to your liking via the Tools menu (Tools -> Global Options...). Although these options are ultimately up to the user's personal preferences, I recommend making the following adjustments for the time being (#2 is particularly important from a usability perspective when working with this script):

# 1) In the General tab, set "Save workspace to .RData on exit" to "Never"
# 2) In the Code tab, make sure "Soft-wrap R source files" is checked

# As noted above, most of the work you do in R will take place in the top left Source pane where R script code appears. While it is also possible to enter commands directly into the Console in the bottom left (e.g., try entering 1+1 and hitting enter), any work you intend to save or refer back to should be added to your script on the top left. Code entered into this pane can be saved and open later as needed via File -> Save or via the save button (Floppy Disk icon) near the top left.

# A quick but important note on R scripts: comments! Comments are text that begin with a pound sign (i.e., #) and appear in green (such as this text) that can help explain what is happening in a script. As a general rule, you should try to include plenty of comments in scripts you write so that 1) you can understand why you wrote the code you wrote, especially after coming back to it weeks/months/years later; 2) so others can also understand your code in cases where you are collaborating (e.g., group projects).

# Besides comments, R scripts will obviously contain actual code that is meant to be executed. For example, your script may contain some basic algebra:

1+1

# Regarding this line of code above, there are several ways to execute it from within the script. One option is to highlight the code you want to run with your mouse and either 1) click the Run button in the top-right portion of the Source pane; or 2) use the run shortcut (command + Enter on Mac; Ctrl + Enter on Windows). Alternatively, if you want to run an entire line of code -- as you will commonly want to do -- simply place your cursor anywhere on the relevant line of code (either using the mouse or the keyboard) and use the run button or shortcut to execute it.

# No matter how you run code from within a script, you will see output in the Console pane in the bottom left. Specifically, the command you ran will appear next to a greater than sign (e.g., "> 1+1") followed by the result immediately after (e.g., "[1] 2"). Note that in the example of 1+1, the result is 2, but you will also see a bracketed [1] on the start of the result output. This [1] simply provides an indication of how many different pieces of output have been returned; for now, we only have one value returned, but as we will see later, it is possible for the result to contain many values.

# Finally, it's worth noting that you can combine code and comments on a single line if desired as long as code precedes the comment:

1+1 # the result will be 2

# Before moving on to basic arithmetic operations in R beyond 1+1, there are a few important aspects of the interface worth pointing out that should help with your productivity:

# First, it is possible to clear the Console window at any time; this can be done from the menus via Edit -> Clear Console or via the shortcut control + L.

# Second, the Console provides a history of executed commands that can be accessed using the keyboard. To see this history, click inside the Console to activate it. Notice that the cursor will become solid black and begin to blink when you click within either the Source or Console panes, respectively, depending on where you want to input code (i.e., you can switch between them as needed). To see the history, use the up and down arrow keys on the keyboard. Although you should typically avoid entering code directly in the Console and use the Source pane instead (i.e., so you have a permanent history of your work), this history feature can still be useful on occasion (as an aside, you can also see your history via the History tab in the top right pane).

# Third, you can use find and/or find and replace functionality to quickly make multiple changes throughout a script file, similar to office applications such as MS Word. You can access find and replace via the Edit menu (Edit -> Find...). A useful aspect of find and replace is the ability to use the "In selection" checkbox to match instances only within highlighted code as opposed to the entire script.


# ---------------------------------------------------#
# Arithmetic Operators & Mathematical functions in R #
# ---------------------------------------------------#

# The following is a complete list of arithmetic operators in R:

2+2   # addition
2-2   # subtraction
2*2   # multiplication
2/2   # division
2^2   # exponents (see note below)
5%%2  # modulo (a.k.a modulus or remainder)
5%/%2 # integer division (quotient with the remainder discarded)

# Within the list above, it is important to be careful with some of these operators when working within a programming context. For example, regarding exponents, notice that while 2^2 will return what you expect (i.e., 4), you may be surprised by what -2^2 returns:

-2^2

# The solution to this problem is careful use of parentheses, which we will discuss further in the next section:

(-2)^2

# It is also worth noting that there is flexibility regarding how you use spaces (i.e., white space) when typing code. The following commands all work and are all equivalent for example:

2+2
2+ 2
2 +2
2 + 2
2   +   2

# It is up to you to decide how best to use spaces when writing your code, but generally speaking, you should focus on maximizing code readability (e.g., many would argue 2+2 is less legible than 2 + 2). Moreover, it is worth noting that besides spaces, there are other types of white space characters you can use including tabs and newlines/line breaks (i.e., hitting enter while entering text). For example, consider the following code that includes a line break:

2 -
2


# If you place your cursor on either line of the code above and hit run, you will receive the expected result of 0: ultimately this code works because R expects an addition operation will consist of two values, so it will run both lines of codes automatically. Generally speaking however, it is a good idea to avoid splitting up code across multiple lines in this fashion since it can lead to unintentional mistakes.

# Another important point to mention is what happens when you fail to provide R with enough information regarding a command to execute. For instance, try running the following code without the leading pound sign (i.e., #) highlighted:

2 * 
  
# Notice that no result is returned, which is unsurprising given that you would need to provide another value to perform multiplication. However, what's more important is that R will wait for you to provide the missing value, as seen in the console:
  
# > 2 *
# + 
  
# At this point, you have two options: 1) you can provide the missing value to complete the operation (e.g., by typing it into the Console); or 2) you can hit the escape key (i.e., esc) to cancel the operation.

# Although this example is trivial, keep in mind the escape key solution, since it is very possible to get "stuck" in the console when working with R, particularly, when working with parentheses, so it's important to know how to resolve the situation when it arises.

# -------------------- #
# Multiple Operations  #
# -------------------- #

# Thus far, all the examples that we have seen involve a single operation. However, R allows you to execute multiple operations in a single command. For example:

2 * 2 * 3 - 1 + 5

# As with any arithmetic operation, the standard order of operations applies: 1) parentheses; 2) exponents; 3) multiplication/division; 4) addition/subtraction. Regarding parentheses in particular, these can be very useful to make order of operations clearer when the command is complex:

((5 * 3) - (2 * 4)) / (3 + 1)

# Dealing with multiple parentheses is common but can be difficult when code is dense. Fortunately, RStudio provides a highlighting system to help see which parentheses belong together (e.g., place your cursor on the far-left side of the command above and use the right arrow key to move the cursor to the right -- notice how different parentheses become highlighted as you do this).

# A common error when working with R is the failure to close all parentheses (or to close them incorrectly, which can be even worse since it may produce the wrong result -- be careful and always check your work!). For instance, try running the code below without the # sign:

#((5 * 3) - (2 * 4) / (3 + 1)

# Notice R will not complete the command. Instead, you will see the following in the console:

# > ((5 * 3) - (2 * 4) / (3 + 1)
# +

# The issue here is a missing parenthesis after "4)"; again, keep in mind you will need to use the escape key (i.e., esc) to resolve the stuck console caused by entering an incomplete command.

# ---------------------- #
# Mathematical Functions #
# ---------------------- #

# We have already discussed arithmetic operators, but R also provides several useful mathematical functions that are worth knowing about. A non-exhaustive list of these includes:

sqrt(25)      # square root
abs(-25)      # absolute value
log10(100)    # logarithm (base 10)
log(100)      # natural log
exp(4.60517)  # natural exponent (i.e., e)

# Unlike the operators shown earlier which involved a single symbol, each of these operations requires the use of a function, which is an aspect of R we will work with a lot moving forward. All functions in R have: 1) a name; and 2) one or more arguments that the function takes within the parentheses. In the case of the first example above involving square root, the name of the function is sqrt and the argument is a single value (e.g., 25).

# -------------------------------
# Using functions & getting help  
# -------------------------------

# The introduction of functions raises an important point about R: namely that it is possible to get documentation for any function (or operator, etc.) via the help operator "?":

?sqrt

# Notice when you run the line above, a help document will appear in the lower right pane with the heading "Miscellaneous Mathematical Functions". By reading through this help file, you can get a sense of what a function does, what arguments it takes, and also see some example code that uses the function in question at the very bottom:

# The most useful aspect of help files however is typically the list of arguments, shown under the "Arguments" subheading. Arguments are used to control what a function does; some arguments may be mandatory, while others may be optional or have default setting values.

# Because arguments are so fundamental when working with functions, you can also preview them in RStudio by hovering your mouse cursor over a function name to see what arguments are required/available. Notice that for sqrt, only a single argument is listed: x (a numeric or complex vector or array). Technically, this means that sqrt could be called precisely via:

sqrt()

# This command indicates that we are supplying the argument named x a value of 25, which is the number we want to find the square root for. When it comes to functions like sqrt that take a single argument, it is common to omit the argument name when specifying the function call as shown earlier in this script:

sqrt(25) # equivalent to sqrt(x = 25)

# However, some functions take more than one argument; for example, the log function used earlier can take up to two, as shown via ?log:

?log

# Notice how for the second argument, base, a default value of exp(1) is indicated in the help file; this means that by default, R will assume you want to use a base of exp(1) (i.e., e) when calling the log function, which is equivalent to a natural log. Thus, all of the following commands return an identical result:

log(100)
log(100, base = exp(1))
log(x = 100)
log(x = 100, base = exp(1))
log(base = exp(1), x = 100)
log(100, exp(1)) # this is slightly dangerous; for example, try log(exp(1), 100)
log(exp(1), 100)
# Note that by providing the names of arguments explicitly, you can change the order in which you supply them. If you do not supply argument names explicitly, R will assume you are providing arguments in the order they are listed in the Arguments subsection of the help file. In general, it is a bad idea to omit the name of an argument for any argument besides the first one. In other words, the following commands are generally acceptable practice:

log(100)
log(100, base = exp(1))

# However, the following commands can be dangerous if you accidentally provide arguments in the wrong order:

log(100, exp(1)) # if this is the intended call
log(exp(1), 100) # this call could lead to a big mistake

# Thus, you should pay attention when working with any function that takes more than one argument. 

# Regardless of how you specify them, arguments are extremely useful. For example, by changing the base of the log function, you can use it for multiple purposes. For example, to calculate a 10-based log rather than the natural log, you could use the following command:

log(100, base = 10) # equivalent to log10(100)
log(100,10)
log10(100)

# Whenever you encounter a new function, be sure to familiarize yourself with its arguments so you fully understand how it works and what possibilities it provides.

# ------------------ #
# Help for Operators #
# ------------------ #

# In the case of operators such as addition, note that you need to slightly change the way you call help by placing the operator in quotes (i.e., ?+ won't work):

?"+"

# Technically you can use quotes with any function to look up help, but it is generally not necessary. In other words, the following help commands are all equivalent:

?sqrt
?"sqrt"
?'sqrt'

# -------------------- #
# Relational Operators #
# -------------------- #

# The previous unit covered arithmetic operators, but R includes several other types of operators that must be discussed. The first of these are relational operators, which can be used to make comparisons:

1 < 2   # less than
1 > 2   # greater than
1 <= 2  # less than or equal to
1 >= 2  # greater than or equal to
1 == 2  # exactly equal to
1 != 2  # not equal to

# Notice that the result of these operations is TRUE (i.e., binary 1) or FALSE (i.e., binary 0), which fall under the logical data type. It is now time to discuss data types in R in further detail.

# ------------ #
# R Data types #
# ------------ #

# Now that you have seen arithmetic and relational operators, it is time to discuss data types in R. Thus far, we have been focusing on math involving numbers, which fall under the numeric data type. However, there are several data types in R including (but not limited to):

# A) numeric (a.k.a double/real): 2, -5.5, 10.34
# B) integer: 1L, 3L, -10L 
# C) logical (aka Boolean): TRUE (1), FALSE (0)
# D) character (aka string/text): "a", 'fish', "hello there!"

# Other core data types include complex and raw, although we will not discuss these in detail since they are utilized infrequently.

# Regarding the list provided however, note that integer values in R are a special case of numeric data and must be explicitly designated via the letter "L" to be treated as such. 

# In other words, by default R will consider the value 2 to be numeric, whereas 2L would be literally treated as integer. It is important to stay aware of this level of specificity when working with R to avoid unintentional mistakes (e.g., if you absolutely expect to be working with integer data in R, you should explicitly declare it as such).

# Conveniently R provides several functions to test and set data types, which all return logical (i.e., TRUE or FALSE) results:

is.numeric(2)
is.integer(2)
is.numeric(2L)
is.integer(2L)
is.character(2)
is.character("2")
is.logical(2)

is.numeric("2") # "2" is a character, and characters are not numeric
is.logical(is.numeric("2")) # the result of is.numeric("2") is FALSE; as such, is.logical(FALSE) returns TRUE

# Moreover, R provides a set of functions to check the type of data you are working with such as:

str(2)
class(2)
typeof(2) # numeric is also referred to as double/real; see ?is.numeric

# As shown with the typeof(2) example, you may need to gain a deeper understanding of some R data types to fully understand the output of these functions.

# Finally, R includes various "as" functions to explicitly declare or "cast" values as a certain data type in cases where you need to convert from one data type to another. For instance:

as.integer(FALSE)
as.numeric("2") + 3
as.character(3 + 5)

# ------------------------ #
# Data Type Considerations #
# ------------------------ #

# It is important to keep data types in mind constantly when working with R since only certain data types make sense for conducting certain operations.

# For instance, you obviously can add two numeric data values such as 2 + 3 as we have seen before, but not one numeric value with one character value such as 2 + "3", which will produce an error (more on errors later). If you are not careful, the various peculiarities regarding data types can lead to mistakes if not paying close attention. For instance, regarding logical data (i.e., TRUE vs. FALSE), keep in mind that TRUE is also represented with the value 1 and FALSE with 0:

FALSE
is.logical(FALSE)
FALSE == FALSE
FALSE == 0

# Thus, it is technically possible to add numeric data to logical data since R will attempt to infer what you are trying to do, but operations such as the following ought to be avoided for obvious reasons:

3 + TRUE

# Moreover, R occasionally provides various shorthand notations that may or may not be worth using despite the fact that they are available. For instance, when it comes to TRUE and FALSE, it is possible to use T and F as more concise alternatives (e.g., see ?TRUE):

T
F
TRUE == T
FALSE == F

# While T and F can technically be used as equivalent substitutes for TRUE and FALSE respectively, they are certainly less legible and also save little typing time. Thus, as stated in the previous unit, in general, the best advice is to be explicit and clear when writing your code, including good use of comments and white space.

# ---------------------------- #
# Character (String/Text) Data #
# ---------------------------- #

# In the preceding section, a few points of clarification were made for integer and logical data. Similarly, it is worth taking a moment to detail some key aspects of character (aka string) data that may not be obvious. For example, consider the following strings taken from the list presented earlier:

"a"
'fish'
"hello there!"

# Note that the second example -- 'fish' -- appears in single quotes, yet in the output it appears in double quotes (i.e., "fish"). This occurs because R always stores character data in double quotes regardless of how you specify it.

# A more interesting issue however is the question of how you can insert a quotation mark within a character string. For example, consider the following attempt, which will not work (i.e., try running the code below without the # at the start of the line):

#=="this " causes a problem"

# To actually include a double quote within a character string that is defined with double quotes, you must use the escape character, which is backslash (i.e., \) in R and several other programming languages such as Python:

#"this \" is not a problem"

# It is worth noting here that R will show \" within the result when running the code above, but \" is simply representing a single " character despite how it may look in the code. To prove this, consider the following trivial example:

"\""

# This string is actually 1 character long and not 2; you can confirm this with the nchar function:

nchar("fish")  # 4 characters
nchar("\"")   # 1 character

# Alternatively, you can display the unescaped form via the cat function:
cat("\"")
cat("in other words, notice how \" does not include the escape character when output using cat")

# It is worth mentioning two related issues when it comes to character strings, quotes, and escape characters. The first is that you can generally avoid escaping double quotes by embedding double quotes within single quotes:

'this " is not a problem' # R will escape this " for you
'this " is not a problem' == "this \" is not a problem" # these strings are treated as identical

# Note that there is no issue embedding a single quote within double quotes, but keep in mind a single quote is not literally identical to a double quote character:

"this ' is not a problem" # a single quote can appear in double quotes without causing any issue
"this ' is not a problem" == 'this " is not a problem' # however these strings are NOT identical (i.e., single quote != double quote, meaning '"' != "'")

# Finally, note that the escape character \ (backslash) is special when it comes to strings since it serves a unique purpose of escaping characters, so if you want to include an actual/literal backslash in a string, the backslash itself must be escaped:

"this \ won't show a backslash in the result" # note the \ is missing in the result
"this \\ will however" # note the \ does appear now as escaped backslash, i.e., \\
nchar("\\") # again, 1 character
cat("as expected, cat will output a single backslash here: \\")
"unlike backslashes, forward slashes like / aren't special and don't need to be escaped"

# Several other special, escapable characters are also defined in R in relation to quotes; for a list, you can find more help on quotes and escape characters via:

?"'" # see the list and examples

# Common ones you may encounter when working with data include the tab (i.e., \t) and newline character (i.e., \n), which we will talk about more when we discuss importing and exporting data:

"this strong contains a tab \t and a newline \n as well"
cat("this strong contains a tab \t and a newline \n as well")


# ------------- #
# Missing Data  #
# ------------- #

# Another fundamental aspect of data types is understanding missing data. In R, missing data is usually/typically represented as NA (without quotes), although you may also occasionally encounter NaN (Not a Number) as well in certain contexts:

NA
is.na(NA)
is.nan(NA)
str(NA)

NaN
is.na(NaN)
is.nan(NaN)
str(NaN)

# Missing data is a common occurrence when working with real-world data problems and a topic we will see again later when working with various statistical functions. Note that having NA values involved in calculations will typically result in an NA being returned in the result:

2 + NA + 3

# Keep in mind there is a substantial difference between missing values (i.e., NA) and numeric values such as zero (i.e., 0); the two are NOT interchangeable and the choice of which to use should be considered carefully depending on the context (e.g., saying you have 0 dollars is not the same as saying you have NA dollars -- the former means you have none, whereas the latter means you don't actually know how many dollars you have; be particularly careful about this when calculating statistics such as means).

# --------------------------------- #
#  R objects & assignment operators #
# --------------------------------- #

# A fundamental aspect of working with data in R involves the use of named objects -- otherwise known as variables -- to store data. The most common way to create an object is to use the <- assignment operator:

var1 <- 2

# The line above creates an object called "var1" in the current R environment that contains the numeric value of 2. To check the value stored in an object, you have several options. One option is to simply call it to have the value printed out to the console:

var1

# Another option is to look in the Environment tab of the top-right pane in R (e.g., under the heading Values, you should see var1 and its value of 2). In any event, if you ever need to get a list of all objects defined in your current R environment, you can use the ls function to find their names:

ls()

# Finally, it's worth mentioning that you can have the value of an object printed out when you assign it in a single step by wrapping the object assignment command in parentheses:

var1 <- 2   # this command will not print the value to the console
(var1 <- 2) # but this one will

# Once an R object is defined, it is possible to use it in a calculation. For example, consider the following command using the object var1, which contains the value 2:

var1 + 2
var1 = 2 * var1
var1 / 2

# If you define several R objects, a command may be composed entirely of objects and no literal values:

var2 <- 10
var3 <- 5

var2/var3

# Values held inside R objects can be updated via reassignment:

var2          # var2 is currently 10
var2 <- 50    # var2 is now 50

# Values held within R objects can also be copied into other R objects:

var2 # 50
var2copy <- var2
var2copy # also 50

identical(var2, var2copy) # the aptly-named identical function can be used to check if two objects are identical

# Moreover, an object can be assigned directly as the result of a calculation involving one or more other objects:

var4 <- (var2 + var3) * var1 + 15
var4 # 125

# Note that the calculation is processed before assignment occurs. In other words, var4 in this example is not storing a calculation, but rather the result of the calculation (i.e., the numeric value 125 in the example above). This means that changing the value of var2 after assigning var4 would not retroactively affect the value of var4, despite the fact that var2 was used to calculate the value of var4 initially. To see this more explicitly, consider the following set of assignments below:

var2 <- 50
var3 <- 5
var1 <- 2
var4 <- (var2 + var3) * var1 + 15
var4 # 125
var2 <- 500 # change var2 from 50 to 500
var4 # still 125 despite the subsequent changes to var2

# It's worth noting that the data type of objects can and will change on the fly as needed during value reassignment (i.e., the R language is dynamically [weakly] typed):

var4        # 125 (numeric)
var4 <- 10L # reassign the value of var4 to 10 (integer)
var4        # 10 (integer)

# R allows you to store any type of data into an object, meaning you are not limited to numeric data types:

str(var4)
(var4 <- "var4 is now a string")
str(var4)

# Note that changing var4 to a character object means it can no longer be used for arithmetic (e.g., the command 3+var4 would cause an error because you cannot add a numeric value [3] to a non-numeric object [var4, assuming it contains a string]).

# Finally, you can remove individual objects from the R environment if desired using the rm function:

ls()
rm(var2)
ls()

# Or you can remove all objects at once using the following command:

rm(list = ls())

# Alternatively, you can remove all objects via Session -> Clear Workspace... in the RStudio menus.

# ------------------------------ #
# Side Note: Errors and Warnings #
# ------------------------------ #

# It's worth taking a moment to talk about errors and warnings in R, which you may have already encountered while working with R. Errors and warnings are R's way of telling you something is wrong or potentially wrong with your code, respectively. To see an example of an error in R, try calling var2 once you have removed it from your R environment (i.e., run the command below without the # sign, making sure var2 has been removed via rm):

# var2 

# Unsurprisingly, this command now returns an error in red within the console: "Error: object 'var2' not found". The rationale behind this error is straightforward: R cannot return an object that does not exist.

# In contrast to errors that indicate a critical mistake, warnings are designed to point out a potential issue that may or may not actually cause a problem. For example, consider what happens if you try to remove var2 repeatedly after it has already been removed:

rm(var2)

# Since we are attempting to remove a variable that has already been removed, this command will subsequently return a warning: "Warning message: In rm(var2) : object 'var2' not found". As stated in the warning message, the warning occurs because the rm command cannot remove a variable that has already been removed; however, the end result is not really a concern for us: no object called var2 will exist after calling rm, so a warning suffices here in place of an error.

# As a general rule, make sure your R scripts are completely error (and ideally warning) free, as this can cause a variety of problems down the road.

# -------------------------- #
# Other Assignment Operators #
# -------------------------- #

# By far the most common way of assigning an object is using the single arrow operator that introduced earlier:

var5 <- 5

# However, R offers two other assignment operators you could use:

var5 = 5
var5 <<- 5

# Moreover, the two operators involving arrows can be used in either leftward or rightward form:

var5 <- 5
5 -> var5

var5 <<- 5
5 ->> var5

# In general, however, you should stick to the basic arrow operator in the leftward form (i.e., <-). The other operators are meant for more specific use cases (e.g., <<- is typically reserved for use in functions; see ?"<-" for more on this).

# ---------------- #
# Naming R Objects #
# ---------------- #

# One important point about naming R objects is that there are rules on what is allowed. The most basic rule is that R object names may contain a combination of numbers, upper case or lower case letters, periods, and underscores:

.this.is_a_VALID_name.345 <- "no error"

# Although the name of the object above is allowed, you should endeavour to give objects names that are meaningful, clear, and consistent (the above object name is obviously not representative of this guideline; moreover, be careful using variables that start with a period, since these do not appear in the environment unless you set the all.names argument to TRUE when calling ls).

# In terms of what is NOT allowed when it comes to naming object, be aware that R object names may NOT:

# - start with a number or underscore
# - start with a period followed by a number
# - contain other symbols such as @ or %

# Also note that R object names are case sensitive, meaning that an object called "var6" would not be the same as "Var6" or "VAR6":

var6 <- "all lowercase"
Var6 <- "title case"
VAR6 <- "all uppercase"

var6
Var6
VAR6

# Finally, you might consider using camel case or other naming schemes for defining variable names, especially when variable names consist of multiple words:

camelCaseExample <- "(for example)"





