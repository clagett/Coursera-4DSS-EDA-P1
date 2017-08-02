# read in the file
powerdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
# classify as date so easy to filer
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
# subsetted relevant dates
powerdated <- subset(powerdata, subset=(powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02"))

# plot #1
hist(as.numeric(powerdated$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")

#saved to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()