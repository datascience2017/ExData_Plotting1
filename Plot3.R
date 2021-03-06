
##Read the text file from working directory and then print the data
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
#subsetting data
mydata3 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#formatting data
Combineddatetime <- strptime(paste(mydata3$Date, mydata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#converting from factor to numeric
globalActivePower <- as.numeric(mydata3$Global_active_power)

Sub_metering_1 <- as.numeric(mydata3$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata3$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata3$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(Combineddatetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Combineddatetime, Sub_metering_2, type="l", col="red")
lines(Combineddatetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
