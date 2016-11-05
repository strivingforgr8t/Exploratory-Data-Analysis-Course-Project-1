data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
## read household power consumption data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
## subset the data for the dates 2007/2/1 and 2007/2/2
globalActivePower <- as.numeric(subsetData$Global_active_power)

## turns on the png graphic device
png(filename = "plot1.png", width = 480, height = 480)
## creates the histogram
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##turns off the png graphics device
dev.off()