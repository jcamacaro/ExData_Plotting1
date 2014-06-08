##
# clean memory then set directory and read the data
##
rm(list = ls())
##setwd("~/Documents/Coursera/explor_data_analisis/week_1/project")
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
##
# plot 2
##
plot(x=subDat$comTime, y= subDat$Global_active_power, type='l', xlab="Datetime", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
