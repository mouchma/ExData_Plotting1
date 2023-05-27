library("dplyr")
#set the working directory for this file
setwd("C:/Users/maril/OneDrive/Documents/R Data Science/Course4/Week1")
hpc<- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

hpc$Date<-as.Date(hpc$Date, format=c("%d/%m/%Y"))

pwr <- subset(hpc, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
pwr$DateTime <-as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=pwr$DateTime, y=pwr$Sub_metering_1, main = "", xlab="Date", ylab="Energy sub metering", col="black", type="n")
lines(x=pwr$DateTime, y=pwr$Sub_metering_1, main = "", xlab="Date", ylab="Energy sub metering", col="black")
lines(x=pwr$DateTime, y=pwr$Sub_metering_2, col = "blue")
lines(x=pwr$DateTime, y=pwr$Sub_metering_3, col = "red")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save to a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()