# ---- Plot 3 ----

# Set Working directory
setwd("D:/Users/s4anstep/Dropbox/Coursera/Exploratory Data Analysis/week 1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="data.zip")
unzip("data.zip")
df <- read.table("household_power_consumption.txt", header=T, sep=";",
                 stringsAsFactors = F, na.strings="?")

library(dplyr)
df <- tbl_df(df)
glimpse(df)

df.set <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007" )
glimpse(df.set)

png("plot3.png", width=480, height=480)
plot(df.set$Sub_metering_1, t="l", ylab="Energy sub metering", axes=F, xlab="")
axis(1, at=c(1, sum(grepl("1/2/2007",df.set$Date)),dim(df.set)[1]), 
     labels=c("Thu","Fri","Sat"))
axis(2)
box()
lines(df.set$Sub_metering_2,col="red")
lines(df.set$Sub_metering_3,col="blue")
legend("topright", legend=names(df.set)[7:9],
       col=c("black", "red", "blue"),
       lty=rep(1,3))
dev.off()
