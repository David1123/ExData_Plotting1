
data <- read.table("household_power_consumption.txt", header = TRUE,
                   colClasses = c( rep('character',2), rep('numeric',7)), 
                   nrows = 2100000, sep = ";", na.strings = '?')

df <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

df$Date <- paste(df$Date, df$Time)
df$Time <- NULL
df$Date <- strptime(df$Date, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")

with(df, {
    par(mfrow = c(2,2))
    
    plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    plot(Date, Voltage, type = "l", xlab = "", ylab = "Voltage")

    plot(Date,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Date, Sub_metering_2, col = "red")
    lines(Date, Sub_metering_3, col = "blue") 
    legend("topright", legend = names(df)[6:8], col = c("black","red","blue"), lty = 1, bty = "n")

    plot(Date, Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power")
} )


dev.off()