data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
## read household power consumption data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## subset the data for the dates 2007/2/1 and 2007/2/2

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## plot 1
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## plot 2
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## plot 3
plot(datetime, subMetering1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(datetime, type = "l", subMetering2, col = "red")
lines(datetime, type = "l", subMetering3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 3, col = c("black","red","blue"), bty = "n" )

## plot 4
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")

dev.off()


