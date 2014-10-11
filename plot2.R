#read data
data_full <-read.table('household_power_consumption.txt', sep=";", header=T, colClasses = c(rep('character', 2), rep('numeric',7)), na.strings = "?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#subset data
data <- subset(data_full, data_full$Date == '2007-02-01' | data_full$Date == '2007-02-02')

#dates and times
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

#plotting
plot(data$Datetime, data$Global_active_power, type='l', xlab= "", ylab = "Global Active Power (kilowatts)")

#save
dev.copy(png, file = "plot2.png")

#close
dev.off()