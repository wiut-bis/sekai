# +++++++++++++++++++++++++++
# +++ R BOOTCAMP WEEK 4   +++
# +++ DATA VISUALIZATION  +++
# +++++++++++++++++++++++++++

# -----------
# Point Plots
# -----------

?plot
data(cars)
data(mtcars)
# REGULAR PLOTTING
## Let's plot these two columns against one another:

plot(x = cars$speed, y = cars$dist) # how would you describe this relationship?
# +++ OR +++ #

plot(dist ~ speed, data = cars, main = "Scatterplot", sub="Cars")

# PLOTTING TWO GRAPH IN ONE
plot(dist ~ speed, data = cars)
abline(lm(dist ~ speed, data = cars))
abline(h = 80, col = "blue")
abline(a = 10, b = 5, col = "blue")
# PERSONALIZED PLOTTING

plot(dist ~ speed, data = cars, 
     main = "Stopping Distance Relative to Car Speed", 
     xlab = "Speed (mph)", 
     ylab = "Stopping Distance (ft)",
     cex = 1.8,
     col = "blue",
     pch = 21,
     cex.axis = 1.1,
     cex.main = 2.0,
     cex.lab = 1.25,
     bg = "pink")

abline(lm(dist ~ speed, data = cars), 
       col = "red",
       lty = 5,
       lwd = 3)

# ----------
# Line Plots
# ----------

# To generate a line plot, set the type to "l":

linePlotDat <- data.frame(
  x = 1:8,
  y = c(3,3,1,2,3,0,0,0)
) # some example data

plot(y ~ x, data = linePlotDat, type = "l")

# To generate both points and lines, see the type to "o" (overplotted):
plot(y ~ x, data = linePlotDat, type = "o")


# ----------------
# TIME SERIES DATA
# ----------------

data(LakeHuron)
?LakeHuron

class(LakeHuron)
?ts

length(LakeHuron)

plot(x = 1875:1972, y = LakeHuron, type = "l", xlab = "Year", ylab = "Measured Level (ft)", col = "blue")

# OPTIONAL. 
# How to compare stock prices of different companies using line graph.
install.packages("quantmod") 
library(quantmod)
tesla <- getSymbols("TSLA", src = "yahoo", from = "2013-01-01", to = "2021-02-14", auto.assign = FALSE) #Tesla
fb <- getSymbols("FB", src = "yahoo", from = "2013-01-01", to = "2021-02-14", auto.assign = FALSE)      #Facebook

plot(x = index(tesla), y = tesla[,6], type = "l", col="#cc33ff", ylab = "Stock Price (USD)", xlab = "Period")
lines(x = index(fb), y = fb[,6], type = "l", col="#0000ff")
legend("top", legend=c("Tesla", "Facebook"), col=c("#cc33ff", "#0000ff"), lty=1:2)


a <- getSymbols("GOOG", src = "yahoo", from="2011-01-01", to = "2021-02-01", auto.assign = F)
a
# ------------------------
# Bar Plots and Histograms
# ------------------------

data(mtcars) # use the mtcars data for these examples

## Bar plot:
barplot(table(mtcars$gear))

## Histogram: 
hist(mtcars$mpg)

# Personalized Histogram: 
hist(mtcars$mpg, 
     col = "lightblue",
     xlab = "MPG",
     main = "Histogram of MPG",
     cex.axis = 1.1,
     cex.main = 2.0,
     cex.lab = 1.25,
     breaks = 10)

#OPTIONAL
# How to plot two histograms in the same graph
f <- rnorm(100, mean = 165, sd = 5)
m <- rnorm(100, mean = 170, sd = 7)

b <- min(f,m)-0.001 # Set the minimum for the breakpoints
e <- max(f,m) # Set the maximum for the breakpoints
ax <- pretty(b:e, n = 12) # Make a neat vector for the breakpoints

fH <- hist(f, breaks = ax, plot = FALSE)
mH <- hist(m)

c1 <- rgb(173,216,230,max = 255, alpha = 100, names = "lt.blue")      #transparent light blue
c2 <- rgb(255,192,203, max = 255, alpha = 100, names = "lt.pink")   #transparent light pink

plot(mH, col = c1)
plot(fH, col = c2, add = TRUE)
# ---------
# Box Plots
# ---------

data(InsectSprays) 

?InsectSprays

boxplot(count ~ spray, data = InsectSprays, col = "lightgray")


# -----------------------
#  Saving Plots to Disk 
# -----------------------

# PDF
pdf(file = "InsectSpraysBoxplot.pdf", width = 8, height = 5) # width/height in inches
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
dev.off()

# PNG
png(file = "InsectSpraysBoxplot.png", width = 800, height = 500) # width/height in pixels
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
dev.off()



