# ---- Plot 1 ----

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

# Some tricky way. but it works fine!
globalActivePower <- unclass(df.set %>% select(Global_active_power))$Global_active_power
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



