#text variable edition
a <- "abc"
A <- toupper(a)
A
b <- tolower(A)
b

a <- "Location.1"
strsplit(a, "\\.")

firstElement <- function(x){x[1]}

firstElement(c("a","b","c"))

a <- "a_b_c"
sub("_","",a)
gsub("_","",a)

grep("string", table$column)

grepl("string", table$column)

e.g
subdata <- data[!grepl("string", data),]

grep("string", data, value=T)

a <- "akjfkaj;fj"
substr(a, 1, 7)

paste("a","b","c")
paste("a","b","c", sep="")
paste0("a","b", "c")

library(stringr)
str_trim("abc   ")

#regular expression
^ start of a pattern
$ end of a pattern
[Mm]ean 
^[0-9]
[a-zA-Z]
[^?.]$ -> NOT end with ? or .
. -> refer to any character
| or 
eg. ^[Gg]ood|[Bb]ad
^([Gg]ood|[Bb]ad)
[Gg]eorge( [Ww]\.)? [Bb]ush -> ? mean (pattern) is optional
* null or more
+ one or more
{1,5} appear 1 to 5 times
{1} appears 1 time
{1,} appear at leadt one time
eg. [Bb]ush( +[^ ]+ +){1,5} debate

\1 \2
+([a-zA-Z]+) +\1 + means that mean same words appear more than once
eg. blah blah blah
eg. so so 

^s(.*)s$ matches start with s and end with s




#deal with date
d1 <- date()
d1
class(d1)

d2 <- Sys.Date()
d2
class(d2)

%d day
%a abbreviated weekday
%A unabbreviated weekday
%m month(0 - 12)
%b abbreviated month
%B unabbreviated month
%y 2 digit year
%Y 4 digit year

format(d2, "%a, %b, %d")

x <- c(c("1jan1096", "2jan1096","3jan1096"))
z <- as.Date(x,"%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1]-z[2])

weekdays(d2)
month(d2)
julian(d2)

library(lubridate)
ymd("20140101")
mdy("08/04/2013")
dmy("23-06/2014")

ymd_hms("2011-08-09 10:14:02")
ymd_hms("2011-08-09 10:14:02", tz="Pacific/Melbourne")
?Sys.timezone
x = dmy(c("1jan1096", "2jan1096","3jan1096"))
x
wday(x[1])
wday(x[1], label=T)

#data resources
Australia http://data.gov.au
UCI Machine Learning
infochimps.www.com
kaggle.com
Standford Large Network Data
CMU Statlib
Public Data Sets on Amazon Web Service

APIs:
TwitterR
PLos
figshare rgifshare
Google Maps RGoogleMaps
rOpenSci
Facebook RFacebook

