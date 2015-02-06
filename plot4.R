data<-read.table(file = "household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?",nrows=2075259)

data_sub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007" & !is.na(data$Global_active_power))

data_sub[[1]] <- strptime(paste(data_sub$Date,data_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(data_sub, {
  plot(Date, Global_active_power, main = "", xlab = "", ylab = "Global Active Power", type = "l")
  plot(Date, Voltage, main = "", xlab = "datetime", ylab = "Voltage", type = "l")
  plot(Date, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
  lines(Date, Sub_metering_2, type="l", col = "red")
  lines(Date, Sub_metering_3, type="l", col = "blue")
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
  plot(Date, Global_reactive_power, main = "", xlab = "datetime", type = "l")
})
dev.off()