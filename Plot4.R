plot4 <- function(){
  #Read in data
  MyData <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE )
  MyData$Date <- as.Date(strptime(MyData$Date, "%d/%m/%Y"))
  
  # pull only dates needed
  MyData <- MyData[(MyData$Date == "2007-02-01" |MyData$Date == "2007-02-02"),]
  
  #Convert to numeric
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  MyData$Sub_metering_1 <- as.numeric(MyData$Sub_metering_1)
  MyData$Sub_metering_2 <- as.numeric(MyData$Sub_metering_2)
  
  #open up PNG device and create plot.
  
  png(filename = "Plot4.png")
  
  par(mfrow=c(2,2))
  #Plot 1
  with(MyData, plot(Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n"))
  axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
  
  #Plot2
  with(MyData, plot(Voltage, type="l", ylab = "Voltage", xlab = "datetime", xaxt="n"))
  axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
  
  
  #Plot3
  plot(MyData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", xaxt="n")
  lines(MyData$Sub_metering_2, type="l", col="red")
  lines(MyData$Sub_metering_3, type="l", col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty= c(1,1), bty="n", cex=.6)
  axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
  
  #Plot4
  with(MyData, plot(Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime", xaxt="n"))
  axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
  dev.off()
  
}