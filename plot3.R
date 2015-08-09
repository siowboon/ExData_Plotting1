##
## This function plots chart 3 of project 1 under "Exploratory Data Analysis" course 
##
plot3 <- function() { 
   
   ## Read household power consumption data and extract data under the specified range of dates
   pwConData <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
   pwConData <- subset(pwConData, Date == "1/2/2007" | Date == "2/2/2007")
   
   ## Convert the date and time from character to POSIXlt
   dateTime <- paste(pwConData$Date, pwConData$Time, sep=" ")
   dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
   
   ## Convert the sub-metering variables to numeric
   subMeter1 <- as.numeric(pwConData$Sub_metering_1)
   subMeter2 <- as.numeric(pwConData$Sub_metering_2)
   subMeter3 <- as.numeric(pwConData$Sub_metering_3)
   
   ## Open the png device and create the file in the current working directory
   png(file="plot3.png", width=480, height=480)
   
   ## Plot the chart
   plot(dateTime, subMeter1, type="l", xlab="",
        ylab="Energy sub metering", col="black")
   points(dateTime, subMeter2, type="l", col="red")
   points(dateTime, subMeter3, type="l", col="blue")
   legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
          col=c("black", "red", "blue"), lty="solid")
      
   ## Save the chart to the png file
   dev.off()
}   
