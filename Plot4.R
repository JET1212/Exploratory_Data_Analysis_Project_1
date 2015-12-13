hpc <- read.csv("household_power_consumption.txt", 
	stringsAsFactors=FALSE,
	header=TRUE, 
	sep=';', 
	na.strings="?",
	check.names=FALSE, 
	comment.char="", 
	quote='\"'
	)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

d <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

dt <- paste(as.Date(d$Date), d$Time)
d$Datetime <- as.POSIXct(dt)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(d, {
	plot(Global_active_power~Datetime, 
		type="l", 
		ylab="Global Active Power (kilowatts)", 
		xlab="")
	plot(Voltage~Datetime, 
		type="l", 
		ylab="Voltage (volt)", 
		xlab="")
	plot(Sub_metering_1~Datetime, 
		type="l", 
		ylab="Global Active Power (kilowatts)", 
		xlab="")
	lines(Sub_metering_2~Datetime,col='Red')
	lines(Sub_metering_3~Datetime,col='Blue')
	legend("topright", 
		col=c("black", "red", "blue"), 
		lty=1, 
		lwd=2, 
		bty="n",
		legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	)
	plot(Global_reactive_power~Datetime, 
		type="l", 
		ylab="Global Rective Power (kilowatts)",
		xlab="")
	}
)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()