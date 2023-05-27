#problem2
library("dplyr")
#set the working directory for this file
setwd("C:/Users/maril/OneDrive/Documents/R Data Science/Course4/Week1")
hpc<- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

hpc$Date<-as.Date(hpc$Date, format=c("%d/%m/%Y"))

pwr <- subset(hpc, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
pwr$DateTime <-as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
head(pwr)


plot(x=pwr$DateTime, y=pwr$Global_active_power, type="l", xaxt='n', xlab="Date", ylab="Global Active Power (kilowatts)")
axis(1, pwr$DateTime, format(pwr$DateTime, "%a"))

#Save to a png file
dev.copy(png, file="plot2.png", height=480, width=480)
#close the connection
dev.off()