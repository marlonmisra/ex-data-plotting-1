#read data
data <-read.table('household_power_consumption.txt', sep=";", header=T, colClasses = c(rep('character', 2), rep('numeric',7)), na.strings = "?")

#subset data
data_subset <- subset(data, data$Date == c('1/2/2007') | data$Date == c('2/2/2007'))

#plotting
hist(data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

#save
dev.copy(png, file = "plot1.png")

#close
dev.off()