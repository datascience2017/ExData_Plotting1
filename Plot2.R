##Read the text file from working directory and then print the data
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
#subsetting data
mydata3 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#formatting data
Combineddatetime <- strptime(paste(mydata3$Date, mydata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#converting from factor to numeric
globalActivePower <- as.numeric(mydata3$Global_active_power)
png("plot2.png", width=480, height=480)
plot(Combineddatetime, globalActivePower, type="l", ylab="GlobalActive Power(kilowatts)", xlab="")
lines(Combineddatetime, globalActivePower, type="l")
lines(Combineddatetime, globalActivePower, type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
