library(ggplot2)
grammar of graphics

#qplot() : quick plot
#ggplot(): core function

x<-rnorm(100)
y<- rnorm(100)
qplot(x,y)

str(mpg)
qplot(displ,hwy, data=mpg)
qplot(displ,hwy, data=mpg, color=drv)

#adding a geom
qplot(displ,hwy, data=mpg, geom=c("point","smooth"))

qplot(hwy, data=mpg, fill=drv)

#facets:panel
qplot(displ,hwy, data=mpg, facets=.~drv)

qplot(hwy, data=mpg, facets=drv~., bindwidth=2)

qplot(hwy, data=mpg, geom="density",color=drv)

#qplot(displ,hwy, data=mpg, color=drv, geom=c("point","smooth") method="lm")

qplot(displ,hwy, data=mpg, color=drv, facets = .~drv)

#basic components of ggplot2
data frame
aesthetic mappings
geoms
facets
stats
scales
coordinate system

#example
g <- ggplot(mtcars, aes(disp, mpg))

p <- g+geom_point()
print(p)

g + geom_point()

g + geom_point() + geom_smooth()

#add geom
g + geom_point() + geom_smooth(method="lm")

#adding facets layer
g + geom_point() + facet_grid(. ~ cyl) + geom_smooth(method="lm")

#annotation
g + geom_point() + facet_grid(. ~ cyl) + geom_smooth(method="lm") + xlab("X axis")
ggtitle()
xlab()
ylab()

#theme
theme_gray()
theme_bw()

g + geom_point() + facet_grid(. ~ cyl) + geom_smooth(method="lm") + theme_bw()

#modify aesthetics
g + geom_point(color="steelblue", size=4, aplpha=1/2)
g + geom_point(aes(color=cyl), size=4, aplpha=1/2)
#labels
g + geom_point()+ labs(x=expression("x label" * 2), y="y label")

#font
g + geom_point(color="steelblue", size=4, aplpha=1/2) + theme_bw(base_family="Times")

eg.
#axis limits
testdat <- data.frame(x=1:100,y=rnorm(100))
testdat[50,2] <- 100
plot(testdat$x, testdat$y, type="l", ylim=c(-3,3))

g <- ggplot(testdat, aes(x=x, y=y))
g+geom_line()

g+geom_line() + ylim(-3,3)
g+geom_line() + coord_cartesian(ylim=c(-3,3))


