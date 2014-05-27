download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ", 
              destfile="hid.csv", method="curl")

data <- read.csv("hid.csv")
agricultureLogical <- (data$ACR ==3 & data$AGS == 6)
which(agricultureLogical)

library(jpeg)
pic <- jpeg::readJPEG("./getdata_jeff.jpg", native=TRUE) 

quantile(pic, probs=c(0.3, 0.8))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile="GDP.csv",method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile="Country.csv", method="curl")

GDP <- read.csv("GDP.csv")
Country <- read.csv("Country.csv")

intersect(GDP$X, Country$CountryCode)

mergedData <- merge(GDP, Country, by.x="X", by.y="CountryCode", all=T)

orderedData <- mergedData[order(as.numeric(mergedData[,2]),decreasing=T),]
