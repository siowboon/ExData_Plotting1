##
## This function plots chart 2 of project 1 under "Exploratory Data Analysis" course 
##
plot2 <- function() { 
   
   ## Read household power consumption data and extract data under the specified range of dates
   pwConData <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
   pwConData <- subset(pwConData, Date == "1/2/2007" | Date == "2/2/2007")
   
   ## Convert the date and time from character to POSIXlt
   dateTime <- paste(pwConData$Date, pwConData$Time, sep=" ")
   dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
   
   ## Convert the variable Global_active_power to numeric
   globalActivePower <- as.numeric(pwConData$Global_active_power)
   
   ## Open the png device and create the file in the current working directory
   png(file="plot2.png", width=480, height=480)

   ## Plot the chart
   plot(dateTime, globalActivePower, type="l", xlab="",
        ylab="Global Active Power (kilowatts)")
   
   ## Save the chart to the png file
   dev.off()
}   
