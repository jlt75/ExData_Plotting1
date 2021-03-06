

Sys.setlocale("LC_TIME", "C")
setwd("~/Desktop/data analysis/Analysis")
PowerC = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
PowerC = subset(PowerC, Date == "1/2/2007" | Date == "2/2/2007")
PowerC$DT <- paste(PowerC$Date, PowerC$Time)
PowerC$Date = strptime(PowerC$DT, "%d/%m/%Y %H:%M:%S")
PowerC$Global_active_power = as.numeric(PowerC$Global_active_power)
png("plot2.png", width=480, height=480)
par(mar=c(3,4,1,6))
plot(PowerC$Date,PowerC$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

