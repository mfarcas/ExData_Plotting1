
# read all the data
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
# convert to Date format
fulldata$Date<-strptime(paste(fulldata$Date, fulldata$Time), format="%d/%m/%Y %H:%M:%S")

#subset the rows of interest
data<-subset(fulldata, fulldata$Date>="2007-02-01" & fulldata$Date<"2007-02-03")

# and now plot 4
par(mfrow=c(2,2))

# first quadrant
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# second quadrant to the right
data$Voltage<-as.numeric(as.character(data$Voltage))
plot(data$Date, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#third quadrant(lower left)
plot(data$Date, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$Date, data$Sub_metering_2, type="l", col="red")
points(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), 
       col=c("black", "red", "blue"), lty=1, cex=0.4, box.lwd=0, inset=0.01)
#fourth quadrant
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
plot(data$Date, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()

