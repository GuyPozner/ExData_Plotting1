#Read the data
dat <- read.csv("household_power_consumption.txt", sep = ";")

#Leave only the relevant observations
dat$Date <- as.character(dat$Date)
dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

#Add a time series column to filtered data
dat$Time <- as.character(dat$Time)
tempTime <- paste(dat$Date, dat$Time)
tempTime <- strptime(tempTime, format = "%d/%m/%Y %H:%M:%S")
dat$formatedTime <- tempTime

#Set all relevant variables to numeric
dat[,3:9] <- sapply(dat[,3:9], as.character)
dat[,3:9] <- sapply(dat[,3:9], as.numeric)

#Open a PNG graphics device with 480x480 size
png("plot4.png", width = 480, height = 480, units = "px")

#Layout as 2-by-2
par(mfcol = c(2,2))

#Plot the Global active power vs. absoulute time
plot(dat$formatedTime,dat$Global_active_power,
     type = "n",
     ylab = "Global Active Power(kilowatts)",
     xlab = "")
lines(dat$formatedTime,dat$Global_active_power)

#Plot sub_metering vs. absoulute time
plot(dat$formatedTime,dat$Sub_metering_1,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat$formatedTime,dat$Sub_metering_1)
lines(dat$formatedTime,dat$Sub_metering_2, col = "red")
lines(dat$formatedTime,dat$Sub_metering_3, col = "blue")
legend("topright",legend = names(dat[7:9]), lty = c(1,1,1), col = c("black", "blue", "red"))

#Plot voltage vs. absoulute time
plot(dat$formatedTime,dat$Voltage,
     type = "n",
     ylab = "Voltage",
     xlab = "datetime")
lines(dat$formatedTime,dat$Voltage)

#Plot Global_reactive_power vs. absoulute time
plot(dat$formatedTime,dat$Global_reactive_power,
     type = "n",
     ylab = "Voltage",
     xlab = "datetime")
lines(dat$formatedTime,dat$Global_reactive_power)


#Save plot as PNG - closing the PNG graphics device
dev.off()