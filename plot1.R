##
## This function plots chart 1 of project 1 under "Exploratory Data Analysis" course 
##
plot1 <- function() { 
   
   ## Read household power consumption data and extract data under the specified range of dates
   pwConData <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
   pwConData <- subset(pwConData, Date == "1/2/2007" | Date == "2/2/2007")
   
   ## Convert the variable Global_active_power to numeric
   globalActivePower <- as.numeric(pwConData$Global_active_power)
   
   ## Open the png device and create the file in the current working directory
   png(file="plot1.png", width=480, height=480)

   ## Plot the chart
   hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)",
        ylab="Frequency", ylim=c(0, 1200), col="red")
   
   ## Save the chart to the png file
   dev.off()
}   
