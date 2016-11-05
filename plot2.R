data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
## read household power consumption data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## subset the data for the dates 2007/2/1 and 2007/2/2

## convert data formats
globalActivePower <- as.numeric(subsetData$Global_active_power)
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## turn on png graphics device
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()