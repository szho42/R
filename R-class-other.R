#str function
#display the internal structure of an R object
str(lm)
#summary(lm)

#simulation
#probability distributions in R
rnorm(10) # normal distribution
dnorm(10)
pnorm(10)
rpois(10,1)

#d r p q
#d -> density
#r -> random number generation
#p -> cumulative distirubiton
#q -> quantile function

#for eath type distribution, they have all these functions

rnorm(10) # 10 Numbers
x <- rnorm(10,20, 2)

#random using seed
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10,1)
rpois(10,2)

ppois(2,2) ##Pr(x<=2)
ppois(4,2)
ppois(6,2)

#generate random numbers from a linear modle
set.seed(20)
x <-rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x +e

summary(y)
plot(x,y)


set.seed(10)
x <- rbinom(100,1,0.5)
e <-rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)

plot(x,y)


set.seed(1)
x <-rnorm(100)
log.mu <- 0.5 + 0.3*x
y <-rpois(100, exp(log.mu))
summary(y)
plot(x,y)


#random sampling
set.seed(1)
sample(1:10,4)
sample(1:10,4)

sample(letters,5)

sample(1:10)

sample(1:10, replace = TRUE)

#R profiler
system.time(rnorm(10))
#
#user_time -> CPU time
#elapsed time -> for me

#system.time(readLines("http://www.monash.edu"))

hilbert <- function(n){
    i <-1:n
    1/outer(i-1,i,"+")
}

x <- hilbert(1000)
#system.time(svd(x))

#Rprof()
#summaryRprof()

