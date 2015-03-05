
data <- read.table("household_power_consumption.txt", header = TRUE,
                 colClasses = c( rep('character',2), rep('numeric',7)), 
                 nrows = 2100000, sep = ";", na.strings = '?')

df <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename = "plot1.png")

with(df, hist(Global_active_power, breaks = 12, col = "red",
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power") )

dev.off()
