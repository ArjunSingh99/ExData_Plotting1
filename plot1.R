#Reading the data
myPath <- "household_power_consumption.txt" #This is the path
myData <- read.table(mypath, header = TRUE, sep = ';', stringsAsFactors = FALSE) #Reading the data
myData <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007",] #Subsetting the required data

#Plot
globalActivePow <- as.numeric(myData$Global_active_power)

png("plot1.png", width = 480, height = 480) #Setting device to png and specifying file dest

hist(globalActivePow, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 'red')

dev.off() #Close device
