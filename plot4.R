subset$Global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))
subset$Voltage <- as.numeric(as.character(subset$Voltage))

png(file = "plot4.png")

par(mfrow = c(2,2))

plot(subset$Global_active_power, type="l", ylab = "Global Active Power", xaxt = "n")

plot(subset$Voltage, type="l", xlab="datetime", ylab = "Voltage", xaxt = "n")

plot(subset$Sub_metering_1, type="l", ylab = "Energy sub metering", col = "black", xaxt = "n")
lines(subset$Sub_metering_2, col="red")
lines(subset$Sub_metering_3, col="blue")
legend("topright", lwd = c(2,2), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subset$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power", xaxt = "n")

dev.off()