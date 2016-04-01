## Read data into R
power <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset data for specified dates
pwr <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Combine Date and Time into new variable "datetime"
pwr$datetime <- strptime(paste(pwr$Date, pwr$Time), format="%d/%m/%Y %H:%M:%S")

## Set graphics device
png(filename="plot4.png")
par(mfrow = c(2, 2))

# Global active power
plot(pwr$datetime, pwr$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Voltage
plot(pwr$datetime, pwr$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Sub metering
plot(pwr$datetime, pwr$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pwr$datetime, pwr$Sub_metering_2, col = "red")
lines(pwr$datetime, pwr$Sub_metering_3, col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Global reactive power
plot(pwr$datetime, y=pwr$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

## Return to default graphics device
dev.off()