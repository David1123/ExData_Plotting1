
data <- read.table("household_power_consumption.txt", header = TRUE,
                   colClasses = c( rep('character',2), rep('numeric',7)), 
                   nrows = 2100000, sep = ";", na.strings = '?')

df <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

df$Date <- paste(df$Date, df$Time)
df$Time <- NULL
df$Date <- strptime(df$Date, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")

with(df, plot(Date,Global_active_power, type = "l",
              xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()