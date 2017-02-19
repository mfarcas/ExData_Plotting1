# read all the data
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
# convert to Date format
fulldata$Date<-strptime(paste(fulldata$Date, fulldata$Time), format="%d/%m/%Y %H:%M:%S")

#subset the rows of interest
data<-subset(fulldata, fulldata$Date>="2007-02-01" & fulldata$Date<"2007-02-03")
par(mfrow=c(1,1))

#create and save Plot3
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
plot(data$Date, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$Date, data$Sub_metering_2, type="l", col="red")
points(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), col=c("black",
                                                                                               "red", "blue"), lty=1, cex=0.75)
dev.copy(png, file="plot3.png")
dev.off()