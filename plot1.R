# read all the data
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
# convert to Date format
fulldata$Date<-strptime(paste(fulldata$Date, fulldata$Time), format="%d/%m/%Y %H:%M:%S")

#subset the rows of interest
data<-subset(fulldata, fulldata$Date>="2007-02-01" & fulldata$Date<"2007-02-03")
par(mfrow=c(1,1))
#create and save Plot1
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()