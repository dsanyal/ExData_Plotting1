##Read in the data with read.table. One can also use fread from data.table package which is faster but for this problem read.table is good enough.
data<-read.table(file = "household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?",nrows=2075259, stringsAsFactors = FALSE)

#Extract the data for the required two days only.
data_sub<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Now combine the 1st and 2nd columns and store it in the Date column by converting it into a POSIXlt object.
data_sub[[1]] <- strptime(paste(data_sub$Date,data_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480, height = 480)  #opens the graphics device (png)
with(data_sub, plot(Date, Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()  # Closes the graphics device
