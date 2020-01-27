#Reading the data
myPath <- "household_power_consumption.txt" #This is the path
myData <- read.table(mypath, header = TRUE, stringsAsFactors = FALSE, sep = ';') #Reading the data
myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",] #Subsetting the required data

#Plot

#First, get the required parameters
dateAndTime <- strptime(paste(myData$Date, myData$Time, sep = ' '), "%d/%m/%Y %H:%M:%S") #Converting the date and time to strptime for the plot
globalActivePow <- as.numeric(myData$Global_active_power)
globalReactivePow <- as.numeric(myData$Global_reactive_power)
vtg <- as.numeric(myData$Voltage)
subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

#Now, plot to PNG device
png('plot4.png', width = 480, height = 480)

par(mfrow = c(2, 2)) #To plot 4 graphs in a 2x2 fashion

#First graph:
plot(dateAndTime, globalActivePow, xlab = "", ylab = "Global Active Power", type = "l")

#Second graph:
plot(dateAndTime, vtg, xlab = "datetime", ylab = "Voltage", type = "l")

#Third graph:
plot(dateAndTime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(dateAndTime, subMetering2, col = 'red')
lines(dateAndTime, subMetering3, col = 'blue')
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty = 1, lwd = 1, bty = 'n')

#Fourth graph:
plot(dateAndTime, globalReactivePow, xlab = 'datetime', ylab = "Global_reactive_power", type = "l")

dev.off()

