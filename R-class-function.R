#control structures
#if, else
#while
#for
#repeat
#break
#next
#return
a <- 2
if(a >3){
  print("1")
}else if(a == 2){
  print("2")
}else{
  print("3")
}

for(i in 1:10){
  print(i)
}

x <- c("a","b","c","d")

for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in 1:4) print(x[i])

#all the above for statments are same

#loop nested 
x<- matrix(1:6, 2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#while
count <- 0
while(count >=0 && count <10){
  print(count)
  count <- count +1
}

#repeat
count <- 0
repeat{
  print("Hello")
  if(count > 5){break}
  
  count <- count + 1
}

#next
for(i in 1:100){
  if(i<20){
    next
  }
}

#function
#f <- function(<arguments>){
#  ##do something
#  return
#}

mydata = rnorm(100)
sd(mydata)

#show arguments list
args(lm)

#lm(y - x,mydata, 1:100, model=FALSE)

f <- function(a,b=1,c=2,d=NULL){
  
}

#lazy evaluation
f <- function(a,b){
  a^2
}

f(2)
f(4)

x <- rnorm(5)
y <- rnorm(5)
#...arguments
myplot <- function(x,y,type="1",...){
  plot(x,y,type=type,...)
}
#...for arguments that are unknown before hand
args(paste)
args(cat)

#arguments after ... are named

add <- function(...){
  sum(...)
}

threshold <- function(vec, thres=10){
  use <- x>thres
  vec[use]
}

colmean <- function(data, rmNA=TRUE){
  nc <- ncol(data)
  means <- numeric(nc)
  
  for(i in 1:nc){
    means[i] <- mean(data[,i], na.rm=rmNA)
  }
  means
}

#scoping rules
#search list starts with .GlobalEnv
#so self-defined functions are chosen first

#R has separate namespaces for functions and 
#non-functions, such as function f and varilable f

f <- function(x,y){
    x*y/z #z is a free variable
}

#search free variable
#from local scope -> parent level -> global level -> top level -> empty 
#environment -> if not found: throw missing value error

make.power <- function(n){
    pow <- function(x){
        x^n
    }
    pow
}

cube <- make.power(3)
square <- make.power(2)

ls(environment(cube))
get("n",environment(cube))

#lexcical vs. Dynamical scoping
#lexical : search from inside to parent
#dynamic: search from inside to the function that calls

#vectorized operations/element-wise
x <- 1:4;y<-6:9
x+y
x>2
x>=2
y==8
x*y
x/y

x<-matrix(1:4, 2,2)
y<-matrix(rep(10,4),2,2)
x*y #element-wise multiplication
x/y #element-wise division
x %*% y #matrix mulication

#date and time
x <- as.Date("1970-01-01")
unclass(x)
unclass(as.Date("1970-01-03"))

x <- Sys.time()
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

x <- Sys.time()
unclass(x)
p <- as.POSIXct(x)

datestring <- c("January 1, 2012 10:30", "December 9, 2011")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:30:21", "%d %b %Y %H:%M:%S")
x <- as.POSIXct(x)
x-y

x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz="GMT")
y-x


