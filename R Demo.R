2 + 5
# This is a comment
3 + 5
print('I am 12')
3 + 4

x <- 2
x <- 3
x
y <- c(1, 2, 3, 4, 5)
z <- 1:10
a <- b <- 1:7
a + b
c = a + b
c2 <- a * b
X <- 10

ls()

rm(X)  # deletes X variable
remove(c2)  # same thing

rm(list = ls())  # removes all stored variables



browseURL('http://cran.r-project.org/web/views/')
# Other sites are:
# http://cran.stat.ucla.edu/web/packages/available_packages_by_name
# http://crantastic.org

install.packages('LiblineaR')

library()  # shows the list of all the packages installed

search()  # shows list of currently loaded packages

# To load a package:
require('LiblineaR')

# To know more about a package:
? LiblineaR

# List of inbuilt datasets in R:
data()
# OR
library(help='datasets')

? iris
str(iris)

iris

# To load the iris dataset into your workspace:
data('iris')


# To create a sequence of numbers
x1 <- seq(5, 50, by=5)

# To create your sequence
x2 <- scan()


# Importing from csv or txt files
product <- read.table('C:/Users/ugonn/Videos/DS/ML Course/Data Files/1. ST Academy - Crash course and Regression files/Product.txt', header = TRUE, sep = '\t')
str(product)

customer <- read.csv('C:/Users/ugonn/Videos/DS/ML Course/Data Files/1. ST Academy - Crash course and Regression files/Customer.csv', header = TRUE)
customer

# To see the whole dataset:
View(customer)

y <- table(customer$Region)
y

# To create a bar plot with this newly created table
barplot(y)

# To arrange the bars in ascending order
barplot(y[order(y)])
# descending order:
barplot(y[order(-y)])

barplot(y[order(-y)], horiz = TRUE)

barplot(y[order(-y)], col = 'red')

barplot(y[order(-y)], col = c('red', 'cyan', 'green', 'blue'))

colors()

barplot(y[order(-y)], col = c(1, 40, 71, 146))

# To remove the border around the bars
barplot(y[order(-y)], col = c('red', 'cyan', 'green', 'blue'), border = NA)

# To add a title
barplot(y[order(-y)], col = c('red', 'cyan', 'green', 'blue'), border = NA, main = 'Freq of Regions')

barplot(y[order(-y)], col = c('red', 'cyan', 'green', 'blue'), border = NA, main = 'Freq of Regions', xlab = 'Number of \n Customers')


# Histograms
hist(customer$Age)

# To choose the number of bars. R sometimes cannot get the exact number
hist(customer$Age, breaks = 5)

# You could also create your own weights:
hist(customer$Age, breaks = c(0,40,60,100))

hist(customer$Age, breaks = c(0,40,60,100), freq = TRUE)

# The color, name change and label parameters in bar plot is also applicable here.








