#Three system
base
graphics grDevice
latice (lattice package)
ggplot2(ggplot2)

#Base plotting system
?par
library(datasets)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
airquality <- transform(airquality,Month= factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone(ppb)")

pch: plotting symbol(open circle)
lty: line type(solid line/dashed, dotted)
lwd: line width
col: the plotting color eg. colors()
xlab: label for x label
ylab: label for y label

par() global graphic parameters
las: orientation of the axis labels on the plot
bg: background
mar: margin size
oma: outer margin size
mfrow: number of plots per row, column
mfcol: number of plots per row, column

par("lty")
par("col")
par("pch")
par("bg")
par("las")
par("mar")
par("mfrow")
par("mfcol")

#base plotting functions
plot
lines
points
text
title
mtext
axis

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main="Ozeon and Wind")

with(airquality, plot(Wind,Ozone, main="Ozone and WInd"))
with(subset(airquality, Month==5), points(Wind,Ozone, col="blue"))

with(airquality, plot(Wind,Ozone, main="Ozone and WInd"), type="n")
with(subset(airquality, Month==5), points(Wind,Ozone, col="blue"))
with(subset(airquality, Month!=5), points(Wind,Ozone, col="red"))
legend("topright", pch=1, col=c("blue","red"), legend=c("May", "Other Months"))

with(airquality, plot(Wind,Ozone, main="Ozone and WInd"), pch=20)
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2)

#two plots
par(mfrow = c(1,2))
with(airquality,{
    plot(Wind, Ozone, main="Ozone and Wind")
    plot(Solar.R, Ozone, main= "Ozone and Solar Radiation")
})

par(mfrow = c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality,{
    plot(Wind, Ozone, main="Ozone and Wind")
    plot(Solar.R, Ozone, main= "Ozone and Solar Radiation")
    plot(Temp, Ozone, main="Ozone and Temperature")
    mtext("Ozone and Weather in New York City",outer=T)
})

#example
x <- rnorm(100)
hist(x)
hist(x, breaks=10)
hist(x)
y <- rnorm(100)
plot(x,y)
par(mar=c(2,2,2,2))
par(mar=c(4,4,2,2))

plot(x,y, pch=20)
plot(x,y,pch=2)
plot(x,y,pch=3)
title("Scatterplot")
text(-2,-2,"label")
legend("top right", legend="Title")
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd=3)
abline(fit, lwd=3, col="blue")
plot(x,y, xlab="Weight", ylab="Y axis", main="Scatter plot", pch=20)

z <- rpois(100,2)
par(mfrow=c(2,1))
plot(x,y,pch=10)
plot(x,y,pch=19)
par("mar")
par(mar=c(5,4,3,3))
par(mfrow=c(1,2))

par(mfrow=c(2,2))

par(mfcol=c(2,2))

par(mfrow=c(1,1))
x <- rnorm(100)
y <- x+ rnorm(100)
g <- gl(2,50)
g <- gl(2,50, labels=c("Male", "Female"))
plot(x,y,type="n")
points(x[g=="Male"], y [g=="Male"], col="green")
points(x[g=="Female"], y[g=="Female"], col="red")

example(points)

#Graphics Device in R
screen
file: pdf, png, jpeg, svg

x11() screen device on Unix/Linux

?Devices
#Plot to file
pdf(file="myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main="Old Faith geyser data")
dev.off()

#file devices
2 types: vector vs. bitmap

vector format:
pdf
svg
win.metafile(windows only)
postscript

bitmap format:
png
jpeg
tiff
bmp

#multple graphic device
dev.cur()
dev.set(2)

#copy plots
dev.copy # from device to another
dev.copy2pdf

x11()

with(faithful, plot(eruptions, waiting))
title(main="Old faitful Geyser plot")
dev.copy(png, file="geyserplot.png")
dev.off()

