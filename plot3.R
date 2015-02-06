data<-read.table(file = "household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?",nrows=2075259)

data_sub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007" & !is.na(data$Global_active_power))

data_sub[[1]] <- strptime(paste(data_sub$Date,data_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480, height = 480)
with(data_sub, {
              plot(Date, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
              lines(Date, Sub_metering_2, type="l", col = "red")
              lines(Date, Sub_metering_3, type="l", col = "blue")
              legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
})
dev.off()