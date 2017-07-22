

Sys.setlocale("LC_TIME", "C")
setwd("~/Desktop/data analysis/Analysis")
PowerC = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
PowerC = subset(PowerC, Date == "1/2/2007" | Date == "2/2/2007")
PowerC$DT <- paste(PowerC$Date, PowerC$Time)
PowerC$Date = strptime(PowerC$DT, "%d/%m/%Y %H:%M:%S")
PowerC$Global_active_power = as.numeric(PowerC$Global_active_power)
PowerC$Sub_metering_1 = as.numeric(PowerC$Sub_metering_1)
PowerC$Sub_metering_2 = as.numeric(PowerC$Sub_metering_2)
PowerC$Sub_metering_3 = as.numeric(PowerC$Sub_metering_3)
PowerC$Voltage = as.numeric(PowerC$Voltage)
PowerC$Global_reactive_power = as.numeric(PowerC$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
par(mar=c(3,1,2,1))
plot(PowerC$Date,PowerC$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)")


plot(PowerC$Date,PowerC$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab="")

lines(PowerC$Date,PowerC$Sub_metering_2, col = "red")
lines(PowerC$Date,PowerC$Sub_metering_3, col = "blue")
legend('topright', c("Sub_Metering_1","Sub_Metering_3","Sub_Metering_3") , 
       lty=1, col=c("black","red","blue"), bty='n', cex=.45)

plot(PowerC$Date,PowerC$Voltage,type = "l", xlab ="datetime",ylab = "Voltage")

plot(PowerC$Date,PowerC$Global_reactive_power,type = "l", xlab ="datetime",ylab = "Global_reactive_Power")

dev.off()
