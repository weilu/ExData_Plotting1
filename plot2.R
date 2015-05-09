# This file is downloaded & unzipped from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.csv(file.path("data", "household_power_consumption.txt"), sep=";", na.strings="?")

# format columns
data$DateTime <-as.POSIXct(paste(data$Date, data$Time), format="%e/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset to first two days of Feb
dataSubset <- data[data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime < as.POSIXct("2007-02-03"), ]

# plot and save as png
plot(dataSubset$DateTime, dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (killowatts)")
dev.copy(png, file = file.path("output", "plot2.png"))
dev.off()
