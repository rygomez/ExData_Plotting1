# plot2.R : Time Series of Global Active Power
# Data set available here > https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data,set serarator, set NA string, define column classes.  
data <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?',
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'))
# Convert dates
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")

# Subset on two days in February 2007                          
data <- subset(data, 
       as.Date(DateTime) >= as.Date("2007-02-01") & 
           as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot2.png
png("plot2.png", height=480, width=480)

# Build time series
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Close PNG file
dev.off()