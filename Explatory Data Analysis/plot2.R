# Plot2.R
# Coursera: exploratory data analysis
# Peer-graded Assignment: Course Project 1

# Setting wd, load and subset data
setwd("/home/tobias/Dokumente/DataScience/Exploratory Data Analysis/week 1/")
hhpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE) 
days <- subset(hhpc, hhpc$Date=="1/2/2007" |  hhpc$Date=="2/2/2007")

# Define classes of columns of data
days$Time <- as.POSIXct(strptime(paste(days$Date,days$Time, sep=" "), format="%d/%m/%Y %T"))
for (i in 3:9) {days[,i] <- as.numeric(days[,i])}

# Plot 2
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(days$Time, days$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()