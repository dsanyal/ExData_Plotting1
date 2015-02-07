##Read in the data with read.table. One can also use fread from data.table package which is faster but for this problem read.table is good enough.
data<-read.table(file = "household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?",nrows=2075259, stringsAsFactors = FALSE)

# Convert the 1st column to objects of Date class.
data[,1]<-as.Date(data$Date, format = "%d/%m/%Y")

#Extract the data for the required two days only.
data_sub<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

png("plot1.png",width = 480, height = 480)  #opens the graphics device (png)
with(data_sub, hist(data_sub$Global_active_power ,main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="red"))
dev.off()    # Closes the graphics device