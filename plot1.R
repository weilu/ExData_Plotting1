# This file is downloaded & unzipped from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.csv(file.path("data", "household_power_consumption.txt"), sep=";", na.strings="?")

# format columns
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset to first two days of Feb
dataSubset <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# plot and save as png
hist(dataSubset$Global_active_power, freq=T, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")
dev.copy(png, file = file.path("output", "plot1.png"))
dev.off()
