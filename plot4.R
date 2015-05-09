source('dataloader.R')
data <- loadData()

par(mfcol = c(2, 2))

with(data, {
     # global active power
     plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

     # sub metering
     plot(data$DateTime, data$Sub_metering_1, type = "n", xlab="", ylab = "Engergy sub metering")
     lines(data$DateTime, data$Sub_metering_1, col = "black")
     lines(data$DateTime, data$Sub_metering_2, col = "red")
     lines(data$DateTime, data$Sub_metering_3, col = "blue")
     legend("topright", lty = 1, box.col = "transparent", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

     # voltage
     plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

     # global reactive power
     plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

# save the plot as png
dev.copy(png, "plot4.png")
dev.off()
