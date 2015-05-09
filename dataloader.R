if (!exists("dataSubset")) {
   dataSubset <- NA
}

# This function loads the household power consumption data, prepare columns
# for plotting, subset to the first two days of Feb 2007, and cache the
# processed data in variable named `dataSubset`.
#
# To force data reload, pass in the `force` flag as an argument
loadData <- function(force=F) {
  if (!is.na(dataSubset) && !force) {
    return(dataSubset)
  }

  # This file is downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  unzip(file.path('data', 'exdata-data-household_power_consumption.zip'), exdir='data')
  data <- read.csv(file.path("data", "household_power_consumption.txt"), sep=";", na.strings="?")

  # format columns
  data$DateTime <-as.POSIXct(paste(data$Date, data$Time), format="%e/%m/%Y %H:%M:%S")
  data$Global_active_power <- as.numeric(data$Global_active_power)

  # subset to first two days of Feb
  dataSubset <<- data[data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime < as.POSIXct("2007-02-03"), ]
  dataSubset
}
