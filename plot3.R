# plot3.R : Time Series of Global Active Power by submeter
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

# Open plot3.png
png("plot3.png", height=480, width=480)

# Build time series
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()
