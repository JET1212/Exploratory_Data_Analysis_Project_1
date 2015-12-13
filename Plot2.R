hpc <- read.csv("household_power_consumption.txt", 
	stringsAsFactors=FALSE,
	header=TRUE, 
	sep=';', 
	na.strings="?",
	check.names=FALSE, 
	comment.char="", 
	quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

d <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

dt <- paste(as.Date(d$Date), d$Time)
d$Datetime <- as.POSIXct(dt)

plot(d$Global_active_power~d$Datetime, 
	type="l",
	ylab="Global Active Power (kilowatts)", 
	xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()