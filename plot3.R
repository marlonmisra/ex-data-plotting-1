#read data
data_full <-read.table('household_power_consumption.txt', sep=";", header=T, colClasses = c(rep('character', 2), rep('numeric',7)), na.strings = "?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#subset data
data <- subset(data_full, data_full$Date == '2007-02-01' | data_full$Date == '2007-02-02')

#dates and times
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

#plotting
plot(data$Datetime,data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(data$Datetime,data$Sub_metering_2, type = "l", col = "red")
points(data$Datetime,data$Sub_metering_3, type = "l", col = "blue")

#legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save
dev.copy(png, file = "plot3.png")

#close
dev.off()