plot2 <- function(){
  #Read in data
  MyData <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE )
  MyData$Date <- as.Date(strptime(MyData$Date, "%d/%m/%Y"))
  
  # pull only dates needed
  MyData <- MyData[(MyData$Date == "2007-02-01" |MyData$Date == "2007-02-02"),]
  
  #Convert to numeric
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  
  #open up PNG device and create plot.
  
  png(filename = "Plot2.png")
  with(MyData, plot(Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n"))
  axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
  dev.off()
  
}