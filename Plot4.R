##Read the text file from working directory and then print the data
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";")


mydata3 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Combineddatetime <- strptime(paste(mydata3$Date, mydata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#converting from factor to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(mydata3$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata3$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata3$Sub_metering_3)
Global_reactive_power <- as.numeric(mydata3$Global_reactive_power)
Voltage <- as.numeric(mydata3$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


#Plot1    
plot(Combineddatetime, globalActivePower, type="l", ylab="GlobalActive Power(kilowatts)", xlab="")
lines(Combineddatetime, globalActivePower, type="l")
lines(Combineddatetime, globalActivePower, type="l")

#Plot#3- voltage(y) vs datatime(x)
#png("plot_sample.png", width=480, height=480)
#par(mar=c(1,1,1,1))
plot(Combineddatetime, Voltage, type="l", ylab="Voltage", xlab="datetime")





#Plot#2
plot(Combineddatetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Combineddatetime, subMetering2, type="l", col="red")
lines(Combineddatetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot#4- Global Reactive Power(y) vs datatime(x)
plot(Combineddatetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()


