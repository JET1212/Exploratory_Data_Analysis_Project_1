hpc <- read.csv("household_power_consumption.txt", 
	stringsAsFactors=FALSE,
	sep=';',
	header=TRUE, 
	na.strings="?", 
	check.names=FALSE, 	 
	comment.char="", 
	quote='\"')

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

d <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

dt <- paste(as.Date(d$Date), d$Time)
d$Datetime <- as.POSIXct(dt)

hist(d$Global_active_power, 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", 
	ylab="Frequency", 
	col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()