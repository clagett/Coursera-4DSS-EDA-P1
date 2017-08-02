# read in the file
powerdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
# classify as date so easy to filer
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
# subsetted relevant dates
powerdated <- subset(powerdata, subset=(powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02"))

# combine date and time
datetime <- paste(as.Date(powerdated$Date), powerdated$Time)
powerdated$Datetime <- as.POSIXct(datetime)

# plot 2
with(powerdated, plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerdated, lines(Sub_metering_2 ~ Datetime, type = "l", col = "Red"))
with(powerdated, lines(Sub_metering_3 ~ Datetime, type = "l", col = "Blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saved to file & exit
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()