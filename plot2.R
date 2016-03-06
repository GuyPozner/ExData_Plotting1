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
#set global active power to numeric
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
#Open a PNG graphics device with 480x480 size
png("plot2.png", width = 480, height = 480, units = "px")
#Plot the Global active power vs. absoulute time
plot(dat$formatedTime,dat$Global_active_power,
     type = "n",
     ylab = "Global Active Power(kilowatts)",
     xlab = "")
lines(dat$formatedTime,dat$Global_active_power)
#Save plot as PNG - closing the PNG graphics device
dev.off()