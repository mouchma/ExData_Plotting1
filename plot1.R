
library("dplyr")
#set the working directory for this file
setwd("C:/Users/maril/OneDrive/Documents/R Data Science/Course4/Week1")
hpc<- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

hpc$Date<-as.Date(hpc$Date, format=c("%d/%m/%Y"))

pwr <- subset(hpc, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))


#problem1
hist(pwr$Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)",col="red", ylim=c(0,1200))

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()