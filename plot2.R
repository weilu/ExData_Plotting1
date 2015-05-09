source('dataloader.R')
data <- loadData()

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (killowatts)")

# save the plot as png
dev.copy(png, "plot2.png")
dev.off()
