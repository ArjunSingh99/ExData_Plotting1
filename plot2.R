#Reading the data
myPath <- "household_power_consumption.txt" #This is the path
myData <- read.table(myPath, header = TRUE, stringsAsFactors = FALSE, sep = ';') #Reading the data
myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",] #Subsetting the required data

#Plot
globalActivePow <- as.numeric(myData$Global_active_power)
dateAndTime <- strptime(paste(myData$Date, myData$Time, sep = ' '), "%d/%m/%Y %H:%M:%S") #Converting the date and time to strptime for the plot

png('plot2.png', width = 480, height = 480) #Setting device to png and specifying file dest

plot(dateAndTime, globalActivePow, xlab = " ", ylab = "Global Active Power (kilowatts)", type = 'l')

dev.off()
