#*apply loop function
#lapply -> list
#sapply ->
#apply ->
#tapply
#mapply -> multivariate
#split

#lapply
#lapply(list, Function, ...)
#return a list
x <-list(a=1:5, b=rnorm(10))
lapply(x,mean)
lapply(x,sum)

x<- 1:4
lapply(x,runif)
lapply(x, runif, min=0, max=10)

x <- list(a=matrix(1:4,2,2), b= matrix(1:6,3,2))
lapply(x, function(elt) elt[,1]) #anonmyous function

#sapply
#return a sequence
sapply(x, mean)

#apply
#over a margins of an array
#aguemnts, data, margin, function
x<- matrix(rnorm(200),20,10)

apply(x,2,mean) # apply for mean of column
apply(x,1,sum) # apply for sum of each row

#easy functions to use for row and column
rowSumns = apply(x,1,sum)
rowMeans = apply(x, 1,mean)
colSums = apply(x,2,sum)
colMeans = apply(x,2,mean)

apply(x,1,quantile,probs=c(0.25,0.75))

x <-array(rnorm(2*2*10), c(2,2,10))
apply(x, c(1,2), mean)
#rowMeans(a, dims=2)

#tapply
#over subset of a vector
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)

tapply(x,f,mean)
tapply(x,f,mean,simplify=FALSE)
tapply(x,f,range)

#split
# splite into groups
#based on factor

x <- c(rnorm(10),runif(10),rnorm(10,1))

f <- gl(3, 10)
split(x,f)

library(datasets)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], 
                               na.rm=TRUE))

x <- rnorm(10)

f1 <- gl(2,5)
f2 <-gl(5,2)
interaction(f1,f2)

str(split(x,list(f1,f2)))
str(split(x,list(f1,f2), drop=TRUE))

#mapply
#multivariate apply of sorts
x <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep,1:4,4:1)

#vectorize a function
noise <- function(n, mean,sd){
    rnorm(n,mean,sd)
}

mapply(noise, 1:5, 1:5, 2)


