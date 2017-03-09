##Read the text file from working directory and then print the data
mydata<- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Formatting date
mydata$Date <- as.Date(mydata$Date,format("%d/%m/%Y"))
head(mydata,3)
#Read from dates 2007-02-01 and 2007-02-02, hence subsetting data
mydata2 <- subset(mydata,mydata$Date >="2007-02-01" & mydata$Date <="2007-02-01")
head(mydata2,3)
Global_active_power<- as.numeric(mydata2$Global_active_power)
Global_active_power <- Global_active_power/1000
png("plot1.png", width=480, height=480)
hist(Global_active_power,col="red",xlab= "GlobalActive Power(kilowatts)", breaks=15,las=1,ylim = c(0,1200), xlim=c(0,4), main="Global Active Power")
dev.off()
