library(lattice)
xyplot
bwplot: boxplot
histogram
stripplot
dotplot
splom 
lovelplot, contourplot: image

xyplot(y ~ x | f * g, data)
y, x : varilables
f,g : conditional 

xyplot(Ozone ~ Wind, data= airquality)

airquality <- transform(airquality, Month= factor(Month))
xyplot(Ozone ~ Wind | Month, data=airquality, layout = c(5,1))

#lattice returns an object of class trellis
#trellis objects are auto-printed

p <- xyplot(Ozone ~ Wind, data=airquality)
print(p)

#panel function
set.seed(100)
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x + f - f*x + rnorm(100, sd=0.5)
f <- factor(f, labels=c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout=c(2,1))

xyplot(y ~ x | f, panel = function(x,y,...){
    panel.xyplot(x,y,...)
    panel.abline(h=median(y), lty=2)
})

xyplot(y ~ x | f, panel = function(x,y,...){
    panel.xyplot(x,y,...)
    panel.lmline(x,y, col=2)
})



