source('dataloader.R')
data <- loadData()

# plot energy sub metering lines
with(data, plot(data$DateTime, data$Sub_metering_1, type = "n", xlab="", ylab = "Engergy sub metering"))
with(data, lines(data$DateTime, data$Sub_metering_1, col = "black"))
with(data, lines(data$DateTime, data$Sub_metering_2, col = "red"))
with(data, lines(data$DateTime, data$Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save the plot as png
dev.copy(png, file = file.path("output", "plot3.png"))
dev.off()
