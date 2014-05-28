#clustering
#hierarchical clustering
#distance
how to define distance/similarity
1. continuous - euclidean distance
2. continuous - correlation similarity
3. binary - manhattan distance

eg. 
set.seed(1234)
par(mar=c(0,0,0,0))
x<- rnorm(12, mean=rep(1:3,each=4), sd=0.2)
y<- rnorm(12, mean=rep(c(1,2,1), each=4), sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05, y + 0.05, labels = as.numeric(1:12))

df <- data.frame(x=x,y=y)
dist(df) #euclidean

distxy <- dist(df)
hClustering <- hclust(distxy)
plot(hClustering)


eg2.
df <- data.frame(x=x,y=x)
set.seed(143)
dataMatrix <- as.matrix(df)[sample(1:12),]
heatmap(dataMatrix)

#k-means clustering
#fix number of clusters pre-defined
#get centroids of each cluster
#assign things to closest centroid
#recalculate centroids
kmeans()
kmeanObj <- kmeans(df, centers=3)
names(kmeanObj)
par(mar=rep(0.2,4))
plot(x,y,col=kmeanObj$cluster, pch=19, cex=2)
points(kmeanObj$centers, col=1:3, pch=3, cex=3, lwd=3)

heatmap()
dm <- as.matrix(df)[sample(1:12),]
kmeanObj2 <- kmeans(dm, centers=3)
par(mfrow=c(1,2), mar=c(2,4,0.1,0.1))
image(t(dm)[,nrow(dm):1], yaxt="n")
image(t(dm)[, order(kmeanObj2$cluster)], yaxt="n")


