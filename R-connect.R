#connect with mysql

library(RMySQL)

ucscDB <- dbConnect(MySQL(), user="genome", hos="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDB, "show databases;")
dbDisconnect(ucscDB)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#affyData <- dbReadTable(hg19, "affyU133Plus2")
#head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10)
dbClearResult(query)

dim(affyMisSmall)

dbDisconnect(hg19)


#connect with R HDF5
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)

created = h5createFile("example.h5")
created

created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","bar")
created = h5createGroup("example.h5","foo/foobar")
htls("example.h5")

A = matrix(1:10, nrow=5, ncol=2)
h5write(A, "example.h5", "foo/A")

A1 <- matrix(10:19, nrow=5, ncol=2)
h5write(A1, "example.h5","foo/A1")

B = array(seq(0.1,2.0, by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "Liter"
h5write(B, "example.h5", "foo/foobar/B")
h5ls("examples.h5")

df = data.frame(1L:5L, seq(0,1, length.out=5),
                c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobar/B")
readdf = h5read("example.h5", "df")
readA

h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
h5read("example.h5", "foo/A")

#read from web
#method 1
con = url("http://www.google.com.au")
htmlCode <- readLines(con)
close(con)
htmlCode

#method 2
library(XML)
url <- "http://www.google.com.au"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

#method 3
library(httr)
html2 <- GET(url)
content2 = content(html2, as="text")
parsedHtml <- htmlParse(content2,asText=T)
xpathSApply(parsedHtml, "//title", xmlValue)

#accessing with authentication
pg2 <- GET("http://www.google.com.au/login", 
           authenticate("username", "passwd"))
pg2
names(pg2)

#using handles with sessions
google = handle("http://www.google.com.au")
pg1 <- GET(handle=google, path="/")
pg2 <- GET(handle=google, path="search")


#read from APIs
myapp = oauth_app("twitter",                   
                  key="", 
                  secret="")
sig <- sign_oauth1.0(myapp, token="",
                      token_secret="")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
json1 <- content(homeTL)
library(jsonlite)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

#read from other resources
file
url
gzfile
bzfile
connection

foreign package
load data from Minitab, S, SAS, SPSS, etc,
read.arff(Weka),
etc.

#other databases
RPostresSQL
RODBC
RMongo
rmongodb

#read images
jpeg
readbitmap
png
EBImage(Bioconductor)

#read GIS data
rdgal
rgeos
raster

#reading music data
turnR
seewave



