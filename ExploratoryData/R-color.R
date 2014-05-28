#Plotting and color
grDevices package
library(grDevices)
#colorRamp() and clorRampPalette ()

colors() -> list all the colours

pal <- colorRamp(c("red", "blue"))
pal
pal(0)
pal(1)
pal(0.5)

pal(seq(0,1,len=10))

#colorRampPalette -> return a list with interpolated values
pal <- colorRampPalette(c("red","yellow"))
pal(2)
pal(10)

#RColorBrewer Package
library(RColorBrewer)
RColorBrewer::display.brewer.all()

cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcane, col=pal(20))

x<- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)

#rgb function
plot(x,y, col=rgb(0,0,0,0.2), pch=19)
