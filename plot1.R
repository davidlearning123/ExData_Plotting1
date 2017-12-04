temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
mydata <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep = ";")
unlink(temp)


subset<-mydata[(mydata$Date == "2007-02-01") | (mydata$Date == "2007-02-02"),]
subset$Date <- format(subset$Date, "%a")

subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))

png(file = "plot1.png")
hist(subset$Date, subset$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()
