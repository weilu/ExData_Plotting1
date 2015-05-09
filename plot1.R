source('dataloader.R')
data <- loadData()

hist(data$Global_active_power, freq=T, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")

# save the plot as png
dev.copy(png, file = file.path("output", "plot1.png"))
dev.off()
