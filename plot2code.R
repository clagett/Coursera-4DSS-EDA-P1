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
plot(powerdated$Global_active_power ~ powerdated$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#saved to file & exit
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()