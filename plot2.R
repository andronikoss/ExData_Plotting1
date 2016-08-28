# ---- Plot 2 ----

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

png("plot2.png", width=480, height=480)
plot(df.set$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
     xlab="",axes=F)
axis(1, at=c(1, sum(grepl("1/2/2007",df.set$Date)),dim(df.set)[1]), 
     labels=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off()


