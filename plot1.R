#Read the data
dat <- read.csv("household_power_consumption.txt", sep = ";")
#Leave only the relevant observations
dat$Date <- as.character(dat$Date)
dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]
#set global active power to numeric
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
#Open a PNG graphics device with 480x480 size
png("plot1.png", width = 480, height = 480, units = "px")
#Plot the histogram of global active power
hist(dat$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency")
#Save plot as PNG - closing the PNG graphics device
dev.off()



