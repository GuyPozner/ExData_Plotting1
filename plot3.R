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
#Set all sub metering variables to numeric
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))
#Open a PNG graphics device with 480x480 size
png("plot3.png", width = 480, height = 480, units = "px")
#Plot the Sub_metering vs. absoulute time
plot(dat$formatedTime,dat$Sub_metering_1,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat$formatedTime,dat$Sub_metering_1)
lines(dat$formatedTime,dat$Sub_metering_2, col = "red")
lines(dat$formatedTime,dat$Sub_metering_3, col = "blue")
legend("topright",legend = names(dat[7:9]), lty = c(1,1,1), col = c("black", "blue", "red"))
#Save plot as PNG - closing the PNG graphics device
dev.off()