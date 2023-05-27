
library("dplyr")
#set the working directory for this file
setwd("C:/Users/maril/OneDrive/Documents/R Data Science/Course4/Week1")
hpc<- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

hpc$Date<-as.Date(hpc$Date, format=c("%d/%m/%Y"))

pwr <- subset(hpc, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
pwr$DateTime <-as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")

#set global options for outputing the graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#create the graphs
plot(x=pwr$DateTime, y=pwr$Global_active_power, type="l", xaxt='n', xlab="Date", ylab="Global Active Power (kilowatts)")
axis(1, pwr$DateTime, format(pwr$DateTime, "%a"))

plot(x=pwr$DateTime, y=pwr$Voltage , type="l", xaxt='n', xlab="Date", ylab="Voltage")
axis(1, pwr$DateTime, format(pwr$DateTime, "%a"))

plot(x=pwr$DateTime, y=pwr$Sub_metering_1, main = "", xlab="Date", ylab="Energy sub metering", col="black", type="n")
lines(x=pwr$DateTime, y=pwr$Sub_metering_1, main = "", xlab="Date", ylab="Energy sub metering", col="black")
lines(x=pwr$DateTime, y=pwr$Sub_metering_2, col = "blue")
lines(x=pwr$DateTime, y=pwr$Sub_metering_3, col = "red")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=pwr$DateTime, y=pwr$Global_reactive_power  , type="l", xaxt='n', xlab="Date", ylab="Global_reactive_power")
axis(1, pwr$DateTime, format(pwr$DateTime, "%a"))

#Save to a png file
dev.copy(png, file="plot4.png", height=480, width=480)
#close connection
dev.off()