set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] <- NA

X[,1]
X[,"var1"]
X[1:2, "var2"]

X[(X$var1 <=3 & X$var3 > 11),]
#Dealing with missing values
X[which(X$var2 > 8),]

#sort
sort(X$var1)
sort(X$var1, decreasing=T)
sort(X$var2, na.last=T)

#order
X[order(X$var1),]
X[order(X$var1, X$var3),]

#order with plyr
library(plyr)
arrange(X, var1)
arrange(X,desc(var1))

#add rows and columns
X$var4 <- rnorm(5)
Y <- cbind(X,rnorm(5))

#summarize data
summary()
str()
head()
tail()
quantile()
table()
#eg.table(x, useNA="infVal")
table(x,y) 
sum(is.na(x$var1))
any(is.na(x$var1))
all(is.na(x$var1))
all(x$var1 > 0)
colSums(is.na(x))
all(colSums(is.na(x)) == 0)
table(x$var %in% c(1,2,3))
table(x$var %in% c("a","b"))

x[x$var %in% c("a","b"),]

data(UCBAdmissions)
df <- as.data.frame(UCBAdmissions)
summary(df)
xt <- xtabs(Freq ~ Gender + Admit, data= df)

warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~., data=warpbreaks)
ftable(xt)

object.size(data)
print(object.size(data), units="Mb")

#create new varilabes
s1 <- seq(1,10, by=2)
s2 <- seq(1,10, length=3)
s3 <- c(1,2,5,4,10);
seq(along=s3)

x$var4 <- ifelse(x$var1 <0, TRUE, FALSE)
table(x$var4, x$var4 <0)

#cut()
x$var5 <- cut(x$var2, breaks=quantile(x$var2))
table(x$var5, x$var2)

#easier cutting
library(Hmisc)
x$var5 <- cut2(x$var2, g=4)

#factor varialbe
x$factvar <- factor(x$var2)

yesno <- sample(c("yes","no"), size = 10, replace=T)
yesnofac = factor(yesno, levels=c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

library(Hmisc);library(plyr)
x <- mutate(x1 , zipGroups = cut2(x2,g=4))

#common transforms
abs()
sqrt
ceiling
floor
round
signif
cos
sin
log
log2
log10
exp


#reshape data
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg","hp"))
head(carMelt, n=3)

cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray,sum)

spIns = split(InsectSprays$count, InsectSprays$spray)
sprCount = lapply(spIns, sum)
unlist(sprCount)
sapply(spIns,sum)

ddply(InsectSprays, .(spray), summarize, sum=sum(count))

spraySums <- ddply(InsectSprays, .(spray), summarize, sum = ave(count, FUN=sum))
dim(spraySums)

#merge data
merge()
mergedData =merge(reviews, solutions, by.x="solution_id", by.y="id", all=T)
head(mergedData)
intersect(names(solutions), names(reviews))
mergedData2 = merge(review, solutions, all=T)

#join in plyr
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1,df2), id)

df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df3 = data.frame(id=sample(1:10), z=rnorm(10))
dfList <- list(df1,df2,df3)
join_all(dfList)
