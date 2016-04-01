## Read data into R
power <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset data for specified dates
pwr <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Set graphics device
png(filename="plot1.png")

## Create plot
hist(pwr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Return to default graphics device
dev.off