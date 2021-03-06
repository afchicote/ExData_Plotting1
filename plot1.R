# Construction of plot1.png

## Read and prepare data
electricPowerConsumptionColNames <- read.table("./household_power_consumption.txt",
                                               nrows = 1, sep = ";", stringsAsFactors = FALSE)

electricPowerConsumption <- read.table("./household_power_consumption.txt",
                                       skip = 66637, nrows = 2880,
                                       sep = ";", na.strings = "?",
                                       col.names = as.character(electricPowerConsumptionColNames[1,]))

electricPowerConsumption$ComplenteDate <- strptime(paste(electricPowerConsumption$Date,
                                                         electricPowerConsumption$Time,
                                                         sep = " "),
                                                   format = "%d/%m/%Y %H:%M:%S")


## Plot
png(filename = "./plot1.png", width = 480, height = 480) # Open device

hist(electricPowerConsumption$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.off() # Close device



