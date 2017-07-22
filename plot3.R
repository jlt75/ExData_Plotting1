

Sys.setlocale("LC_TIME", "C")
setwd("~/Desktop/data analysis/Analysis")
PowerC = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
PowerC = subset(PowerC, Date == "1/2/2007" | Date == "2/2/2007")
PowerC$DT <- paste(PowerC$Date, PowerC$Time)
PowerC$Date = strptime(PowerC$DT, "%d/%m/%Y %H:%M:%S")
PowerC$Sub_metering_1 = as.numeric(PowerC$Sub_metering_1)
PowerC$Sub_metering_2 = as.numeric(PowerC$Sub_metering_2)
PowerC$Sub_metering_3 = as.numeric(PowerC$Sub_metering_3)
png("plot3.png", width=480, height=480)
par(mfrow=c(1,1))
par(mar=c(3,4,3,11))
plot(PowerC$Date,PowerC$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab="")
lines(PowerC$Date,PowerC$Sub_metering_2, col = "red")
lines(PowerC$Date,PowerC$Sub_metering_3, col = "blue")
legend('topright', c("Sub_Metering_1","Sub_Metering_3","Sub_Metering_3") , 
       lty=1, col=c("black","red","blue"), bty='y', cex=.75)

dev.off()


