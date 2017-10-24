##Read the text file from working directory and then print the data
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
#subsetting data
mydata3 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#formatting data
Combineddatetime <- strptime(paste(mydata3$Date, mydata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#converting from factor to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(mydata3$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata3$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata3$Sub_metering_3)
Global_reactive_power <- as.numeric(mydata3$Global_reactive_power)
Voltage <- as.numeric(mydata3$Voltage)
# plotting the graph area
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot1  - Global Active Power  vs Day
plot(Combineddatetime, globalActivePower, type="l", ylab="GlobalActive Power", xlab="")
lines(Combineddatetime, globalActivePower, type="l")
lines(Combineddatetime, globalActivePower, type="l")

#Plot#2 - Voltage vs date and time
plot(Combineddatetime, Voltage, type="l", ylab="Voltage", xlab="datetime")

#Plot#3- Energy Submetering vs day
plot(Combineddatetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Combineddatetime, Sub_metering_2, type="l", col="red")
lines(Combineddatetime, Sub_metering_3, type="l", col="blue")

#Plot#4- Global Reactive Power(y) vs datatime(x)
plot(Combineddatetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()



