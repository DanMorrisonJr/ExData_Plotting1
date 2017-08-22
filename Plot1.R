plot1 <- function(){
  #Read in data
  MyData <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE )
  MyData$Date <- as.Date(strptime(MyData$Date, "%d/%m/%Y"))
  
  # pull only dates needed
  MyData <- MyData[(MyData$Date == "2007-02-01" |MyData$Date == "2007-02-02"),]
  
  #Convert to numeric
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  
  #open up PNG device and create plot.
  
  png(filename = "Plot1.png")
  hist(MyData$Global_active_power, col="red", xlab ="Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
  
}