##Read the text file from working directory
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
#Formatting date 
#Read from dates 2007-02-01 and 2007-02-02, hence subsetting data
mydata2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(mydata2$Global_active_power)
head(globalActivePower)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
