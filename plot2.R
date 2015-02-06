data<-read.table(file = "household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?",nrows=2075259)

data_sub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007" & !is.na(data$Global_active_power))

data_sub[[1]] <- strptime(paste(data_sub$Date,data_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480, height = 480)
with(data_sub, plot(Date, Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
