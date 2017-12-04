temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
mydata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")
unlink(temp)

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

subset<-mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]


subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))

png(file = "plot2.png")
plot(subset$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)")
dev.off()