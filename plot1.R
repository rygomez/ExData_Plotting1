# plot1.R : Histogram of Global Active Power

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

# Open plot1.png
png("plot1.png", height=480, width=480)

# Build histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()