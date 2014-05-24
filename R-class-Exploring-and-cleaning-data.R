#Exploring and cleaning the data
list.files()

if(!file.exists("data")){
    dir.create("data")
}

#download.file()
#parameters:
#url
#destfile
#method: curl

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
#download.file(fileurl, destfile="./data/cameras.csv", method="curl")

#data = read.table("data/cameras.csv",sep=",", header=TRUE)
#data = read.csv("data/cameras.csv")

#library(XML)
#library(xlsx)
#read.xlsx("")
#read.xlsx2("") -> faster

#xml
library(XML)
fileurl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileurl, useInternalNodes=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#use xpath to navigate the xml trees
xpathSApply(rootNode, "//name", xmlValue) # useInternalNOdes=T is necessary
xpathSApply(rootNode, "//price", xmlValue)

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
#doc <- htmlTreeParse(fileUrl, useInternalNodes=T)
#scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)

#teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)


#read json
library(jsonlite)
jsondata <- fromJSON("https://api.github.com/users/szho42/repos")
names(jsondata)
#iris2 <- toJSON(jsondata,pretty=TRUE)
#cat(iris2)
#iris3 <- fromJSON(iris2)

#data.table

library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
#get all the tables(including data.frames)
tables()


#subsetting rows
DT[2,]
DT[DT$y=="a"] # get all rows thaat y == a
DT[c(2,3)] # get 2nd and 3rd rows

DT[,c(2,3)] # does not work that way
#instead,
#an expersion is within a {}

{
    x = 1
    y =2
}
k={print(10); 5} # k = the last element

DT[, list(mean(x), sum(z))]

DT[,table(y)]

#add new columns
DT[, w:=z^2]

DT2 <- DT
DT[, y:=2] # it changes both DT and DT2

#multiple operations
DT[, m:={tmp<-(x+z); log2(tmp+5)}]

#plyr like operations
DT[, a:=x>0]
DT[, b:=mean(x+w), by=a]

#special variables
#.N is an integer, and length 1
set.seed(123)
DT3 <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

#keys
DT <- data.table(x = rep(c("a","b","c"), each=100), y = rnorm(300))
setkey(DT,x)
DT['a']

#joins
DT1 <- data.table(x=c('a','a','b','dt1'), y= 1:4)
DT2 <- data.table(x=c('a','b', 'dt2'), y= 5:7)
setkey(DT1, x); setkey(DT2,x)
merge(DT1, DT2)

#fastr reading
big_df <- data.frame(x=rnorm(1E6), y =rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, 
            sep="\t", quote=FALSE)
system.time(fread(file))

system.time(read.table(file, header=TRUE, sep="\t"))



