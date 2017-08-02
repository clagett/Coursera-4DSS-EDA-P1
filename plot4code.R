# read in the file
powerdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
# classify as date so easy to filer
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
# subsetted relevant dates
powerdated <- subset(powerdata, subset=(powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02"))

# combine date and time
datetime <- paste(as.Date(powerdated$Date), powerdated$Time)
powerdated$Datetime <- as.POSIXct(datetime)

# plot 4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#plot Upper left
with(powerdated, plot(Global_active_power~Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab=""))
#plot Lower left
with(powerdated, plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerdated, lines(Sub_metering_2 ~ Datetime, type = "l", col = "Red"))
with(powerdated, lines(Sub_metering_3 ~ Datetime, type = "l", col = "Blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot Upper right
with(powerdated, plot(Voltage~Datetime, type="l", 
     ylab="Voltage (volt)", xlab=""))
#plot Lower right
with(powerdated, plot(Global_reactive_power~Datetime, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab=""))

#saved to file & exit
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()