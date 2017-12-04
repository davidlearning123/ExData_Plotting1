temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
mydata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")
unlink(temp)

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

subset<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]


subset$Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

png(file = "plot3.png")
plot(subset$Sub_metering_1, type="l", ylab = "Energy sub metering", col = "black", xaxt = "n")
lines(subset$Sub_metering_2, col="red", xaxt = "n")
lines(subset$Sub_metering_3, col="blue", xaxt = "n")

legend("topright", lwd = c(2,2), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()