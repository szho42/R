x <- c("I love statistics")

#data type
#numbers: double precision real numbers
#logic: True/False
#Inf, Nan -> Speical number

#Attributes of objects
#names, dimnames
#dimensions
#class
#length
#other functions
#attributes() function to access attributes

#assign symbol <-
y <- 1
print(y)
msg <- "Hello R"

#comment using #

#sequence using : operator
w <- 1:20

#c() concaticate
m <- c(0.5,0.6)
n <- vector("numeric",length=10)

#coercion 
x <- c(1.7, "a") ##characeter
x <- c(TRUE, 2) ##numerric
x <- c("a", TRUE) ##character
# character <- numeric < logic

#explicit coercion
x<-0:6
class(x)

as.numeric(x)
as.logical(x)
as.character(x)

#nonsensical coercion
x <- c("a","b","c")
as.numeric(x)

#matrix
m <- matrix(nrow=2,ncol=3)
dim(m)
attributes(m)
m <- matrix(1:6, nrow=2, ncol=3)

#create matrix from reshape a vector
mat <- 1:10
dim(mat) <- c(2,5)

#create matrix using cbind and rbind
x <- 1:3
y <- 10:12
cbind(x,y)

rbind(x,y)

#list can contain different type elements
l <- list(1, "a", TRUE, 1+41)

#Factors like a vector of intergers 
#and each interger has a label
#order vs. unorder
x <- factor(c("yes","yes","no"))
table(x)
unclass(x)

x<- factor(c("yes","yes","no"),
          levels = c("yes","no"))

#missing values
#na nan > NA and NaN
is.na(1)
is.na(NaN)
is.nan(NaN)

x <- c(1,2,NA,10,3)
is.nan(x)
is.na(x)

#data frames
#tabular data
#each column can have different types
#row.names
#read.table()
#read.csv()
#convert to a matrix data.matrix() 

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(x)
ncol(x)

#names
x <- 1:3
names(x)
names(x) <- c("a","b","c")

#name of list
x <- list(a =1, b = 2, c=3)

#name of matrix
m <- matrix(1:4, nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))

#subsetting
# [ 
# [[
# $

x <- c("a","b", "c", "d", "e", "a")
#numeric subsetting
x[1]
x[1:4]
#logic subsetting
x[x>"a"]
u <- x>"a"
x[u]

#subsetting matrix
x<-matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,2]

#using drop attribute to get back a matrix from a matrix
x[1,2,drop=FALSE]

x[1,] #vector
x[1, , drop=FALSE] #matrix

#subsetting a list
x <-list(foo=1:4, bar=0.6)
x[1] #return a vector named as foo
x[[1]] #return a sequence

x$bar
x[["bar"]]
x["bar"]
class(x["bar"])

x <- list(foo=1:4,bar=0.6,baz="hello")
x[c(1,3)]

#[[
name <- "foo"
x[[name]]
x$name
x$foo

#subsetting nested elements of a list
x<- list(a=list(10,12,14),b=c(3.14,2.81))

x[[c(1,3)]]
x[[1]][[3]]

x[[c(2,1)]]

#Partial matching
x <- list(aardvark =1:5)
x$a
x[["a"]]
x[["a",exact=FALSE]]

#remove missing values
x <- c(1,2,NA,4,NA,5)
bad <-is.na(x)
x[!bad]

y <- c("a","b","c","d", NA,NA)

good <- complete.cases(x,y)

x[good]

y[good]

#example
library(datasets)
airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]

#read and write data
#read.table read.csv tabular data
#readLines textfile
#source R code
#dget R code 
#load binary objects

#write.table
#writeLines
#dump

#read.table
#read.table(file, header(T/F), sep(separator), 
#           colClasses, nrows, comment.char,
#           skip(from begining), stringAsFactors)
#data <- read.table("foo.txt")

#read.csv is comma separated

#for large dataset
#R store all the objects in the physical memory
#set comment.char = ""

#set colClasses
#initial <- read.table("datatable.txt",nrows=100)
#classes <- sapply(inital,class)
#tabAll <- read.table("datatable.txt",
#                     colClasses = classes)

#textual formats
#dumping dputing -> save R objects
#dump dput
#Textual

y<-data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
new.y <- dget("y.R")
new.y

#dump for mulitple R objects
x<- "foo"
y <- data.frame(a=1,b="a")
dump(c("x","y"), file="data.R")
rm(x,y)
source("data.R")
y
x

#interfaces to the outside world
#connection
#file, gzfile,bzfile,url

#con <- file("foo.txt","r")
#data <- read.csv(con)
#close(con)

#con <- gzfile("words.gz")
#x<-readLines(con,10)

#con <- url("http://url")
#x <- readLines(con)
#head(x)

#introduction to swirl

#subset command
#subset(data, Ozone>31)
#subset(data, Ozone>31 & Temp>90)
#subset(data, Month ==6)


