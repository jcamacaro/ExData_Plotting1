plot3 <- function() {
  ##
  # clean memory then set directory and read the data
  ##
  rm(list = ls())
  dat <- read.csv('./data/household_power_consumption.txt', sep=';', na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  ##
  # Convert the date to the correct format 
  ##
  dat$Date <- as.Date(strptime(dat$Date,format='%d/%m/%Y'), format='%Y/%m/%d')
  dat$comTime <- paste(dat$Date, dat$Time)
  dat$comTime <- strptime(dat$comTime,format="%Y-%m-%d %H:%M:%S")
  # Subset the data to work after this step the data is ready to work the project
  ##
  subDat <- subset(dat, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  par(mfrow = c(1, 1))
  with(subDat, plot(comTime, Sub_metering_1, type='l', ylab="Energy sub metering",xlab="Date-time",))
  with(subDat, lines(comTime, Sub_metering_2, type='l', col="red"))
  with(subDat, lines(comTime, Sub_metering_3, type='l', col="blue"))
  legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.55)
  dev.copy(png, file = "plot3.png")
  dev.off()
}

plot3()
