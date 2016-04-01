## Read data into R
power <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset data for specified dates
pwr <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Combine Date and Time into new variable "datetime"
pwr$datetime <- strptime(paste(pwr$Date, pwr$Time), format="%d/%m/%Y %H:%M:%S")

## Set graphics device
png(filename="plot2.png")

## Create plot
plot(pwr$datetime, pwr$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Return to default graphics device
dev.off()