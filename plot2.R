# read all the data
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
# convert to Date format
fulldata$Date<-strptime(paste(fulldata$Date, fulldata$Time), format="%d/%m/%Y %H:%M:%S")

#subset the rows of interest
data<-subset(fulldata, fulldata$Date>="2007-02-01" & fulldata$Date<"2007-02-03")
par(mfrow=c(1,1))

#create and save Plot2
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()