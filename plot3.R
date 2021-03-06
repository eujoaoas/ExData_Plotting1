bd <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
FullTimeDate <- strptime(paste(bd$Date, bd$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
bd <- cbind(bd, FullTimeDate)
bd$Date <- as.Date(bd$Date, format="%d/%m/%Y")
bd$Time <- format(bd$Time, format="%H:%M:%S")
bd$Global_active_power <- as.numeric(bd$Global_active_power)
bd$Global_reactive_power <- as.numeric(bd$Global_reactive_power)
bd$Voltage <- as.numeric(bd$Voltage)
bd$Global_intensity <- as.numeric(bd$Global_intensity)
bd$Sub_metering_1 <- as.numeric(bd$Sub_metering_1)
bd$Sub_metering_2 <- as.numeric(bd$Sub_metering_2)
bd$Sub_metering_3 <- as.numeric(bd$Sub_metering_3)            
subsetdata <- subset(bd, Date == "2007-01-02" | Date == "2007-02-02")
png("plot3.png", width = 480, height = 480)
with(subsetdata, plot(FullTimeDate, Sub_metering_1, type = "l", xlab = "Day", ylab = "Energy Sub Metering"))
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2, type = "l", col = "red")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c ("Sub_Metering1", "Sub_Metering2", "Sub_Metering3"), lty = 1, lwd = 2, 
       col = c("black", "red", "blue"))
dev.off()

