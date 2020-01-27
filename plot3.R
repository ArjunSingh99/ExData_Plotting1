#Reading the data
myPath <- "household_power_consumption.txt" #This is the path
myData <- read.table(myPath, sep = ";", stringsAsFactors = FALSE, header = TRUE) #Reading the data
myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",] #Subsetting the required data

#Plot
dateAndTime <- strptime(paste(myData$Date, myData$Time, sep = ' '), "%d/%m/%Y %H:%M:%S") #Converting the date and time to strptime for the plot
globalActivePow <- as.numeric(myData$Global_active_power)
subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

png('plot3.png', width = 480, height = 480)

plot(dateAndTime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(dateAndTime, subMetering2, type = "l", col = 'red')
lines(dateAndTime, subMetering3, type = "l", col = 'blue')
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black','red','blue'), lty = 1, lwd = 1)

dev.off()


